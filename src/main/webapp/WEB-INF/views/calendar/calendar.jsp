<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>일정관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/luxon/3.3.0/luxon.min.js"></script>
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

		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">
				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">일정관리</h2>
						  <button id="showAll" class="btn btn-secondary">전체 일정</button>
					    <button id="showPersonal" class="btn btn-primary">개인 일정</button>
					    <button id="showDepartment" class="btn btn-success">부서 일정</button>
					</div>
					<div class="calendar-filter">
					  
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="mb-2">
							<a href="#" data-bs-toggle="modal" data-bs-target="#eventForm" class="btn btn-primary d-flex align-items-center" id="btn"><i class="ti ti-circle-plus me-2"></i>일정추가</a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xxl-9 col-xl-8 theiaStickySidebar">	
						<div class="card border-0">
							<div class="card-body">			
								<div id="calendar"></div>
							</div>
						</div>		
					</div>
					<!-- Calendar Sidebar -->
					<div class="col-xxl-3 col-xl-4">
						<div class="card">
							<div class="card-body p-10">
								<div class="border-bottom pb-2 mb-4">
									<div class="datepic"></div> 
								</div>
							</div>
						</div>					

					</div>
					<!-- /Calendar Sidebar -->
				</div>
			</div>
			<!-- 모달창들 -->
			<%@ include file="/WEB-INF/views/theme/modal.jsp" %>
			<!-- /모달창들 -->
		</div>
		<!-- /Page Wrapper -->

		<!-- 일정 추가 모달 -->
		<div class="modal fade" id="eventForm">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">일정 추가</h4>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">일정명</label>
										<input type="text" class="form-control" id="eventTitle">
									</div>
								</div>
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">시작날짜</label>
										<div class="input-icon-end position-relative">
											<input type="datetime-local" class="form-control" id="eventStart" style="padding-right: 10px;"/>
											<span class="input-icon-addon">
											</span>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">마지막날짜</label>
										<div class="input-icon-end position-relative">
											<input type="datetime-local" class="form-control" id="eventEnd" style="padding-right: 10px;"/>
											<span class="input-icon-addon">
											</span>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label class="form-label">하루종일</label>
											<input type="checkbox" id="eventAllDay" onclick="toggleTimeFields()"/>
											<span class="input-icon-addon">
											</span>
									</div>
								</div>
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">배경색</label>
										<input type="color" id="eventColor"/>
									</div>
									<div class="mb-0">
										<label class="form-label">글자색</label>
										<input type="color" id="eventTextColor"/>
									</div>
								</div>
								<div>
									<label>부서일정
										<input type="checkbox" id="group" value="group">
									</label>
								</div>
							</div>
						</div>
						<div class="modal-footer">
   							<button type="button" class="btn btn-secondary me-2" id="deleteButton" onclick="deleteEvent()" style="display:none;">삭제</button>
							<button id="exampleBtn" class="btn btn-success me-2">예시</button>
							<button id="newBtn" class="btn btn-primary me-2"></button>
						</div>
				</div>
			</div>
		</div>
		<!-- /Add New Event -->
	</div>
	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery-3.7.1.min.js"></script>
	
	<!-- Bootstrap Core JS -->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>
	
	<!-- Feather Icon JS -->
	<script src="${pageContext.request.contextPath }/assets/js/feather.min.js"></script>
	
	<!-- Slimscroll JS -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.slimscroll.min.js"></script>
	
	<!-- Color Picker JS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>
	
	<!-- Daterangepikcer JS -->
	<script src="${pageContext.request.contextPath }/assets/js/moment.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- Select2 JS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/select2/js/select2.min.js"></script>
	
	<!-- Custom JS -->
	<script src="${pageContext.request.contextPath }/assets/js/circle-progress.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/theme-colorpicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/script.js"></script>
	<script>
		$(document).ready(function () {
			$("#exampleBtn").click(function () {
					// 📌 1. 기존 입력값 초기화
					$("#eventTitle").val("");
					$("#eventStart").val("");
					$("#eventEnd").val("");
					$("#eventAllDay").prop("checked", false);
					$("#eventColor").val("#000000");
					$("#eventTextColor").val("#ffffff");
					$("#group").prop("checked", false);
	
					// 📌 2. 일정명 랜덤 선택
					const eventNames = [
							"전사 회의", "부서 워크샵", "팀 미팅", "신규 프로젝트 Kick-off",
							"업무 보고", "고객사 미팅", "외부 교육", "내부 교육 세션",
							"이사회 회의", "회사 창립일 행사", "신입사원 교육", "부서 간담회"
					];
					let randomEventName = eventNames[Math.floor(Math.random() * eventNames.length)];
					
					// 📌 3. 시작 날짜 & 종료 날짜 (오늘 포함, 2주 내 랜덤)
					let today = new Date();
					let startDate = new Date(today);
					startDate.setDate(today.getDate() - Math.floor(Math.random() * 7)); // 지난 7일 내 랜덤
	
					let endDate = new Date(startDate);
					endDate.setDate(startDate.getDate() + Math.floor(Math.random() * 14)); // 최대 14일 후 종료
	
					let formatDateTime = (date, isAllDay) => {
							let year = date.getFullYear();
							let month = String(date.getMonth() + 1).padStart(2, '0');
							let day = String(date.getDate()).padStart(2, '0');
							
							if (isAllDay) {
									return `\${year}-\${month}-\${day}`; // 하루종일이면 시간 제외
							} else {
									let hours = String(date.getHours()).padStart(2, '0');
									let minutes = String(date.getMinutes()).padStart(2, '0');
									return `\${year}-\${month}-\${day}T\${hours}:\${minutes}`;
							}
					};
	
					// 📌 4. 하루종일 체크박스 랜덤 선택
					let isAllDay = Math.random() < 0.5;
					$("#eventAllDay").prop("checked", isAllDay);
					toggleTimeFields(isAllDay, startDate, endDate); // 하루 종일이면 시간 필드 숨김
	
					// 📌 5. 배경색 & 글자색 랜덤
					function getRandomColor() {
							return `#\${Math.floor(Math.random() * 16777215).toString(16).padStart(6, '0')}`;
					}
					let randomBgColor = getRandomColor();
					let randomTextColor = getRandomColor();
	
					// 📌 6. 부서 일정 랜덤 선택 (체크 or 미체크)
					let isGroupSchedule = Math.random() < 0.5;
					$("#group").prop("checked", isGroupSchedule);
	
					// 📌 7. 값 입력
					$("#eventTitle").val(randomEventName);
					$("#eventColor").val(randomBgColor);
					$("#eventTextColor").val(randomTextColor);
			});
	
			// 🔹 하루종일 체크 시 날짜만 입력 가능하고 종료 날짜를 시작 날짜와 동일하게 설정
			$("#eventAllDay").change(function () {
					let isChecked = $(this).is(":checked");
					let startDate = new Date($("#eventStart").val());
	
					let endDate = isChecked ? new Date(startDate) : new Date(startDate);
					endDate.setDate(startDate.getDate() + Math.floor(Math.random() * 14)); // 체크 해제 시 종료일 다시 랜덤
	
					toggleTimeFields(isChecked, startDate, endDate);
			});
	
			function toggleTimeFields(isAllDay, startDate, endDate) {
					if (isAllDay) {
							$("#eventStart").attr("type", "date").val(formatDateTime(startDate, true));
							$("#eventEnd").attr("type", "date").val(formatDateTime(startDate, true)); // 하루종일이면 같은 날짜로 설정
					} else {
							$("#eventStart").attr("type", "datetime-local").val(formatDateTime(startDate, false));
							$("#eventEnd").attr("type", "datetime-local").val(formatDateTime(endDate, false));
					}
			}
	
			function formatDateTime(date, isAllDay) {
					let year = date.getFullYear();
					let month = String(date.getMonth() + 1).padStart(2, '0');
					let day = String(date.getDate()).padStart(2, '0');
	
					if (isAllDay) {
							return `\${year}-\${month}-\${day}`;
					} else {
							let hours = String(date.getHours()).padStart(2, '0');
							let minutes = String(date.getMinutes()).padStart(2, '0');
							return `\${year}-\${month}-\${day}T\${hours}:\${minutes}`;
					}
			}
	});	
	</script>
