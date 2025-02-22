<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords"content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern,  html5, responsive">
	<meta name="author" content="Dreamstechnologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<c:set value="등록" var="name"/>
		<c:if test="${status eq 'u' }">
			<c:set value="수정" var="name"/>
		</c:if>
	
	<title>공지사항 ${name}</title>
    <script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

	<style type="text/css">
	 /* 배경을 어둡게 하는 오버레이 */
	    .alert-overlay {
	        display: none;
	        position: fixed;
	        top: 0;
	        left: 0;
	        width: 100%;
	        height: 100%;
	        background: rgba(0, 0, 0, 0.5);
	        z-index: 9999;
	    }
	
	    /* 알림창 스타일 */
	    .alert-window {
	        display: none;
	        position: fixed;
	        top: 50%;
	        left: 50%;
	        transform: translate(-50%, -50%);
	        z-index: 10000;
	        background-color: white;
	        padding: 20px;
	        border-radius: 10px;
	        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	        width: 300px;
	        text-align: center;
	    }
	
	    .custom-alert-icon i {
	        font-size: 40px;
	        color: blue;
	    }
	
	    .btn-close {
	        background: none;
	        border: none;
	        font-size: 20px;
	        cursor: pointer;
	    }

</style>
</head>


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


		<!-- Page Wrapper -->
		<div class="page-wrapper cardhead">
			<div class="content">

				<!-- Page Header -->
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title">공지사항 ${name}</h3>
						</div>
					</div>
				</div>
				<!-- /Page Header -->

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title">공지사항 ${name}</h5>
							</div>
							<form action="/hrms/notice/noticeInsert" method="post" enctype="multipart/form-data" id="noticeForm">
								<div class="card-body">
								<input type="hidden" name="noticeWriter" id="noticeWriter"/>
									<c:if test="${status eq 'u'}">
										<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
									</c:if>
										<div class="mb-3 row">
											<label class="form-label col-md-2">제목</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}">
											</div>
										</div>
										<div class="mb-3 row">
											<label class="form-label col-md-2">내용</label>
											<div class="col-md-10">
												<textarea id="noticeContent" name="noticeContent" rows="15" cols="5" class="form-control">${notice.noticeContent}</textarea>
											</div>
										</div>
										<div class="mb-3 row">
											<label class="form-label col-md-2">파일 선택</label>
											<div class="col-md-10">
												<input class="form-control" name="files" type="file" id="inputFile" multiple="multiple">
											</div>
										</div>
										<div class="text-center">
											<div class="mb-3">
												<div class="row row-cols-xxl-5 row-cols-xl-3 row-cols-sm-3 row-cols-1 justify-content-center">
													<c:if test="${status eq 'u'}">
														<div class="card access-wrap border-0 flex-fill">
															<div class="row justify-content-start">
																	<c:forEach items="${fileList}" var="file">
																		<div class="col-12">
																		   <div class="card p-2 border-0 shadow-sm">
																		      <div class="d-flex align-items-center">
																		      	<c:set var="fileName" value="${file.fileName}"/>
																				<c:set var="words" value="${fn:split(fileName,'.')}"/>
																				<c:set var="ext" value="${words[fn:length(words)-1]}"/>
																				<c:set var="trimmedExt" value="${fn:trim(ext)}"/>
																				<c:set var="upperedExt" value="${fn:toUpperCase(trimmedExt)}"/>
																				<c:choose>
																					<c:when test="${upperedExt eq 'JPG' || upperedExt eq 'JPEG' || upperedExt eq 'PNG' }">
																						<c:set var="fileExt" value="image.svg"/>
																					</c:when>
																					<c:when test="${upperedExt eq 'PDF'}">
																						<c:set var="fileExt" value="pdf-icon.svg"/>
																					</c:when>
																					<c:when test="${upperedExt eq 'XLSX' }">
																						<c:set var="fileExt" value="xls-icon.svg"/>
																					</c:when>
																					<c:otherwise>
																						<c:set var="fileExt" value="file.svg"/>
																					</c:otherwise>
																				</c:choose>
																				<img src="${pageContext.request.contextPath }/assets/img/icons/${fileExt}" alt="img" class="me-2" style="width: 20px; height: 20px;">
																					<h6 class="file-name mb-1 text-truncate me-3" style="max-width: 200px;">${file.fileName}</h6>
																					<span class="badge bg-secondary" style="font-size:10px">${file.fileFancysize }</span>
																					<a href="/downloadFile?fileIdentify=${file.fileIdentify}&fileNo=${file.fileNo}">
																						<span class="btn btn-light btn-sm ms-2">
																							<i class="fas fa-download"></i>
																						</span>
																					</a>
																		      </div>
																		   </div>
																		</div>
																	</c:forEach>
																</div>
															</div>
														</c:if>
													</div>
												</div>
										</div>
										<div class="text-end">
											<input type="button" value="${name}" id="addBtn" class="btn btn-primary"/>
											<c:if test="${status eq 'u'}">
												<input type="button" id="cancelBtn" value="취소" class="btn btn-dark float-right">
											</c:if>
											<c:if test="${status ne 'u'}">
												<input type="button" id="listBtn" value="목록" class="btn btn-dark float-right">
											</c:if>
										</div>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
			</div>
			
			
		</div>
		<!-- /page wrapper -->
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
<script src="${pageContext.request.contextPath }/assets/js/dataTables.bootstrap5.min.js"></script>	
 --%>
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
<script src="${pageContext.request.contextPath }
/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/script.js"></script>


</body>
<script type="text/javascript">
const userId = sessionStorage.getItem("userId");
console.log("aaaaa");
$(function(){
	CKEDITOR.replace("noticeContent", {
		//filebrowserUploadUrl : "/notice/imageUpload.do"
		/* extraPlugins: 'exportpdf',
	    exportPdf_enableToken: false */
	});
	CKEDITOR.config.height = "600px";

	let addBtn = $("#addBtn");
	let noticeForm = $("#noticeForm");
	let cancelBtn = $("#cancelBtn");
	let listBtn = $("#listBtn");
	
	//등록 버튼 클릭시 
	addBtn.on("click", function(){
		console.log("ASdasd");
		let noticeTitle = $("#noticeTitle").val();
		let noticeContent = CKEDITOR.instances.noticeContent.getData();	// 내용 값
		let noticeWriter = $("#noticeWriter").val(userId);
		
		
		if(noticeTitle == null || noticeTitle == ""){
			alert("제목을 입력해주세요!");
			return false;
		}
		if(noticeContent == null || noticeContent == ""){
			alert("내용을 입력해주세요!");
			return false;
		}
		
		if($(this).val() == "수정"){
			noticeForm.attr("action", "/hrms/notice/noticeUpdate");
		}
		
		noticeForm.submit();
		  
	});
	
	//취소 버튼 이벤트
	cancelBtn.on("click", function(){
		location.href="/hrms/notice/noticeDetail?noticeNo=${notice.noticeNo}";
	});
	
});

function alertWindow(msg){
	let  = $("#alertMsg").text(msg);
	$("#alertWindow, #alertOverlay").fadeIn();
	
	
	alertWindow("등록성공");
	
	$("#acceptBtn").click(function () {
		$("#alertWindow, #alertOverlay").fadeOut();
	});
	
}




</script>

</html>