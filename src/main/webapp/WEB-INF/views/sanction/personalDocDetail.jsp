<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords"content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern,  html5, responsive">
	<meta name="author" content="Dreamstechnologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>전자 결재 페이지</title>



</head>
<style>
#docContent table { /* 이 부분 건드리면 소속,직위,성명,사원번호 든 table만 제외하고 작동함 */
    border: 2px solid;
    margin: auto;
}

#docContent table td, 
#docContent table th {
    border: 2px solid;
}

#docContent .info{
  font-weight: bold;
  width: 180px;
  background-color: #E8E8E8;
}

#docContent #detail{
  height: 300px;
}

#docContent td{
  height: 50px;
  text-align: center;
}

#docContent #remark{
  text-align: left;
}

#docContent h1{
  text-align: center;
}

#docContent .info{
	margin-left: 1000px;
}

.sort {
 font-weight: bold;
}

</style>
<body>

	<div id="global-loader">
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

		<div class="page-wrapper cardhead">
			<div class="content ">

				<!-- Page Header -->
				<div class="page-header">
					<div class="row">
						<div class="col-sm-12">
							<h3 class="page-title">전자 결재</h3>
						</div>
					</div>
				</div>
				<!-- /Page Header -->

				<div class="row">

					<!-- 문서 자체 정보 -->
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title">기안 문서 상세 페이지 입니다.</h5> <br/>
								
								<table class="table datatable">
									<tr>
										<td class="sort">문서 번호</td>
										<td id="docNo"></td>
										<td class="sort">기안자</td>
										<td id="writer"></td>
									</tr>
									<tr>
										<td class="sort">문서 제목</td>
										<td id="docTitle"></td>
										<td class="sort">문서 상태</td>
										<td id="docStatus"></td>
									</tr>
									<tr>
										<td class="sort">기안 일시</td>
										<td id="submitDate"></td>
										<td class="sort">보존 기한</td>
										<td id="expiredDate"></td>
									</tr>
									<tr>
										<td class="sort">문서 전결 허용 여부</td>
										<td id="allowAt"></td>
										<td class="sort">전결권 보유 여부(본인)</td>
										<td id="myAllow"></td>
									</tr>
									<tr>
										<td class="sort">결재 선</td>
										<td id="sanctionLine" colspan="3"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div id="docContent">
								
								</div>
								
							</div>
							
						</div>
					</div>
					
				</div>
				
			</div>

			<a href="/hrms/sanction/personalDocuments">
				<button class="btn btn-primary" style="float: right; margin-bottom: 30px; margin-right: 25px;">목록으로 돌아가기</button>
			</a>
			
		</div>
	</div>

	<!-- /Main Wrapper -->

	<!-- 헤더, 사이드바에서 사용하는 스크립트-->
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
	
	<!-- Datatable JS -->
	<%-- <script src="${pageContext.request.contextPath }/assets/js/jquery.dataTables.min.js"></script> --%>
	<%-- <script src="${pageContext.request.contextPath }/assets/js/dataTables.bootstrap5.min.js"></script> --%>
	
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
<script>
$(function() {
    initPage();  // 초기화 함수 호출
});

/** ✅ 페이지 초기화 함수 */
function initPage() {
    const userId = sessionStorage.getItem("userId");
    console.log("userId: ", userId);

    const docNo = getQueryParam('docNo');
    console.log("docNo: ", docNo);

    getUserPosition(userId, function(myEmplPosition) {
        getDocumentDetail(docNo, myEmplPosition);
    });
}

/** ✅ URL 파라미터 가져오기 */
function getQueryParam(param) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
}

/** ✅ 사용자 직위 정보 호출 */
function getUserPosition(userId, callback) {
    $.ajax({
        url: "/sanction/nowEmplInfo",
        method: "get",
        data: { userId: userId },
        dataType: 'json',
        success: function(res) {
            console.log("현재 내 직위코드: ", res.emplPosition);
            if (callback) callback(res.emplPosition);
        },
        error: function() {
            alert("사용자 직위 정보를 가져오는 중 오류가 발생했습니다.");
        }
    });
}

/** ✅ 문서 상세 정보 호출 및 렌더링 */
function getDocumentDetail(docNo, myEmplPosition) {
    $.ajax({
        url: "/sanction/getApvDocDetail",
        method: 'get',
        data: { docNo: docNo },
        dataType: 'json',
        success: function(res) {
            console.log("문서 상세 정보: ", res);
            renderDocumentDetail(res, myEmplPosition);
        },
        error: function() {
            alert("문서 상세정보 호출에 오류가 발생했습니다.");
        }
    });
}

/** ✅ 문서 상세 정보 화면 출력 */
function renderDocumentDetail(data, myEmplPosition) {
    const docStatusMap = { '01': '결재 중', '02': '승인', '03': '반려' };
    const dcrbAllowMap = { 'Y': '허용', 'N': '불허' };
    const dcrbRight = myEmplPosition !== '01' ? "보유" : "미보유";

    $("#docNo").text(data.docNo);
    $("#writer").text(data.writerNo);
    $("#docTitle").text(data.docTitle);
    $("#docStatus").text(docStatusMap[data.docApv] || "알 수 없음");
    $("#submitDate").text(data.sanctnRqstdt);
    $("#expiredDate").text(data.docPeriod);
    $("#allowAt").text(dcrbAllowMap[data.dcrbAllow] || "알 수 없음");
    $("#myAllow").text(dcrbRight);

    if (data.dcrbAllow === 'Y' && dcrbRight === '보유') {
        $("#proxyBtn").show();
    }

    if (data.aprRefList && data.aprRefList.length > 0) {
        renderApprovers(data.aprRefList);
    }

    $("#docContent").html(data.docContent);
}

/** ✅ 결재자 리스트 렌더링 */
function renderApprovers(approverList) {
    let sanctionHtml = approverList.map(approver =>
        `<div>\${approver.sanctnerNo} (\${approver.sanctnStatus})</div>`
    ).join("");
    $("#sanctionLine").html(sanctionHtml);
}

</script>
</html>