</body>
<script type="text/javascript">
let calendar, schNo, selectedDate = null
const userId = sessionStorage.getItem("userId"); //아이디 세션 가져오기
let userDeptCode = "${emp.deptCode}"; //로그인한 사람의 부서코드 가져오기
let newBtn = $("#newBtn"); 

$(document).ready(function() {
	
	const calendarEl = document.getElementById('calendar');
	
	// 캘린더 생성
	calendar = new FullCalendar.Calendar(calendarEl, {

		
		
	// 캘린더 기본설정
	headerToolbar: {
		left: 'prev,next today',
		center: 'title',
		right: 'dayGridMonth,timeGridWeek,timeGridDay'
	},
		editable: true,
		selectable: true,
		droppable: true,
		eventStartEditable: true,
		eventDurationEditable: true,
		eventOverlap: false,
		slotEventOverlap: true,
		displayEventTime: true,
		displayEventEnd: true,
	
		//일정 데이터 가져오기
		events: function (fetchInfo, successCallback, failureCallback) {
			let data = {
				emplNo : userId,
				groupId : userDeptCode
			}
			$.ajax({
				url: `/api/events/selectById`,
				type: 'post',
				contentType: 'application/json;charset=utf-8',
				dataType: 'json',
				data: JSON.stringify(data),
				success: function (events) {
					const convertedEvents = events.map(event => {
						const DateTime = luxon.DateTime;
						let start = DateTime.fromFormat(event.start, "yyyy-MM-dd HH:mm:ss", { zone: "Asia/Seoul" }).toISO();
			            let end = event.end ? DateTime.fromFormat(event.end, "yyyy-MM-dd HH:mm:ss", { zone: "Asia/Seoul" }).toISO() : start;
						return { ...event, start, end, extendedProps: { type: event.type } }; //타입추가
					});
					successCallback(convertedEvents);
				},
				error: function (xhr, status, error) {
					console.log("실패");
					console.error("Error fetching events:", error);
					failureCallback(error);
				}
			});
		},
		
		//드래그 이벤트 
		eventDrop:function(info){
			console.log("INFO : ", info);
			console.log("전 : ", info.event.start.toISOString());
			console.log("후 : ", info.event.start.toISOString().replace("T", " ").substr(0, 19));
			let schSDate = info.event.start.toISOString().replace("T", " ").substr(0, 19);
			let schEDate = info.event.end.toISOString().replace("T", " ").substr(0, 19);
			let udata = {
					schNo	 :	info.event.id,
					schTitle : info.event.title,
					schSDate : schSDate,
					schEDate : schEDate,
					schColor : info.event.backgroundColor,
					schTextColor: info.event.textColor,
			        schAllDay: info.event.allDay
			};
			
			$.ajax({
				url : `/api/events/\${udata.schNo}`,
				type : 'put',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify(udata),
				success : function(){
					alert("이벤트 수정성공");
					calendar.refetchEvents();
				},
				
				
				error: function (xhr, status, error) {
                    console.error("Error updating event:", error);
                }
			})
		},
		
		//기존 이벤트 클릭 시 수정/삭제 모달창
		eventClick: function (info){
			schNo = info.event.id;
			
			$('#eventTitle').val(info.event.title);
	        $('#eventAllDay').prop('checked', info.event.allDay);

	        const DateTime = luxon.DateTime;
	        let start = info.event.start ? DateTime.fromJSDate(info.event.start).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'HH:mm") : "";
	        let end = info.event.end ? DateTime.fromJSDate(info.event.end).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'HH:mm") : start;

	        if (info.event.allDay) {
	            start = DateTime.fromJSDate(info.event.start).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'00:00'");
	            end = DateTime.fromJSDate(info.event.start).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'23:59'");
	        }

	        $('#eventStart').val(start);
	        $('#eventEnd').val(end);
	        $('#eventColor').val(info.event.backgroundColor || '#3788d8');
	        $('#eventTextColor').val(info.event.textColor || '#000000');
			
	        $('#deleteButton').show();
	        newBtn.text("수정");
			$("#eventForm").modal("show");
		},
		
		//부서일정일 경우 title 앞에 핀 아이콘 + 부서일정 문구 표시
		eventDidMount: function (info) {
		    if (info.event.extendedProps.type === "department") { 
		        let titleElement = info.el.querySelector('.fc-event-title'); 
		        if (titleElement) {
		            titleElement.innerHTML = `<span style="margin-right:5px;">📌</span><strong>부서 일정</strong> - ` + titleElement.innerHTML;
		        }
		    }
		}
		
	});
		calendar.render();
});

