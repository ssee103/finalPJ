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

		<!-- Horizontal Menu -->
		<%@ include file="/WEB-INF/views/theme/horizontalMenu.jsp" %>
		<!-- /Horizontal Menu -->

		<!-- Two Col Sidebar -->
		<%@ include file="/WEB-INF/views/theme/twoColSidebar.jsp" %>
		<!-- /Two Col Sidebar -->

		<!-- Stacked Sidebar -->
		<%@ include file="/WEB-INF/views/theme/stackedSidebar.jsp" %>
		<!-- /Stacked Sidebar -->



		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">
				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">일정관리</h2>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="mb-2">
							<a href="#" data-bs-toggle="modal" data-bs-target="#eventForm" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>일정추가</a>
						</div>
					</div>
				</div>

				<div class="row">

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

					<div class="col-xxl-9 col-xl-8 theiaStickySidebar">	
						<div class="card border-0">
							<div class="card-body">			
								<div id="calendar"></div>
							</div>
						</div>		
					</div>
				</div>
			</div>
			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="#" class="text-primary">Dreams</a></p>
			</div>
		</div>
		<!-- /Page Wrapper -->

		<!-- 일정 추가 모달 -->
		<div class="modal fade" id="eventForm">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">일정 추가</h4>
						<!-- <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button> -->
					</div>
					<form action="calendar.html">
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
										<label class="form-label">색</label>
										<input type="color" id="eventColor"/>
									</div>
									<div class="mb-0">
										<label class="form-label">글자색</label>
										<input type="color" id="eventTextColor" value="#ffffff"/>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" onclick="saveEvent()">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /Add New Event -->

		<!-- 취소버튼 클릭시 모달창 닫기 -->
	<!-- 	<div class="modal fade" id="event_modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					취소버튼 클릭시 모달창 닫기
					<div class="modal-header bg-dark modal-bg">
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					/취소버튼 클릭시 모달창 닫기
					이거 뭔지 모르겟음 
						<div class="modal-body">
						<p class="d-flex align-items-center fw-medium text-black mb-3"><i class="ti ti-calendar-check text-default me-2"></i>26 Jul,2024 to 31 Jul,2024</p>
						<p class="d-flex align-items-center fw-medium text-black mb-3"><i class="ti ti-calendar-check text-default me-2"></i>11:00 AM to 12:15 PM</p>
						<p class="d-flex align-items-center fw-medium text-black mb-3"><i class="ti ti-map-pin-bolt text-default me-2"></i>Las Vegas, US</p>
						<p class="d-flex align-items-center fw-medium text-black mb-0"><i class="ti ti-calendar-check text-default me-2"></i>A recurring or repeating event is simply any event that you will occur more than once on your calendar.</p>
					</div>
				</div>
			</div>
		</div> -->
		<!-- /Event -->
						

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
	
	<%-- <!-- Datatable JS -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/dataTables.bootstrap5.min.js"></script>	 --%>
	
	<!-- Daterangepikcer JS -->
	<script src="${pageContext.request.contextPath }/assets/js/moment.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- Select2 JS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/select2/js/select2.min.js"></script>
	
	<!-- Chart JS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/apexchart/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/apexchart/chart-data.js"></script>
	
	<!-- Custom JS -->
	<script src="${pageContext.request.contextPath }/assets/js/circle-progress.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/theme-colorpicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/script.js"></script>

