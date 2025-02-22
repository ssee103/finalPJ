<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>Smarthr Admin Template</title>
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
						<h2 class="mb-1">출 / 퇴근</h2>
					</div>
				</div>
				<!-- /Breadcrumb -->

				<div class="row">
					<div class="col-xl-3 col-lg-4 d-flex">
						<div class="card flex-fill">
							<div class="card-body">
								 
								<div class="attendance-circle-progress mx-auto mb-3" style="width:150px;padding-top: 50px;" data-value='65'>
									<div class="mb-3 text-center">
										<h6 class="fw-medium text-gray-5 mb-2">현재 시각</h6>
										<h4 id="clock"></h4>
									</div>
								</div>
								<div class="text-center" style="padding-top: 50px;">
									<!-- <div class="badge badge-md badge-primary mb-3">Production :  3.45 hrs</div> -->
									<div class="fw-medium d-flex align-items-center justify-content-center mb-3">
										<i class="ti ti-fingerprint text-primary me-1"></i>
										출근시간 :  <div id="todayDclzStime"></div>
									</div>
									<div class="fw-medium d-flex align-items-center justify-content-center mb-3">
										<i class="ti ti-fingerprint text-primary me-1"></i>
										퇴근시간 :  <div id="todayDclzEtime"></div>
									</div>
									<button class="btn btn-dark w-100" id="punchOutBtn">출근</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-lg-8 d-flex">
						<div class="row flex-fill">
							<div class="col-xl-3 col-md-6" style="width:550px;">
								<div class="card">
									<div class="card-body">
										<div class="border-bottom mb-2 pb-2">
											<span class="avatar avatar-sm bg-primary mb-2"><i class="ti ti-clock-stop"></i></span>
											<h2 class="mb-2">연장근무 시간<span class="fs-20 text-gray-5"> </span></h2>
										</div>
										<div>
											<h2>
												<span class="fs-20 text-gray-5"> ?</span>
											</h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6" style="width:550px;">
								<div class="card">
									<div class="card-body">
										<div class="border-bottom mb-2 pb-2">
											<span class="avatar avatar-sm bg-dark mb-2"><i class="ti ti-clock-up"></i></span>
											<h2 class="mb-2">야간근무 시간<span class="fs-20 text-gray-5"> </span></h2>
										</div>
										<div>
											<h2>
												<span class="fs-20 text-gray-5"> ?</span>
											</h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6" style="width:550px;">
								<div class="card">
									<div class="card-body">
										<div class="border-bottom mb-2 pb-2">
											<span class="avatar avatar-sm bg-info mb-2"><i class="ti ti-calendar-up"></i></span>
											<h2 class="mb-2">출장 횟수<span class="fs-20 text-gray-5"> </span></h2>
										</div>
										<div>
											<h2>
												<span class="fs-20 text-gray-5"> ?</span>
											</h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6" style="width:550px;">
								<div class="card">
									<div class="card-body">
										<div class="border-bottom mb-2 pb-2">
											<span class="avatar avatar-sm bg-pink mb-2"><i class="ti ti-calendar-star"></i></span>
											<h2 class="mb-2">지각 횟수</h2>
										</div>
										<div>
											<h2>
												<span class="fs-20 text-gray-5" id="LATE"> </span>
											</h2>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<table class="datatable"></table>

				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>나의 출근기록</h5>
						<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
							<div class="me-3">
								<input type="date" class="form-control" id="dateStart">
							</div>
							~&nbsp;&nbsp;&nbsp;
							<div class="me-3">
								<input type="date" class="form-control" id="dateEnd">
							</div>
							<div>
								<input type="submit" class="btn btn-primary d-flex align-items-center" id="searchBtn" value="검색">
							</div>
						</div>
					</div>
					<div class="card-body p-0">
						<div class="custom-datatable-filter table-responsive">
							<table class="table datatable">
								<thead class="thead-light">
									<tr>
										<th>출근날짜</th>
										<th>출근시각</th>
										<th>퇴근시각</th>
										<th></th>
										<th>근무상태</th>
										<th></th>
										<th></th>
										<th>근무 유형</th>
									</tr>
								</thead>
								<tbody id="dataTable-tbody">
									<tr>
										<td></td>									
									</tr>
								</tbody>
							</table>
							<!-- 페이징 구역 -->
							<div id="pagingArea" style="display: flex; justify-content: center; align-items: center; padding:15px;">
							</div>
							<!-- /페이징 구역 -->
						</div>
					</div>
				</div>

			</div>

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
			</div>

		</div>
		<!-- /Page Wrapper -->

	</div>
	<!-- /Main Wrapper -->

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