//일정구분(개인,부서) 
$(function(){
	
	$("#showPersonal").on("click", function(){
		fillterEvents("personal");
	});
	
	$("#showDepartment").on("click", function(){
		fillterEvents("department");
	});
	
	$("#showAll").on("click", function(){
		fillterEvents("all");
	});
	
	//일정추가 버튼 클릭 시 초기화
	$("#btn").on("click", function(){
		
		schNo = null;
		$("#eventTitle").val("");
		$("#eventStart").val("");
		$("#eventEnd").val("");
		$("#eventColor").val("");
		$("#eventTextColor").val("#ffffff");
		$("#eventAllDay").prop("checked", false);
		newBtn.text("저장");
		$("#deleteButton").hide();
		
	});
	
	//수정, 저장 버튼 구분
	$("#newBtn").on("click", function(){
		if($(this).text() == "수정"){
			updateEvent();
		}
		if($(this).text() == "저장"){
			saveEvent();
		}
	})
});

function fillterEvents(filterType){
	let allEvents = calendar.getEvents();
	
	let data = { emplNo: userId, groupId: userDeptCode, filter: filterType };
	allEvents.forEach(event => {
        if (filterType === "all") {
            event.setProp('display', 'auto'); // ✅ 전체 일정 보이기
        } else if (filterType === "personal") {
            event.setProp('display', event.extendedProps.type === "personal" ? 'auto' : 'none');
        } else if (filterType === "department") {
            event.setProp('display', event.extendedProps.type === "department" ? 'auto' : 'none');
        }
    });
	
}