</body>
<script type="text/javascript">
let calendar, currentEventId, selectedDate = null
const userId = sessionStorage.getItem("userId"); //아이디 세션 가져오기
console.log("아이디 :" + userId);

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
		eventOverlap: true,
		slotEventOverlap: true,
		displayEventTime: true,
		displayEventEnd: true,
	
		//일정 데이터 가져오기
		events: function (fetchInfo, successCallback, failureCallback) {
			let data = {
				emplNo : userId 
			}
			console.log("data.emplNo : " + data.emplNo)
			$.ajax({
				url: `/api/events/selectById`,
				type: 'post',
				contentType: 'application/json;charset=utf-8',
				dataType: 'json',
				data: JSON.stringify(data),
				success: function (events) {
					const convertedEvents = events.map(event => {
						const DateTime = luxon.DateTime;
						let start = DateTime.fromISO(event.start).setZone("local").toISO();
						let end = event.end ? DateTime.fromISO(event.end).setZone("local").toISO() : start;
						return { ...event, start, end };
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
			
			let udata = {
					schNo	 :	info.event.id,
					schTitle : info.event.title,
					schSDate : info.event.start.toISOString(),
					schEDate : info.event.end ? info.event.end.toISOString() : null,
					schColor : info.event.backgroundColor
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
		}
		/* ,
		
		//기존 이벤트 클릭 시 수정/삭제 긴으
		eventClick: function (info){
			currentEventId = info.event.id;
			 $('#deleteButton').show();
             $('#eventTitle').val(info.event.title);
             $('#eventAllDay').prop('checked', info.event.allDay);
			
             const DateTime = luxon.DateTime;
             let isAllDay = info.event.allDay;
             let start = info.event.start ? DateTime.fromJSDate(info.event.start).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'HH:mm") : "";
             let end = info.event.end ? DateTime.fromJSDate(info.event.end).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'HH:mm") : start;

             // ✅ allDay 일정일 경우 `startDate`는 `T00:00`, `endDate`는 `T23:59`로 변환하여 날짜가 사라지는 문제 방지
             if (isAllDay) {
                 start = DateTime.fromJSDate(info.event.start).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'00:00'");
                 end = DateTime.fromJSDate(info.event.start).setZone("Asia/Seoul").toFormat("yyyy-MM-dd'T'23:59'");
             }

             $('#eventStart').val(start);
             $('#eventEnd').val(end);
             $('#eventColor').val(info.event.backgroundColor || '#3788d8');
             $('#eventTextColor').val(info.event.textColor || '#ffffff');
             $('#eventForm').show();
		} */
		
	});
		calendar.render();
});

// 캘린더 닫기
function closeForm() {
	$('#eventForm').hide();
}

/*  // 추가하기 누르면 폼띄우기
function showEventForm(date) {
	currentEventId = null; // 새로운 일정 추가 시 ID 초기화
	$('#saveButton').show(); // ✅ 저장 버튼 표시
	$('#updateButton').hide(); // ✅ 수정 버튼 숨김
	$('#deleteButton').hide(); // ✅ 삭제 버튼 숨김
	$('#eventTitle').val('');
	$('#eventDescription').val('');
	$('#eventStart').val(date);
	$('#eventEnd').val(date);
	$('#eventColor').val('#3788d8');
	$('#eventTextColor').val('#ffffff');
	$('#eventAllDay').prop('checked', false);
	toggleTimeFields();
	$('#eventForm').show();
}

// ✅ "추가하기" 버튼 클릭 시 입력 폼 표시
$('#addEventButton').on('click', function () {
	showEventForm('');
});
 */
// ✅ 이벤트 저장 기능 (새 일정 추가)
function saveEvent() {
	let eventData = {
		schTitle: $('#eventTitle').val(),
		schSDate: $('#eventStart').val(),
		schEDate: $('#eventEnd').val(),
		schColor: $('#eventColor').val(),
		schTextColor: $('#eventTextColor').val(),
		schAllDay: $('#eventAllDay').prop('checked'),
		emplNo : userId
	};

	// ✅ `allDay` 일정 변환
	const DateTime = luxon.DateTime;
	if (eventData.allDay) {
		eventData.schSDate = DateTime.fromISO(eventData.schSDate, { zone: "Asia/Seoul" }).toISODate() + "T00:00:00";
		eventData.schEDate = eventData.schSDate; 
	}else{
		//일반일정일 경우 endDate가 없으면 startDate와 동일하게 설정
		if (!eventData.schEDate || eventData.schEDate.trim() === "") {
			eventData.schEDate = eventData.schSDate;
	}
            	
	// ✅ 일반 일정의 경우 UTC로 변환
	eventData.schSDate = DateTime.fromISO(eventData.schSDate, { zone: "Asia/Seoul" }).toUTC().toISO();
	eventData.schEDate = DateTime.fromISO(eventData.schEDate, { zone: "Asia/Seoul" }).toUTC().toISO();
	} 

	$.ajax({
		url: '/api/events',
		type: 'POST',
		contentType: 'application/json;charset=utf-8',
		dataType : 'text',
		data: JSON.stringify(eventData),
		success: function (result) {
			console.log("성공?:",result);
			 $('.modal-backdrop').remove();
			 $('body').removeClass('modal-open');
			calendar.refetchEvents();
			closeForm();
			alert('새 일정이 추가되었습니다!');
		},
		error: function (xhr, status, error) {
			console.error("Error adding event:", error);
		}
	});
}

// 일정을 보여주기


//삭제
/* function deleteEvent(){
	if(!confirm("정말로 삭제하시겠습니까?")) return;
	
	$.ajax({
		url:	`/api/events/\${}`,
		type:
		success:	
	})
}  */

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