</body>
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
const userId = sessionStorage.getItem("userId");// 이거하면 세션가져올수있음
let clock = $("#clock");					// 현재시각 표시하는 곳
let punchOutBtn = $("#punchOutBtn");		// 출퇴근 버튼
let todayDclzStime = $("#todayDclzStime");	// 오늘 나의 출근시간을 표시하는 곳
let todayDclzEtime = $("#todayDclzEtime");	// 오늘 나의 퇴근시간을 표시하는 곳
let pagingArea = $("#pagingArea");			// 페이지 표시하는 div
let searchBtn = $("#searchBtn");			// 날짜검색버튼
let LATE = $("#LATE")

time(); // 시계함수 실행
setInterval(time, 1000); // 시계함수 1초마다 계속실행

$(function(){
	selectThisMonthData();

	printList(1); // 페이지 로드할때 출퇴근목록 출력하기
	getTodayPunchOut();
	
	// 검색 버튼클릭이벤트
	searchBtn.on("click", function(){
		let dateStart = $("#dateStart").val();
		let dateEnd = $("#dateEnd").val();
		printList(1, dateStart, dateEnd);
	});
	// 검색 버튼클릭이벤트 끝
	
	// 페이지 버튼클릭이벤트 여기에 검색어 추가하기
	pagingArea.on("click", "a", function(){
		event.preventDefault();
		let page = $(this).data("page");
		let dateStart = $("#dateStart").val();
		let dateEnd = $("#dateEnd").val();
		printList(page, dateStart, dateEnd);
	});
	// 페이지버튼 클릭이벤트 끝
	
	// 출퇴근버튼 클릭
	punchOutBtn.on("click", function(){
		let btnText = $("#punchOutBtn").text();
		if(btnText == "출근"){ // 버튼의 텍스트가 출근일때 실행
			$.ajax({
				url : "/hrms/attendance/punchOut",
				type : "post",
				data : JSON.stringify({emplNo : userId}),
				contentType: "application/json;charset=utf-8",
				success : function(res){
					showToastMessage("✅출근성공", "success");
					printList(1);
					getTodayPunchOut();
					todayDclzEtime.text("");
				},
				error : function(error){
					showToastMessage("❌ 출근등록중 오류발생.", "danger");
				}	
			});	
		}else if(btnText == "퇴근"){ // 버튼의 텍스트가 퇴근일때 실행
			$.ajax({
				url : "/hrms/attendance/goHome",
				type : "post",
				data : JSON.stringify({emplNo : userId}),
				contentType: "application/json;charset=utf-8",
				success : function(res){
					showToastMessage("✅퇴근성공", "success");
					printList(1);
					getTodayPunchOut();
				},
				error : function(error){
					showToastMessage("❌ 퇴근등록중 오류발생.", "danger");
				}				
			});
		}
	});
	// 출퇴근버튼 클릭 끝
	
	// 권한을 가져와서 권한에따라 탭을표시, 안표시
	let changeTab = $("#changeTab");
});

