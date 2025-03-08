(function () {
  "use strict";

  // =====================================================
  // 전역 변수 선언
  // =====================================================
  const userId = sessionStorage.getItem("userId");
  let currentCrNo = null;         // 현재 채팅방 ID
  let stompClient = null;         // STOMP 클라이언트
  let subscriptions = {};         // 모든 구독을 관리
  let reconnectAttempts = 0;      // 재연결
  let currentPage = 0;            // 현재 페이지

  // =====================================================
  // WebSocket 연결 및 STOMP 초기화 (자동 재연결 추가)
  // =====================================================
  function connectWebSocket() {
    const socket = new SockJS("/ws/chat");
    stompClient = Stomp.over(socket);

    stompClient.connect({}, function (frame) {
      console.log("WebSocket 연결 성공:", frame);
      reconnectAttempts = 0;

      // 현재 열람 중인 방이 있다면 구독
      if (currentCrNo) {
        subscribeToChatRoom(currentCrNo);
      }

      // 전역 알림: 새 메시지 → 채팅방 목록 갱신
      stompClient.subscribe("/topic/chat/unread/update", function (message) {
        const body = message.body;
        console.log("전역 새 메시지 알림 수신:", body);
        if (body === "UPDATE_CHAT_LIST") {
          loadChatRooms();
        }
      });
    }, function (error) {
      console.error("WebSocket 연결 실패:", error);
      setTimeout(connectWebSocket, Math.min(5000 * (2 ** reconnectAttempts), 30000));
      reconnectAttempts++;
    });
  }


  // =====================================================
  // 채팅방 구독 (메시지 수신 처리 포함)
  // =====================================================
  function subscribeToChatRoom(crNo) {
    if (!stompClient || !crNo) {
      console.error("구독 실패 - WebSocket 연결/채팅방 ID 확인");
      return;
    }

    const subscriptionUrl = `/topic/chatroom/${crNo}`;

    // 기존 구독 해제
    if (subscriptions[crNo]) {
      subscriptions[crNo].unsubscribe();
      delete subscriptions[crNo];
    }

    // 새 구독 등록
    subscriptions[crNo] = stompClient.subscribe(subscriptionUrl, function (message) {
      const msgData = JSON.parse(message.body);
      console.log("새 메시지 수신:", msgData);

      // 초대 메시지 등 별도 처리
      if (msgData.type === "INVITE") {
        console.log("초대 메시지:", msgData);
        displaySystemMessage("새 사용자가 초대되었습니다.");
        loadChatRooms();
        return;
      }

      // 현재 열람 중인 방과 일치하는지 체크
      if (currentCrNo !== crNo) {
        console.warn(`다른 방(${crNo}) 메시지이므로 표시 안함`);
        return;
      }

      // 중복 메시지 방지
      if ($(`.chats[data-cmno="${msgData.cmNo}"]`).length > 0) {
        console.warn("중복 메시지 무시:", msgData.cmNo);
        return;
      }

      // 메시지 표시
      displayMessage(msgData);

      // 자동 읽음 처리
      markMessagesAsRead(crNo, function() {
        loadChatRooms();
      });
      updateUnreadBadge(crNo);
    });

    console.log("채팅방 구독 완료:", subscriptionUrl);
  }

  // =====================================================
  // 최신 메시지 ID를 서버에서 가져오는 함수
  // =====================================================
  function fetchLatestMessageId(crNo, callback) {
    $.ajax({
      url: `/chat/${crNo}/latestMessage`,
      type: "GET",
      success: function(response) {
        callback(response.latestCmNo || 0);
      },
      error: function (err) {
        console.error("최신 메시지 번호 조회 실패:", err);
        callback(0);
      }
    });
  }

  // =====================================================
  // 채팅방 열기 및 데이터 로드 (메시지, UI 업데이트 등)
  // 사용자가 채팅방에 직접 들어갔을 때만 읽음 처리
  // =====================================================
  function openChatRoom(crNo) {
    console.log("🔍 채팅방 선택됨, ID:", crNo);
  
    // 1) 이미 같은 채팅방이면 중복 입장 방지
    if (currentCrNo === crNo) {
      console.warn(`⚠️ 이미 채팅방 ${crNo}에 입장 중입니다.`);
      return;
    }
  
    // 2) 이전 채팅방 구독 해제
    if (currentCrNo && subscriptions[currentCrNo]) {
      console.log(`🔌 이전 채팅방(${currentCrNo}) 구독 해제`);
      subscriptions[currentCrNo].unsubscribe();
      delete subscriptions[currentCrNo];
    }
  
    // 3) 새로운 채팅방으로 Ajax 요청
    $.ajax({
      type: "GET",
      url: `/chat/room/${crNo}`,
      success: function (response) {
        console.log("✅ 채팅방 데이터 응답:", response);
  
        // 현재 채팅방 갱신
        currentCrNo = response.crNo;
        $("#chatTitle").text(response.crTitle);
        $(".messages").empty();
        $("#systemMessages").empty();

        // 메시지 로드
        loadChatHistory(currentCrNo, 0, function () {
          if (currentCrNo === crNo) {
            markMessagesAsRead(currentCrNo, function() {
              loadChatRooms();
            });
          }
        });
  
        // 4) 새 채팅방 구독
        subscribeToChatRoom(currentCrNo);
        // 5) UI 강조 처리
        highlightActiveChatRoom(currentCrNo);
      },
      error: function (error) {
        console.error("🚨 채팅방 로드 실패:", error);
      }
    });
  
    // 새 채팅방 선택 시, 해당 방의 unread-badge 제거
    updateUnreadBadge(crNo);
  }
  

  // =====================================================
  // 서버에 읽음 처리 요청하는 함수
  // =====================================================
 function markMessagesAsRead(crNo, callback) {
    fetchLatestMessageId(crNo, function(latestCmNo) {
      $.ajax({
        url: `/chat/${crNo}/participant/${userId}/lastRead`,
        type: "PUT",
        contentType: "application/json",
        data: JSON.stringify({ cmNo: latestCmNo }),
        success: function (res) {
          console.log(`읽음 처리 완료(${crNo}):`, res);
          if (callback) callback();
        },
        error: function (err) {
          console.error("읽음 처리 실패:", err);
        }
      });
    });
  }

  // =====================================================
  // 가장 최근 메시지 ID를 가져오는 함수
  // =====================================================
  function getLastMessageId(crNo) {
    let lastMessageElement = $(".messages .chats").last();
    let lastMessageId = lastMessageElement.data("cmno") || 0;
    console.log(`🔍 채팅방(${crNo})의 최신 메시지 ID: ${lastMessageId}`);
    return lastMessageId;
  }

  // =====================================================
  // 활성 채팅방 UI 강조
  // =====================================================
  function highlightActiveChatRoom(crNo) {
    $(".chat-user-list").removeClass("active");
    $(`.chat-user-list[data-id="${crNo}"]`).addClass("active");
    $(".chat-user-list.active").off("click");
  }

  // =====================================================
  // 읽음 처리 및 무한 스크롤을 하나의 스크롤 이벤트로 통합
  // =====================================================
  $(".messages").on("scroll", function () {
    // 무한 스크롤: 맨 위 도달 시 다음 페이지 로드
    if ($(this).scrollTop() === 0) {
      currentPage++;
      console.log(`다음 페이지 로드 중: ${currentPage}`);
      loadChatHistory(currentCrNo, currentPage);
    }
    // 읽지 않은 메시지 자동 읽음 처리
    $(".messages .chats.unread").each(function () {
      const $msg = $(this);
      const containerTop = $(".messages").offset().top;
      const containerBottom = containerTop + $(".messages").height();
      const msgTop = $msg.offset().top;
      const msgBottom = msgTop + $msg.height();
      if (msgTop >= containerTop && msgBottom <= containerBottom) {
        $msg.removeClass("unread");
      }
    });
  });


  // =====================================================
  // 메시지 표시
  // =====================================================
  function displayMessage(message) {
    if (!message || !message.cmContent) {
      console.warn("🚨 메시지가 비어있습니다:", message);
      return;
    }

    // 중복 메시지 방지
    if ($(`.chats[data-cmno='${message.cmNo}']`).length > 0) {
      console.warn("⚠️ 중복 메시지 감지:", message.cmNo);
      return;
    }


    // ✅ 내가 보낸 메시지는 unread count 업데이트하지 않음
    if (message.emplNo === userId) {
      appendMessageToUI(message, 0); // 내 메시지는 unread count 0으로 설정
      return;
    }

    if (message.emplNo === "SYSTEM") {
      displaySystemMessage(message.cmContent);
      return;
    }

    if (message.cmType === "FILE" && message.fileUrl) {
      message.cmContent = `<a href="${message.fileUrl}" target="_blank">
                              <img src="${message.fileUrl}" alt="첨부 파일" style="max-width: 200px; max-height: 200px;">
                            </a>`;
    }

    appendMessageToUI(message, 0);
    // 비동기적으로 안 읽은 사용자 수 업데이트 요청
    updateUnreadUserCount(message.crNo, message.cmNo);
  }

  // =====================================================
  // 채팅방 내역 로딩 최적화 (페이징 적용)
  // =====================================================
  function loadChatHistory(crNo, page, callback) {
    const emplNo = userId;
    const currentPage = Number.isInteger(page) ? page : 0;

    $.ajax({
      url: `/chat/${crNo}/messages?emplNo=${emplNo}&page=${currentPage}&size=20`,
      type: "GET",
      success: function (messages) {
        if (currentPage === 0) {
          $(".messages").empty();
        }
        messages.sort((a, b) => new Date(a.cmDate) - new Date(b.cmDate));
        messages.forEach(msg => {
          displayMessage(msg);
        });
        if (callback) callback();
      },
      error: function (err) {
        console.error("채팅 내역 로드 실패:", err);
      }
    });
  }

  // ✅ 모든 채팅방의 unread-badge 업데이트 실행
  function updateAllUnreadBadges() {
    $(".chat-user-list").each(function () {
        let crNo = $(this).data("id");
        updateUnreadBadge(crNo);
    });
  }

  function updateAllUnreadUserCounts(crNo) {
    $(".messages .chats").each(function () {
      let cmNo = $(this).data("cmno");
      updateUnreadUserCount(crNo, cmNo);
    });
  }

  // ✅ 특정 메시지의 unread-count 업데이트 (해당 메시지를 안 읽은 사람 수)
  function updateUnreadUserCount(crNo, cmNo, senderId, cmType) {

    if (!cmNo) cmNo = getLastMessageId(crNo);
  
     // 💡 내가 보낸 메시지 또는 시스템 메시지는 제외
    if (senderId === userId || cmType === "SYSTEM") {
      console.log(`📌 업데이트 제외 - 보낸 사람(${senderId}), 시스템 메시지 여부(${cmType === "SYSTEM"})`);
      return;
    }

    // ✅ 현재 사용자가 채팅방에 입장했을 때만 업데이트
    if (currentCrNo !== crNo) return;
  
    $.ajax({
      url: `/chat/message/unreadUsers`,
      type: "GET",
      data: { crNo: crNo, cmNo: cmNo, emplNo: userId },
      success: function (unreadUsers) {
        console.log(`📩 메시지(${cmNo})의 안 읽은 사용자  수: ${unreadUsers}`);
        let $unreadCountSpan = $(`.unread-count[data-cmno="${cmNo}"]`);
        if ($unreadCountSpan.length === 0) {
          let unreadHtml = `<span class="unread-count" data-cmno="${cmNo}">${unreadUsers}</span>`;
          $(`.chats[data-cmno="${cmNo}"] .chat-read-status`).append(unreadHtml);
        } else {
          $unreadCountSpan.text(unreadUsers).toggle(unreadUsers > 0);
        }
      },
      error: function (error) {
        console.error(`❌ 메시지(${cmNo})의 안 읽은 사용자 수 조회 실패:`, error);
      }
    });
  }
  

  // =====================================================
  // 날짜/시간 포맷 (카카오톡 스타일)
  // =====================================================
  function formatTime(dateString) {
    const date = new Date(dateString);
    const now = new Date();
    let hours = date.getHours();
    const minutes = date.getMinutes();
    const period = hours < 12 ? "오전" : "오후";
    hours = hours % 12 || 12;
    const formattedTime = `${period} ${hours}:${minutes < 10 ? "0" + minutes : minutes}`;
    if (date.toDateString() === now.toDateString()) {
      return formattedTime;
    }
    const yesterday = new Date();
    yesterday.setDate(now.getDate() - 1);
    if (date.toDateString() === yesterday.toDateString()) {
      return `어제 ${formattedTime}`;
    }
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const currentYear = now.getFullYear();
    return year === currentYear ? `${month}월 ${day}일 ${formattedTime}` : `${year}년 ${month}월 ${day}일 ${formattedTime}`;
  }


  // =====================================================
  // 채팅방 목록 로딩 최적화 (안 읽은 메시지 포함)
  // =====================================================
  function loadChatRooms() {
    $.ajax({
        type: "GET",
        url: "/chat/rooms/lastMessageTime",
        data: { emplNo: userId },
        success: function (chatRooms) {
            let chatList = $("#chatsidebar .chat-users-wrap");
            chatList.empty();

            chatRooms.forEach((chatRoom) => {
                const crNo = chatRoom.CR_NO;
                let unreadCount = chatRoom.UNREADCOUNT || 0;
                let lastMessageTime = chatRoom.LASTMESSAGEDATE ? formatTime(chatRoom.LASTMESSAGEDATE) : "대화 없음";
                let lastMessageContent = chatRoom.LASTMESSAGECONTENT || "메시지 없음";

                let chatHtml = `
                    <div class="chat-list">
                        <a href="javascript:void(0);" class="chat-user-list ${crNo === currentCrNo ? "active" : ""}" data-id="${crNo}">
                            <div class="chat-user-info">
                                <h4 class="chat-title">${chatRoom.CR_TITLE}
                                    <span class="chat-time">${lastMessageTime}</span>
                                    ${unreadCount > 0 ? `<span class="unread-badge">${unreadCount}</span>` : ""}
                                </h4>
                                <p class="chat-last-message">${lastMessageContent}</p>
                            </div>
                        </a>
                    </div>`;
                chatList.append(chatHtml);
            });

            updateAllUnreadBadges();

            if (chatRooms.length > 0 && !currentCrNo) {
                openChatRoom(chatRooms[0].CR_NO);
                highlightActiveChatRoom(chatRooms[0].CR_NO);
            }
        },
        error: function (error) {
            console.error("🚨 채팅방 목록 로드 실패:", error);
        }
    });
  }

  // =====================================================
  // 메시지 띄우기 (프로필 동적 반영)
  // =====================================================
  function appendMessageToUI(message, unreadUsers) {
    const isMyMessage = (message.emplNo === userId);
    let contentHtml = (message.cmContent || "").replace(/\n/g, "<br>");
    let formateDate = formatTime(message.cmDate);

    getProfileImage(message.emplNo, function(profileImageUrl) {
      let msgHtml = `
        <div class="chats ${isMyMessage ? "chats-right" : "chats-left"}" data-cmno="${message.cmNo}">
          ${!isMyMessage ? `<div class="chat-avatar"><img src="${profileImageUrl}"></div>` : ""}
          <div class="chat-content">
            <div class="chat-profile-name ${isMyMessage ? "text-end" : ""}">
              <h6>
                ${isMyMessage ? "나" : `${message.emplNm} (${message.emplNo})`}
                <span class="chat-time">${formateDate}</span>
              </h6>
            </div>
            <div class="message-content">${contentHtml}</div>
            <div class="chat-read-status">
              <span class="unread-count" data-cmno="${message.cmNo}">
                ${unreadUsers > 0 ? unreadUsers : ""}
              </span>
            </div>
          </div>
          ${isMyMessage ? `<div class="chat-avatar"><img src="${profileImageUrl}"></div>` : ""}
        </div>
      `;
      $(".messages").append(msgHtml);
    });
  }

  // =====================================================
  // 프로필 이미지 가져오기 (모든 이미지 형식 지원)
  // =====================================================
  function getProfileImage(emplNo, callback) {
    if (!emplNo) {
      callback(`${contextPath}/assets/img/profiles/avatar-01.jpg`);
      return;
    }

    let extensions = ["jpg", "jpeg", "png", "webp", "gif"];
    let profileBasePath = `${contextPath}/assets/img/profile_images/${emplNo}`;
    let foundImage = `${contextPath}/assets/img/profiles/avatar-01.jpg`; // 기본 이미지

    function checkNextExtension(index) {
      if (index >= extensions.length) {
        callback(foundImage);
        return;
      }
      let profileImage = `${profileBasePath}.${extensions[index]}`;
      checkImageExists(profileImage, function (exists) {
        if (exists) {
          callback(profileImage);
        } else {
          checkNextExtension(index + 1);
        }
      });
    }
    checkNextExtension(0);
  }

  function checkImageExists(url, callback) {
    $.ajax({
      url: url,
      type: "HEAD",
      success: function () {
        callback(true);
      },
      error: function () {
        callback(false);
      }
    });
  }

  // =====================================================
  // 참여자 목록 업데이트 (초대 후)
  // =====================================================
  function updateParticipants(participants) {
    let participantList = $("#participant-list");
    participantList.empty();
    participants.forEach(participant => {
      let participantItem = `
        <div class="participant-item">
          <span>${participant.emplNm} (${participant.emplNo})</span>
        </div>`;
      participantList.append(participantItem);
    });
  }

  // =====================================================
  // 참여자 목록 UI 업데이트 (초대 알림 등)
  // =====================================================
  function updateParticipantsUI(participants) {
    const $participantList = $("#participantList");
    $participantList.empty();
    participants.forEach(participant => {
      const listItem = `<li>${participant.emplNo} (${participant.name})</li>`;
      $participantList.append(listItem);
    });
  }

  // =====================================================
  // Toast 메시지 출력 (Bootstrap Toast 활용)
  // =====================================================
  function showToastMessage(message, type = "primary") {
    let toast = $("#toastMessage");
    toast.removeClass("bg-primary bg-success bg-danger bg-warning").addClass(`bg-${type}`);
    $("#toastBody").text(message);
    let toastInstance = new bootstrap.Toast(toast[0]);
    toastInstance.show();
  }

  // =====================================================
  // 스크롤: 최신 메시지로 바로 이동
  // =====================================================
  function scrollToUnreadOrBottom() {
    const $container = $(".chat-body.chat-page-group.slimscroll");
    if ($container.length === 0) {
      console.warn("🚨 스크롤 컨테이너를 찾을 수 없습니다.");
      return;
    }
    const $firstUnread = $container.find(".messages .chats.unread").first();
    let targetPosition;
    if ($firstUnread.length > 0) {
      const containerOffset = $container.offset().top;
      const unreadOffset = $firstUnread.offset().top;
      const currentScrollTop = $container.scrollTop();
      targetPosition = unreadOffset - containerOffset + currentScrollTop;
    } else {
      targetPosition = $container[0].scrollHeight;
    }
    setTimeout(() => {
      $container.scrollTop(targetPosition);
    }, 100);
  }

  // =====================================================
  // 안 읽은 메시지 수 업데이트 함수
  // =====================================================
  function updateUnreadBadge(crNo) {
    $.ajax({
      url: `/chat/unread/count`,
      type: "GET",
      data: { emplNo: userId, crNo: crNo },
      success: function (res) {
        let count = res.unreadMessageCount;
        let $room = $(`.chat-user-list[data-id="${crNo}"]`);
        let $badge = $room.find(".unread-badge");
        if (count > 0) {
          if ($badge.length === 0) {
            $room.find(".chat-title").append(`<span class="unread-badge">${count}</span>`);
          } else {
            $badge.text(count).show();
          }
        } else {
          $badge.remove();
        }
      },
      error: function (err) {
        console.error("안 읽은 메시지 뱃지 업데이트 실패:", err);
      }
    });
  }

  function displaySystemMessage(content) {
    if (!content) return;
  
    // 중복 메시지 방지: 마지막 시스템 메시지와 내용이 같으면 추가하지 않음
    if ($(".messages .system-message").last().text() === content) {
      console.warn("⚠️ 중복된 초대 메시지 무시:", content);
      return;
    }
  
    let messageHtml = `<div class="system-message">${content}</div>`;
    $(".messages").append(messageHtml);
  
    // 최신 메시지로 스크롤 이동
    let $parentContainer = $(".chat-body.chat-page-group.slimscroll");
    $parentContainer.scrollTop($parentContainer[0].scrollHeight);
  }
  

  // =====================================================
  // UI 상호작용 및 템플릿 관련 이벤트
  // =====================================================
  function initUIInteractions() {
    if ($(".chat-close").length > 0) {
      $(".chat-close").on("click", function () {
        $(".chat").removeClass("show");
      });
    }
    $(".close_profile").on("click", function () {
      $(".right-side-contact").addClass("hide-right-sidebar").removeClass("show-right-sidebar");
      if ($(window).width() > 991 && $(window).width() < 1201) {
        $(".chat").css("margin-left", 0);
      }
      if ($(window).width() < 992) {
        $(".chat").removeClass("hide-chatbar");
      }
      $(".right-user-side").removeClass("open-message");
      $(".chat-center-blk .card-comman").addClass("chat-center-space");
      $(".video-screen-inner").removeClass("video-space");
      $(".right-side-party").removeClass("open-message");
      $(".meeting-list").removeClass("add-meeting");
      $("#chat-room").removeClass("open-chats");
      $(".main-img").removeClass("main-img-hide");
      $(".join-video").removeClass("main-img-hide");
      $(".call-user-side").addClass("add-setting");
    });
    $(".profile-open").on("click", function () {
      $(".right-user-side").removeClass("add-setting");
      $(".chat-center-blk .card-comman").removeClass("chat-center-space");
    });
    $("#show-message").on("click", function () {
      $("#chat-room").addClass("open-chats");
      $(".right-side-party").removeClass("open-message");
      $(".main-img").addClass("main-img-hide");
      $(".join-video").addClass("main-img-hide");
    });
    $(".chat-search-btn").on("click", function () {
      $(".chat-search").addClass("visible-chat");
    });
    $(".close-btn-chat").on("click", function () {
      $(".chat-search").removeClass("visible-chat");
    });
    $(".chat-search .form-control").on("keyup", function () {
      const value = $(this).val().toLowerCase();
      $(".chat .chat-body .messages .chats").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
    });
    $(".guest-off").on("click", function () {
      $(this).toggleClass("activate");
      $(".chat-active-users").toggleClass("show-active-users");
    });
    if ($(".emoj-action").length > 0) {
      $(".emoj-action").on("click", function () {
        $(".emoj-group-list").toggle();
      });
    }
    if ($(".emoj-action-foot").length > 0) {
      $(".emoj-action-foot").on("click", function () {
        $(".emoj-group-list-foot").toggle();
      });
    }
  }

  // =====================================================
  // Document Ready
  // =====================================================
  $(document).ready(function () {
    initUIInteractions();
    connectWebSocket();
    loadChatRooms();

    $(document).on("click", "#exitRoomBtn", function() {
      exitChatRoom(currentCrNo);
    });

    $(document).off("click", ".chat-user-list").on("click", ".chat-user-list", function () {
      const crNo = $(this).data("id");
      openChatRoom(crNo);
    });
  
    $(document).on("input", "#searchEmployeeInput", function () {
      const query = $(this).val().trim();
      console.log("🔍 입력값:", query);
      if (query === "") {
        console.log("❌ 검색어가 비어 있습니다.");
        return;
      }
      $.ajax({
        url: "/message/search",
        type: "GET",
        data: { query: query },
        success: function (data) {
          console.log("✅ 서버 응답:", data);
          const $list = $("#employeeSelectionList");
          $list.empty();
          if (data.length === 0) {
            $list.append("<tr><td colspan='4' class='text-center'>해당하는 사원이 없습니다.</td></tr>");
          } else {
            data.forEach(function (emp) {
              const row = `
                <tr class="employee-row" data-empl-no="${emp.emplNo}" data-empl-name="${emp.emplNm}">
                  <td>${emp.deptName}</td>
                  <td>${emp.emplNm}</td>
                  <td>${emp.ccName}</td>
                  <td>${emp.emplNo}</td>
                </tr>`;
              $list.append(row);
            });
          }
        },
        error: function (xhr, status, error) {
          console.error("❌ AJAX 요청 실패:", status, error);
        }
      });
    });

    $(document).on("click", ".employee-row", function () {
      const emplNo = $(this).data("empl-no");
      const emplName = $(this).data("empl-name");
      console.log("✅ 사원 선택됨:", emplName, emplNo);
      const crNo = currentCrNo;
      $.ajax({
        url: `/chat/${crNo}/invite`,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ crNo: crNo, emplNo: emplNo }),
        beforeSend: function () {
          console.log("🔍 초대 요청 데이터:", { crNo: crNo, emplNo: emplNo });
        },
        success: function (response) {
          console.log("✅ 초대 성공:", response);
          if (response && response.participants) {
            updateParticipants(response.participants);
          } else {
            console.error("⚠️ 서버 응답에 참여자 목록이 없습니다.", response);
          }
          displaySystemMessage(`${emplName}(${emplNo})님이 초대되었습니다.`);
          loadChatRooms();
          stompClient.send(`/app/chat/invite/${crNo}`, {}, JSON.stringify({
            type: "INVITE",
            crNo: crNo,
            emplNo: emplNo,
            emplNm: emplName
          }));
          showToastMessage(`✅ ${emplName}님을 초대했습니다!`, "success");
          $("#employeeSelectionModal").modal("hide");
        },
        error: function (error) {
          console.error("🚨 초대 실패:", error);
          showToastMessage("❌ 사용자를 초대하는데 실패했습니다.", "danger");
        }
      });
    });

    $(document).on("click", "#openEmployeeSearch", function () {
      console.log("🔹 초대하기 버튼 클릭됨!");
      $("#employeeSelectionModal").modal("show");
      $("#employeeSelectionList").empty();
    });

    $("#createChatRoomBtn").on("click", function () {
      var modal = new bootstrap.Modal(document.getElementById("createChatRoomModal"));
      modal.show();
    });

    $("#createRoomConfirmBtn").click(function () {
      const chatRoomName = $("#chatRoomName").val().trim();
      $.ajax({
        type: "POST",
        url: "/chat/room/create",
        data: JSON.stringify({ emplNo: userId, crTitle: chatRoomName }),
        contentType: "application/json",
        success: function (newChatRoom) {
          console.log("새 채팅방 정보:", newChatRoom);
          if (!newChatRoom || !newChatRoom.crNo) {
            console.error("채팅방 생성 후 crNo 값이 없습니다.");
            return;
          }
          const crNo = newChatRoom.crNo;
          const chatRoomTitle = newChatRoom.crTitle;
          const chatRoomDate = formatTime(newChatRoom.crDate);
          const newChatHtml = `
            <div class="chat-list">
              <a href="javascript:void(0);" class="chat-user-list" data-id="${crNo}">
                <div class="chat-user-info">
                  <div class="chat-user-time">
                    <span class="time">${chatRoomDate} - </span>
                  </div>    
                  <div class="chat-user-msg">
                    <h4>${chatRoomTitle}</h4>
                  </div>
                </div>
              </a>
            </div>`;
          $("#chatsidebar .chat-users-wrap").append(newChatHtml);
          openChatRoom(crNo);
          loadChatRooms();
          $("#createChatRoomModal").modal("hide");
        },
        error: function (error) {
          console.error("채팅방 생성 오류:", error);
          alert("채팅방 생성 중 오류가 발생했습니다.");
        }
      });
    });

    const $fileInput = $("#fileInput");
    const $fileBtn = $(".file-action");
    const $messageInput = $("#messageInput");
    let selectedFile = null;

    $fileBtn.on("click", function (event) {
      event.preventDefault();
      $fileInput.trigger("click");
    });

    $fileInput.on("change", function () {
      if (this.files.length > 0) {
        selectedFile = this.files[0];
        $("#filePreview").attr("src", "");
        $("#previewContainer").hide();
        const reader = new FileReader();
        reader.onload = function (e) {
          $("#filePreview").attr("src", e.target.result);
          $("#previewContainer").show();
        };
        reader.readAsDataURL(selectedFile);
      }
    });

    $("#removePreview").on("click", function (event) {
      event.preventDefault();
      $("#previewContainer").hide();
      $fileInput.val("");
      selectedFile = null;
    });

    $(".footer-form").on("submit", function (event) {
      event.preventDefault();
      const messageContent = $("#messageInput").val().trim();
      if (messageContent !== "") {
        sendTextMessage(messageContent);
        $("#messageInput").val("");
      }
      if (selectedFile) {
        sendFile(selectedFile);
        $("#previewContainer").hide();
        $fileInput.val("");
        selectedFile = null;
      }
    });

    function sendTextMessage(messageContent) {
      const textMessage = {
        crNo: currentCrNo,
        emplNo: userId,
        cmContent: messageContent,
        cmType: "TEXT"
      };
    
      stompClient.send("/app/sendMessage", {"content-type": "application/json"}, JSON.stringify(textMessage));
    
      setTimeout(() => {
        fetchLatestMessageId(currentCrNo, function(latestCmNo) {
          markMessagesAsRead(currentCrNo, function() {
              console.log(`내가 보낸 메시지(${latestCmNo}) 읽음 처리 완료.`);
          });
          stompClient.send(`/app/chat/unread/update/${currentCrNo}`, {}, JSON.stringify({
              crNo: currentCrNo,
              emplNo: userId,
              lastReadCmNo: latestCmNo
          }));
        });
      }, 500);
    }    

    function sendFile(file) {
      let formData = new FormData();
      formData.append("file", file);
      formData.append("crNo", currentCrNo);
      formData.append("emplNo", userId);
      formData.append("cmContent", "[파일]");  // 기본 텍스트로 설정
  
      $.ajax({
          url: "/chat/fileMessage",
          type: "POST",
          data: formData,
          processData: false,
          contentType: false,
          success: function (data) {
              console.log("✅ 파일 업로드 성공:", data);
              let fileMessage = data.message;
  
              // ✅ 파일 메시지 처리 (fileUrl이 있으면 즉시 표시, 없으면 서버에서 재요청)
              if (fileMessage.fileUrl) {
                  fileMessage.cmContent = `<a href="${fileMessage.fileUrl}" target="_blank">
                                              <img src="${fileMessage.fileUrl}" alt="첨부 파일" style="max-width: 200px; max-height: 200px;">
                                           </a>`;
                  displayMessage(fileMessage);
              } else {
                  console.warn("🚨 파일 URL이 없습니다. 서버에서 다시 가져옵니다.");
                  retryFetchFileUrl(fileMessage, 5);
              }
  
              // ✅ 채팅방 목록 업데이트
              setTimeout(() => {
                  console.log("🔄 채팅방 목록 새로고침 (파일 전송 후)");
                  loadChatRooms();
              }, 500);
  
              // ✅ Unread Count 업데이트 (파일 메시지에도 적용)
              setTimeout(() => {
                  let lastMessageId = getLastMessageId(currentCrNo);
                  console.log(`📩 파일 전송 후 unread count 업데이트 (crNo: ${currentCrNo}, lastMessageId: ${lastMessageId})`);
                  updateUnreadUserCount(currentCrNo, lastMessageId);
              }, 800);
  
              // ✅ WebSocket을 통해 unread 업데이트 요청
              stompClient.send(`/app/chat/unread/update/${currentCrNo}`, {}, JSON.stringify({
                  crNo: currentCrNo,
                  emplNo: userId,
                  lastReadCmNo: getLastMessageId(currentCrNo)
              }));
          },
          error: function (error) {
              console.error("🚨 파일 업로드 실패:", error);
          }
      });
  }
  
  

    function retryFetchFileUrl(fileMessage, attemptsLeft) {
      if (attemptsLeft <= 0) {
        console.error("🚨 파일 URL을 가져오지 못했습니다.", fileMessage);
        return;
      }
      console.log(`🔄 파일 URL 확인 중... (남은 시도: ${attemptsLeft})`, fileMessage);
      $.ajax({
        url: `/chat/getFileUrl/${fileMessage.cmNo}`,
        type: "GET",
        success: function (updatedMessage) {
          if (updatedMessage.fileUrl) {
            console.log("✅ 파일 URL 확인 성공:", updatedMessage.fileUrl);
            fileMessage.fileUrl = updatedMessage.fileUrl;
            displayMessage(fileMessage);
          } else {
            setTimeout(() => retryFetchFileUrl(fileMessage, attemptsLeft - 1), 1000);
          }
        },
        error: function (error) {
          console.error("🚨 파일 URL 확인 실패:", error);
          setTimeout(() => retryFetchFileUrl(fileMessage, attemptsLeft - 1), 1000);
        }
      });
    }

    function fetchFileUrl(message) {
      $.ajax({
        url: `/chat/file/${message.fileIdentify}`,
        type: "GET",
        success: function (response) {
          if (response.fileUrl) {
            message.fileUrl = response.fileUrl;
            updateMessageUI(message);
          }
        },
        error: function (error) {
          console.error("🚨 파일 URL 가져오기 실패:", error);
        }
      });
    }

    const $emojiBtn = $(".emoj-action-foot");
    const $emojiPicker = $("#emojiPicker");
    const $messageInput2 = $("#messageInput");

    if ($emojiBtn.length === 0 || $emojiPicker.length === 0 || $messageInput2.length === 0) {
      console.error("🚨 요소를 찾을 수 없습니다.");
      return;
    }

    $emojiBtn.off("click").on("click", function (event) {
      event.preventDefault();
      console.log("🔄 이모지 선택창 토글");
      $emojiPicker.toggle();
    });

    $(document).on("click", "#emojiPicker span", function (event) {
      event.stopPropagation();
      const emoji = $(this).text();
      console.log("✅ 선택된 이모지:", emoji);
      let currentValue = $messageInput2.val();
      $messageInput2.val(currentValue + emoji);
      $emojiPicker.hide();
    });

    const $voiceBtn = $(".voice-action");
    let recognition;
    let isRecording = false;

    if ("webkitSpeechRecognition" in window) {
      recognition = new webkitSpeechRecognition();
      recognition.continuous = false;
      recognition.interimResults = false;
      recognition.lang = "ko-KR";

      recognition.onstart = function () {
        console.log("🎙️ 음성 인식 시작...");
        $voiceBtn.css("color", "red");
      };

      recognition.onresult = function (event) {
        const transcript = event.results[0][0].transcript;
        console.log("🎙️ 음성 입력 결과:", transcript);
        $messageInput.val($messageInput.val() + transcript);
      };

      recognition.onend = function () { 
        console.log("🎙️ 음성 인식 종료.");
        $voiceBtn.css("color", "black");
        isRecording = false;
      };

      recognition.onerror = function (event) {
        console.error("🚨 음성 인식 오류:", event);
      };

      $voiceBtn.on("click", function (event) {
        event.preventDefault();
        if (isRecording) {
          recognition.stop();
        } else {
          recognition.start();
          isRecording = true;
        }
      });
    } else {
      console.warn("❌ 음성 인식 기능이 지원되지 않습니다.");
    }
  });


  function exitChatRoom(crNo) {
    if (!crNo) return;
  
    showConfirmModal("정말 이 채팅방을 나가시겠습니까?")
      .then((isConfirmed) => {
        if (isConfirmed) {
          $.ajax({
            url: `/chat/${crNo}/leave`,
            type: "PUT",
            contentType: "application/json",
            data: JSON.stringify({ crNo: crNo, emplNo: userId }),
            success: function (response) {
              console.log("채팅방 나가기 처리 완료:", response);
  
              // ✅ UI 초기화
              currentCrNo = null;
              $("#chatTitle").text("");
              $(".messages").empty();
              $("#chatRoomContainer").hide();
              $("#inviteButton").hide();
  
              // ✅ 방 목록 강제 갱신
              loadChatRooms();
  
              showToastMessage("채팅방을 나갔습니다.", "warning");
            },
            error: function (err) {
              console.error("채팅방 나가기 처리 실패:", err);
              showToastMessage("채팅방 나가기 처리 중 오류가 발생했습니다.", "danger");
            }
          });
        }
      });
  }
})();