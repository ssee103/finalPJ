<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>채팅</title>
	<style>
		.messages {
			position: relative;    /* 자식 요소의 position() 계산을 위해 설정 */
		}
		.system-message {
			text-align: center;
			display: block;
			font-size: 14px;
			margin: 10px auto;
			font-weight: bold;
			color: #ff8c00;
		}
		.chats-right .message-content {
			background-color: #ff8c00 !important;
			color: black !important;
			padding: 12px 15px !important;
			border-radius: 15px 15px 0px 15px !important;
			text-align: left !important;
			font-size: 14px !important;
			position: relative;
			word-break: break-word;
		}

		/* 💬 상대방 메시지 스타일 (카카오톡 회색) */
		.chats-left .message-content {
			background-color: #f1f1f1 !important;
			color: black !important;
			padding: 12px 15px !important;
			border-radius: 15px 15px 15px 0px !important;
			text-align: left !important;
			font-size: 14px !important;
			position: relative;
			word-break: break-word;
		}

		/* 📌 이름(사번) + 시간 한 줄 정렬 */
		.chat-profile-name h6 {
			display: flex !important;
			align-items: center !important;
			font-size: 12px !important;
			color: gray !important;
			margin-top: 3px !important;
			justify-content: space-between !important;
			white-space: nowrap !important; /* 자동 줄바꿈 방지 */
			gap: 5px !important;
		}

		/* 🛠️ 말풍선 정렬 */
		.chats {
			display: flex;
			flex-direction: row;
			align-items: flex-start;
			margin-bottom: 10px;
		}

		/* 🟡 내 메시지는 오른쪽 정렬 */
		.chats-right {
			justify-content: flex-end !important;
			flex-direction: row-reverse;
		}

		/* 💬 상대방 메시지는 왼쪽 정렬 */
		.chats-left {
			justify-content: flex-start !important;
		}

		/* 🖼️ 프로필 사진 크기 조정 */
		.chat-avatar img {
			width: 40px;
			height: 40px;
			border-radius: 50%;
		}

		/* 🔽 메시지 간격 조정 */
		.chats .chat-content {
			margin-bottom: 5px !important;
		}

		.chat-user-info {
				display: flex;
				flex-direction: column; /* 세로 정렬 */
				justify-content: space-between;
				align-items: flex-start;
		}

		.chat-title {
				font-size: 16px;
				font-weight: bold;
				color: #000; /* 제목 검정색 */
				display: flex;
				justify-content: space-between;
				width: 100%;
		}

		.chat-time {
				font-size: 12px;
				color: #666; /* 시간은 연한 회색 */
				margin-left: auto; /* 제목 오른쪽 정렬 */
		}

		.chat-last-message {
				font-size: 14px;
				color: #333; /* 메시지는 조금 연한 검정 */
				margin-top: 4px; /* 제목과 간격 추가 */
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis; /* 너무 길면 "..." */
				max-width: 100%;
		}
		.unread-count {
			font-size: 10px;
		}

		/* ✅ 현재 선택된 채팅방 강조 */
		.chat-user-list.active {
			background-color: #ffdd99!important;
		}

		.unread-badge {
			display: inline-block;
			min-width: 18px;
			padding: 2px 6px;
			margin-left: 4px;
			font-size: 12px;
			font-weight: 600;
			color: #fff;
			background-color: #f44336; /* 빨간색 */
			border-radius: 999px; /* 원형 */
			text-align: center;
			vertical-align: middle;
		}
		
		.unread-badge.hidden,
		.unread-badge[data-count="0"] {
			display: none;
		}		

	</style>
</head>