function printList(page, dateStart, dateEnd){ // 출퇴근 목록 가져오기
	let data = {page : page, emplNo : userId};
	if(dateStart != null){data.dateStart = dateStart}
	if(dateEnd != null){data.dateEnd = dateEnd}
	$.ajax({
		url : "/hrms/attendance/getMyPunchOut",
		type : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		success : function(res){
			let time = new Date();
			let year = time.getFullYear();
			let month = ("0" + (1 + time.getMonth())).slice(-2);
			let day = ("0" + time.getDate()).slice(-2);
		    let today = year + "-" + month + "-" + day // 오늘날짜 예시)2025-02-05
		    let lastDclzDate = ""; // 가장최근 출근일자를 넣기위한 변수
		    
		    if(res.dalList.length > 0){ // 지금까지 한번도 출근을 안했을수도 있으니까 null체크
				lastDclzDate = res.dalList[0].dclzDate.substr(0,10); // 가장최근 출근을 찍은 일자. 연,월,일만 가져옴 예시)2025-02-05
				let lastDclz = res.dalList[0];

				// 출/퇴근버튼에 텍스트 출력
				if(lastDclz.dclzEtime != null && lastDclz.dclzEtime != ""){ // 마지막기록의 퇴근시각이 존재하면
					punchOutBtn.text("출근");
				}else if(lastDclz.dclzEtime == null){ // 마지막기록의 퇴근시각이 존재하지 않으면
					punchOutBtn.text("퇴근");
				}
		    }
			// 출퇴근 데이터를 화면에 뿌리기
			let dataTable_tbody = $("#dataTable-tbody");
			let tr = "";
			for(let i=0; i<res.dalList.length; i++){
				tr += `
					<tr>
						<td>\${res.dalList[i].dclzDate.substr(0,10)}</td>
						<td>\${res.dalList[i].dclzStime.substr(11)}</td>
					`;
				if(res.dalList[i].dclzEtime != null && res.dalList[i].dclzEtime != ""){ // 출근만했고 퇴근은 안했을수 있기때문에 퇴근시간이 존재할때만 td에 넣기
					tr += `<td>\${res.dalList[i].dclzEtime.substr(11)}</td>`
				}else{
					tr+= `<td></td>`;
				}
				tr += `
						<td></td>
						<td>\${res.dalList[i].dclzType}</td>
						<td></td>
						<td></td>
						<td>\${res.dalList[i].dclzStatus}</td>
					</tr>
				`;
			}
			dataTable_tbody.html(tr);
			pagingArea.html(res.pagingVO.pagingHTML);
		},
		error : function(res){
			showToastMessage("❌ 목록을 불러오는데 실패했습니다.", "danger");
		}
	});
}

// 나의 가장 최근 출근기록 가져와서 출근날짜랑 오늘날짜랑비교해서 같으면 출근시각, 퇴근시각 출력 아니면 비워두기
function getTodayPunchOut(){
	data = {emplNo : userId}
	$.ajax({
		url : "/hrms/attendance/getTodayPunchOut",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		success : function(res){
			// 오늘날짜 구하기
			let day = new Date();
			let year = day.getFullYear(); // 년도
			let month = ("0" + (day.getMonth() + 1)).slice(-2);  // 월
			let date = ("0" + day.getDate()).slice(-2);  // 날짜
			let today = year + "-" + month + "-" + date
			// 결과값의 날짜 구하기
			let lastDclzDate = res.dclzDate
			// 결과값과 오늘날짜 비교해서 같으면 위에 출력하기
			if(today == lastDclzDate.substr(0,10)){
				todayDclzStime.text(res.dclzStime.substr(11))
				if(res.dclzEtime != null){
					todayDclzEtime.text(res.dclzEtime.substr(11))
				}
			}else{
				console.log("다르다")
			}
			
		},
		error : function(error){
			showToastMessage("❌ 목록을 불러오는데 실패했습니다.", "danger");
		}
	})
}

function selectThisMonthData(){
	$.ajax({
		url : "/hrms/attendance/selectThisMonthData",
		data : JSON.stringify({emplNo:userId}),
		type : "post",
		contentType : "application/json;charset=utf-8",
		success : function(res){
			console.log(res);
			LATE.text(" " + res.LATE + " 회")
		},
		error : function(){
			showToastMessage("❌ 목록을 불러오는데 실패했습니다.", "danger");
		}
	});
}

function time(){ //현재시간 표시하는 시계.
	let time = new Date();
	let hours = time.getHours();
	let minutes = time.getMinutes();
	let seconds = time.getSeconds();
	clock.text(hours + "시 " + minutes + "분 " + seconds + "초")
}

//토스트 메시지 표시 함수 (Bootstrap Toast)
function showToastMessage(message, type = "primary") {
  let toast = $("#toastMessage");
  toast.removeClass("bg-primary bg-success bg-danger bg-warning");
  toast.addClass(`bg-\${type}`);
  $("#toastBody").text(message);
  let toastInstance = new bootstrap.Toast(toast[0]);
  toastInstance.show();
}
</script>
</html>