// 캘린더 닫기
function closeForm() {
    $('#eventForm').modal('hide');
}


// 이벤트 저장 기능 (새 일정 추가)
function saveEvent() {
	let isGroup = $("#group").prop("checked"); // 체크 상태 확인
	let start = $('#eventStart').val();
	let end = $('#eventEnd').val();
	
	const DateTime = luxon.DateTime;
	
	let startDateTime = DateTime.fromISO(start, {zone: "Asia/Seoul"}).toFormat("yyyy-MM-dd HH:mm:ss"); 
	let endDateTime = end? DateTime.fromISO(end, {zone: "Asia/Seoul"}).toFormat("yyyy-MM-dd HH:mm:ss") : startDateTime;
		
	let bgColor = $('#eventColor').val() || '#3788d8'; // 기본 배경색 (파란색)
    let textColor = $('#eventTextColor').val() || '#000000'; // 기본 글자색 (검은색)
	
	let eventData = {
		schTitle: $('#eventTitle').val(),
		schSDate: startDateTime,
		schEDate: endDateTime,
		schColor: bgColor,
		schTextColor: textColor,
		schAllDay: $('#eventAllDay').prop('checked'),
		emplNo : userId
	};
	if(isGroup){
		eventData.groupId = userDeptCode;
	}

	//allDay 일정 변환
	
	if(eventData.schAllDay){
		eventData.schSDate = DateTime.fromISO(start, {zone: "Asia/Seoul"}).toFormat("yyyy-MM-dd 00:00:00");
		eventData.schEDate = DateTime.fromISO(start, { zone: "Asia/Seoul" }).toFormat("yyyy-MM-dd 23:59:59");
	}
	
	console.log("데이터확인:", eventData);
	
	$.ajax({
		url: '/api/events',
		type: 'POST',
		contentType: 'application/json;charset=utf-8',
		data: JSON.stringify(eventData),
		success: function (result) {
			console.log("성공?:",result);
			 $('.modal-backdrop').remove();
			 $('body').removeClass('modal-open');
			calendar.refetchEvents();
			closeForm();
			showToastMessage("일정이 성공적으로 등록되었습니다.", "success");
		},
		error: function (xhr, status, error) {
			console.error("Error adding event:", error);
		}
	});
}

//일정 수정 
function updateEvent(){
	let start = $("#eventStart").val();
	let end = $("#eventEnd").val();
	
	
	const DateTime = luxon.DateTime;
	
	let startDateTime = DateTime.fromISO(start, {zone: "Asia/Seoul"}).toFormat("yyyy-MM-dd HH:mm:ss"); 
	let endDateTime = end? DateTime.fromISO(end, {zone: "Asia/Seoul"}).toFormat("yyyy-MM-dd HH:mm:ss") : startDateTime;
	
	let eventData = {
	        schNo: schNo, // 기존 일정 ID
	        schTitle: $('#eventTitle').val(),
	        schSDate: startDateTime,
	        schEDate: endDateTime,
	        schColor: $('#eventColor').val(),
	        schTextColor: $('#eventTextColor').val() || '#000000',
	        schAllDay: $('#eventAllDay').prop('checked')
	    };

	    console.log("DEBUG - 수정 요청 데이터:", eventData);

	    $.ajax({
	        url: `/api/events/\${schNo}`,
	        type: 'PUT',
	        contentType: 'application/json;charset=utf-8',
	        data: JSON.stringify(eventData),
	        success: function() {
	        	showToastMessage("일정이 수정되었습니다.", "success");
	            $('.modal-backdrop').remove();
				$('body').removeClass('modal-open');
	            calendar.refetchEvents();
	            closeForm();
	        },
	        error: function(xhr, status, error) {
	            console.error("Error updating event:", error);
	        }
	    });
}

 //일정 삭제
function deleteEvent(){
	if(!confirm("정말 삭제하시겠습니까?")) return;
	
	$.ajax({
		url : `/api/events/\${schNo}`,
		type : "post",
		success : function(){
			 $('.modal-backdrop').remove();
			 $('body').removeClass('modal-open');
			calendar.refetchEvents();
			closeForm();
			showToastMessage("일정이 삭제되었습니다.", "success");
		},
		error: function (xhr, status, error) {
			console.error("Error adding event:", error);
		}
	})
}

//하루종일 체크하면 시간x 아니면 시간까지 표시
function toggleTimeFields() {
	const allDay = $('#eventAllDay').prop('checked');
	$('#eventStart').attr('type', allDay ? 'date' : 'datetime-local');
	$('#eventEnd').attr('type', allDay ? 'date' : 'datetime-local');
}

$(document).ready(function () {
    $('.modal-backdrop').remove();  // ✅ 남아 있는 배경 제거
    $('body').removeClass('modal-open'); // ✅ body 클래스 초기화
});




</script>

</html>