<body>

	<div id="global-loader" style="display: none;">
		<div class="page-loader"></div>
	</div>

	<!-- Main Wrapper -->
	<div class="main-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/views/theme/header.jsp" %>
		<!-- /Header -->

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/theme/sidebar.jsp" %>
		<!-- /Sidebar -->

		<!-- 모달 -->
		<%@ include file="/WEB-INF/views/theme/modal.jsp" %>
		<!-- /모달 -->

		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">채팅</h2>
					</div>
				</div>
				<div class="chat-wrapper">
					 <!-- Chats sidebar -->
					 <div class="sidebar-group">
						<div id="chats" class="sidebar-content active slimscroll">
		   
						   <div class="slimscroll">
	   
							   <div class="chat-search-header">                            
								   <div class="header-title d-flex align-items-center justify-content-between">
									   <h4 class="mb-3">채팅방</h4>
										 <button id="createChatRoomBtn" class="btn btn-primary" style="margin-bottom: 5%;">+</button>
								   </div>
							  
								   <!-- Chat Search -->
								   <div class="search-wrap">
									   <form action="/chat">
										   <div class="input-group">
											   <input type="text" class="form-control">
											   <span class="input-group-text"><i class="ti ti-search"></i></span>
										   </div>
									   </form>
								   </div>
								   <!-- /Chat Search --> 
							   </div>       
	   
							   <div class="sidebar-body chat-body" id="chatsidebar">
								  
								   <!-- Left Chat Title -->
								   <div class="d-flex justify-content-between align-items-center mb-3">
									   <h5 class="chat-title">모든 채팅방</h5>
								   </div>
								   <!-- /Left Chat Title -->

								   <div class="chat-users-wrap">
									   <div class="chat-list">
										   <a href="chat.html" class="chat-user-list">
											   <div class="avatar avatar-lg online me-2">
												   <img class="rounded-circle" alt="image">
											   </div>
											   <div class="chat-user-info">
												   <div class="chat-user-msg">
													   <h6>Anthony Lewis</h6>
												   </div>
												   <div class="chat-user-time">
													   <span class="time">02:40 PM</span>
													   <div class="chat-pin">
														   <i class="ti ti-pin me-2"></i>
													   </div>
												   </div>    
											   </div>
										   </a>                        
										   <div class="chat-dropdown">
											   <a class="#" href="#" data-bs-toggle="dropdown">
												   <i class="ti ti-dots-vertical"></i>
											   </a>
												<ul class="dropdown-menu dropdown-menu-end p-3">
													<li><a class="dropdown-item" href="#"><i class="ti ti-pinned me-2"></i>상단 방 고정</a></li>
												  <li><a class="dropdown-item" href="#"><i class="ti ti-check me-2"></i>안 읽음 표시</a></li>
													<li><a class="dropdown-item" href="#"><i class="ti ti-trash me-2"></i>방 나가기</a></li>
											   </ul>
										   </div>     
									   </div>            
								   </div>
							   </div>
						   </div>
					   </div>
					  </div>
					<!-- / Chats sidebar -->					

					<!-- Chat -->
					<div class="chat chat-messages show" id="middle">
						<div>
								<!-- 채팅 헤더 -->
								<div class="chat-header">
									<div class="user-details">
										<!-- (기존) 화면 좁을 때 나타나는 뒤로가기 버튼 -->
										<div class="d-xl-none">
											<a class="text-muted chat-close me-2" href="#">
												<i class="fas fa-arrow-left"></i>
											</a>
										</div>
								
										<!-- 채팅방 제목과 나가기 버튼을 같은 줄에 배치 -->
										<div class="ms-2 overflow-hidden d-flex align-items-center">
											<!-- 방 나가기 버튼(아이콘)을 배치하고 onclick에서 exitChatRoom() 호출 -->
											<button type="button" class="btn btn-sm btn-danger" id="exitRoomBtn">
												<i class="fas fa-sign-out-alt"></i> 나가기
											</button>
										</div>
									</div>

									<h4 id="chatTitle" class="me-3">채팅방 제목</h4>
								
									<!-- 초대하기 버튼 있는 영역 -->
									<div class="invite-section">
										<button id="openEmployeeSearch" class="btn btn-primary">초대하기</button>
									</div>
								</div>
								
				
								<!-- 채팅 메시지 본문 -->
								<div class="chat-body chat-page-group slimscroll">
									<div class="messages">
										<div id="systemMessages" class="system-message-container"></div>
									</div>
								</div>
				
								<!-- ✅ 기존 chat-footer 유지 -->
								<div class="chat-footer">
									<form class="footer-form">
											<div class="chat-footer-wrap">
													<!-- 🎙️ 음성 입력 버튼 -->
													<div class="form-item">
															<a href="#" class="action-circle voice-action"><i class="ti ti-microphone"></i></a>
													</div>
							
													<div class="form-wrap" style="display: flex; align-items: center;">														
														<!-- 미리보기 컨테이너 -->
														<div id="previewContainer" style="display: none; position: relative; margin-left: 10px; background: #f9f9f9; padding: 5px; border: 1px solid #ddd; border-radius: 4px;">
															<img id="filePreview" src="" alt="파일 미리보기" style="max-width: 200px; max-height: 100px; display: block;" />
															<button type="button" id="removePreview" style="position: absolute; top: 0; right: 0; background: red; color: white; border: none; border-radius: 50%; width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; cursor: pointer;">×</button>
														</div>
														<!-- 메시지 입력 필드 -->
														<input type="text" class="form-control" id="messageInput" placeholder="메시지를 입력하세요..." style="flex-grow: 1;" />
													</div>
																							
							
													<!-- 😀 이모지 버튼 -->
													<div class="form-item emoj-action-foot">
															<a href="#" class="action-circle"><i class="ti ti-mood-smile"></i></a>
													</div>
							
													<!-- 📁 파일 첨부 버튼 -->
													<div class="form-item">
															<a href="#" class="action-circle file-action"><i class="ti ti-folder"></i></a>
															<input type="file" class="open-file" name="files" id="fileInput" style="display: none;">
													</div>
							
													<!-- 🚀 메시지 전송 버튼 -->
													<div class="form-btn">
														<button type="submit" class="btn btn-primary"><i class="ti ti-send"></i></button>
													</div>
											</div>
									</form>
							</div>
							
							<!-- 😀 이모지 선택 창 -->
							<div id="emojiPicker" style="display: none; position: absolute; bottom: 60px; background: white; border: 1px solid #ddd; padding: 10px; border-radius: 10px;">
									<span>😀</span>
									<span>😄</span>
									<span>😁</span>
									<span>😆</span>
									<span>😅</span>
									<span>😂</span>
									<span>😊</span>
									<span>🤣</span>
									<span>😇</span>
									<span>🙂</span>
							</div>							
						</div>
				</div>
				
					<!-- /Chat -->
				</div>
			</div>
		</div>
		<!-- /Page Wrapper -->
		
		<!-- 채팅방 생성 모달 -->
		<div id="createChatRoomModal" class="modal fade" tabindex="-1" aria-labelledby="createChatRoomModalLabel" aria-hidden="true">
			<div class="modal-dialog">
					<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
									<h5 class="modal-title" id="createChatRoomModalLabel">새 채팅방 만들기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>

							<!-- 모달 본문 -->
							<div class="modal-body">
									<input type="text" id="chatRoomName" class="form-control" placeholder="채팅방 이름을 입력하세요">
							</div>

							<!-- 모달 푸터 -->
							<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="createRoomConfirmBtn">생성</button>
							</div>
					</div>
			</div>
		</div>
		<!-- 채팅방 생성 모달 -->

		<!-- 사원 선택 모달 -->
		<div class="modal fade" id="employeeSelectionModal" tabindex="-1" aria-labelledby="employeeSelectionModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
					<div class="modal-content">
							<div class="modal-header">
									<h5 class="modal-title" id="employeeSelectionModalLabel">초대하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
									<input type="text" class="form-control mb-3" id="searchEmployeeInput" placeholder="사원의 이름 또는 번호 입력">
									<div class="table-responsive">
											<table class="table table-bordered table-hover">
													<thead class="table-dark">
															<tr>
																	<th>부서명</th>
																	<th>사원명</th>
																	<th>직책</th>
																	<th>사원번호</th>
															</tr>
													</thead>
													<tbody id="employeeSelectionList">
															<!-- 검색 결과가 여기에 추가됨 -->
													</tbody>
											</table>
									</div>
							</div>
							<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							</div>
					</div>
			</div>
		</div>
		<!-- 사원 선택 모달 -->

		<!-- Toast 알림 메시지 -->
		<div class="position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1100">
			<div id="toastMessage" class="toast hide align-items-center text-white bg-primary border-0 shadow-lg" role="alert" aria-live="assertive" aria-atomic="true">
					<div class="d-flex">
							<div class="toast-body" id="toastBody">
									<!-- 메시지가 여기에 표시됨 -->
							</div>
							<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
					</div>
			</div>
		</div>
		<!-- Toast 알림 메시지 -->

	</div>
	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery-3.7.1.min.js"></script>

	<!-- SockJS & STOMP 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Feather Icon JS -->
	<script src="${pageContext.request.contextPath }/assets/js/feather.min.js"></script>

	<!-- Slimscroll JS -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.slimscroll.min.js"></script>

	<!-- Color Picker JS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

	<!-- Custom JS -->
	<script src="${pageContext.request.contextPath }/assets/js/chat.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/theme-colorpicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/script.js"></script>

	<script>
			var contextPath = "${pageContext.request.contextPath}";
	</script>

</body>

</html>