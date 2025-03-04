<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
	table {
		text-align: center;
	}
</style>

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
						<h2 class="mb-1">결재 문서함</h2>
					</div>
				</div>
				<!-- /Breadcrumb -->

				<!-- Leads List -->
				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>결재 문서 목록</h5>
					</div>
					<div class="card-body p-0">
						<div class="custom-datatable-filter table-responsive">
							<table class="table datatable">
								<thead class="thead-light">
									<tr>
										<th>문서 번호</th>
										<th>제목</th>
										<th>결재 종류</th>
										<th>결재 상태</th>
										<th>기안 일자</th>
										<th>기안자</th>
										<th>첨부파일</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<!-- 문서 목록 출력 영역 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /Leads List -->

			</div>

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
			</div>

		</div>
		<!-- /Page Wrapper -->

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

</body>
<script type="text/javascript">

$(function(){
	
	const userId = sessionStorage.getItem("userId"); // 세션 아이디 가져오기
	console.log("userId: ", userId);
	
	let data = {userId : userId};
	
	// 문서 정보 호출
	$.ajax({
		url: "/sanction/getApvDocInfo",
		method: "get",
		data: data,
		dataType: "json",
		success: function(res){
			console.log("res: ", res);
			
			$.each(res, function(i, doc){
				
				let apvText = "";
				let file = "";
				
				if(doc.sanctnStatus == '01') {
					apvText = '결재 대기';
				}
				if(doc.sanctnStatus == '02') {
					apvText = '열람';
				}
				if(doc.sanctnStatus == '03') {
					apvText = '승인';
				}
				if(doc.sanctnStatus == '04') {
					apvText = '반려';
				}
				if(doc.sanctnStatus == '05') {
					apvText = '전결';
				}
				if(doc.sanctnStatus == '06') {
					apvText = '위임 전결';
				}
				if(doc.fileIdentify != null){
					file = "<img src='${pageContext.request.contextPath}/assets/img/icons/file-02.svg' style='display: block; margin: 0 auto;'>";
				}
				
				$("tbody").append(
					`<tr>
						<td><p class="documentDocNo">\${doc.docNo}</p></td>
						<td>
							<p class="fs-14 text-dark fw-medium">
								<a class="documentTitle" href="/hrms/sanction/reqApvDocDetail?docNo=\${doc.docNo}" data-no="\${doc.docNo}" data-sanctnstatus="\${doc.sanctnStatus}">\${doc.docTitle}</a>
							</p>
						</td>
						<td>\${doc.dsCode}</td>
						<td><span class=" badge badge-pink-transparent">\${apvText}</span></td>
						<td>\${doc.sanctnRqstdt}</td>
						<td>\${doc.writerNo}</td>
						<td>\${file}</td>
						<td><a href="/hrms/sanction/reqApvDocDetail?docNo=\${doc.docNo}" class="btn btn-primary">자세히보기</a></td>
					</tr>`		
				);
				
				if(apvText == '승인') {
					$("tbody tr:last-child .badge")
		            .removeClass("badge-pink-transparent")
		            .addClass("badge-success-transparent");
				} else if(apvText == '반려') {
					$("tbody tr:last-child .badge")
		            .removeClass("badge-pink-transparent")
		            .addClass("badge-purple-transparent");
				} else if(apvText == '전결') {
					$("tbody tr:last-child .badge")
		            .removeClass("badge-pink-transparent")
		            .addClass("badge-purple-transparent");
				} else if(apvText == '위임 전결') {
					$("tbody tr:last-child .badge")
		            .removeClass("badge-pink-transparent")
		            .addClass("badge-secondary-transparent");
				} else if(apvText == '결재 대기') {
					$("tbody tr:last-child .badge")
		            .removeClass("badge-pink-transparent")
		            .addClass("badge-dark-transparent");
				} else if(apvText == '열람') {
					$("tbody tr:last-child .badge")
		            .removeClass("badge-pink-transparent")
		            .addClass("badge-info-transparent");
				}
				
				
			});
			
			// 문서 제목 클릭 이벤트
			$("tbody").on("click",".documentTitle", function(e){
				e.preventDefault(); // 기본 링크 동작 차단
				
				let ele = $(this)[0];
				let selectEle = $(ele);
				
				var clickedDocNo = selectEle.data("no");
				var targetUrl = selectEle.attr("href"); // 링크에 지정된 URL 가져오기
				
				let updateData = {
						userId: userId,
						docNo: clickedDocNo
				};
				
				var sanctnStatus = selectEle.data("sanctnstatus");
				
				if(sanctnStatus == '01') {
					
					// 결재 상태, 결재 일자 업데이트
					$.ajax({
						url: "/sanction/apvStatusUpdate",
						method: "post",
						data: updateData,
						dataType: 'json',
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success: function(res){
							
							if(res == 1) {
								console.log("결재 상태가 업데이트 되었습니다.");
								window.location.href = targetUrl;
							} else {
								alert("결재 상태 업데이트 중 오류가 발생했습니다.");
							}
							
						}
						
					});
					
				} else {
					window.location.href = targetUrl;
				}
				
			});
			
		},	// success 종료 영역
		error: function(error){
			alert("개인문서 호출에 실패했습니다.");
		}
	});	// 페이지 로드 시 ajax
	
	
	
});	// ready function 종료 영역

</script>
</html>