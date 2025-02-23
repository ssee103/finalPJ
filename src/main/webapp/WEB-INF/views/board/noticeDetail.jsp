<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>게시글 상세보기</title>
	
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
						<h2 class="mb-1">공지사항</h2>
					</div>
				</div>
				<!-- /Breadcrumb -->

				<!-- Invoices -->
                <div>
                    <div class="row">
                        <div class="col-sm-10 mx-auto">
							 <a href="/hrms/notice/noticeList" class="back-icon d-flex align-items-center fs-15 fw-medium mb-3 d-inline-flex">
								<span class=" d-flex justify-content-center align-items-center rounded-circle me-2">
									<i class="ti ti-arrow-left"></i>
								</span>
								목록으로 돌아가기
                        	</a>
                            <div class="card">
                                <div class="card-body">
                                    <div class="row justify-content-between align-items-center border-bottom mb-3">
                                        <div class="col-md-6">
                                            <h4 class="fw-bold">${notice.noticeTitle}</h4>
                                        </div>
                                        <div class="col-md-6">
                                            <div class=" text-end mb-3">
                                                <h5 class="text-gray mb-1">게시글 번호 <span class="text-primary">${notice.noticeNo }</span></h5>
                                                <h5 class="text-gray mb-1"><span class="text-dark">${fn:substring(notice.noticeDate,0,16) }</span> </h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row border-bottom mb-3">
                                        <div class="col-md-5">
                                            <p class="text-dark mb-2 fw-semibold"></p>
                                            <div>
                                                <p class="mb-1">${notice.noticeContent }</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <div class="mb-3">
											<div class="row row-cols-xxl-5 row-cols-xl-3 row-cols-sm-3 row-cols-1 justify-content-center">
												<c:choose>
													<c:when test="${empty fileList}">
													<p style="font-size:15px">첨부파일이 존재하지 않습니다.</p>
													</c:when>
													<c:otherwise>
														<div class="card access-wrap border-0 flex-fill">
															<div class="row justify-content-start">
																<c:forEach items="${fileList}" var="file">
																	<div class="col-12"> <!--d-inline-flex  -->
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
													</c:otherwise>
												</c:choose>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- /Invoices -->

                <div class="d-flex justify-content-center align-items-center mb-4">
               		<c:if test="${sessionScope.userAuth eq 'ROLE_ADMIN' }">
	               		<button type="button" class="btn btn-primary d-flex justify-content-center align-items-center me-2" id="updateBtn">수정</button>
	        			<button type="button" class="btn btn-white d-flex justify-content-center align-items-center border" id="deleteBtn">삭제</button>
               		</c:if>			
                   	<!-- Delete Modal -->
						<!-- <div class="modal fade" id="delete_modal">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-body text-center">
										<span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">
											<i class="ti ti-trash-x fs-36"></i>
										</span>
										<h4 class="mb-1">Confirm Delete</h4>
										<p class="mb-3">You want to delete all the marked items, this cant be undone once you delete.</p>
										<div class="d-flex justify-content-center">
											<a href="javascript:void(0);" class="btn btn-light me-3" data-bs-dismiss="modal">Cancel</a>
											<a href="faq.html" class="btn btn-danger">Yes, Delete</a>
										</div>
									</div>
								</div>
							</div>
						</div> -->
		<!-- /Delete Modal -->
                </div>
                <form action="/hrms/notice/noticeDelete" method="post" id="delForm">
                	<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
                </form>
		    </div>

			<!-- Footer -->
			<div class="footer d-sm-flex align-items-center justify-content-between bg-white border-top p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed & Developed By <a href="#" class="text-primary">Dreams</a></p>
			</div>
			<!-- /Footer -->
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
$(function(){
	let delForm = $("#delForm");
	let updateBtn = $("#updateBtn");
	let deleteBtn = $("#deleteBtn");

	//수정버튼 클릭시 수정폼페이지 이동
	updateBtn.on("click", function(){
		delForm.attr("action", "/hrms/notice/noticeUpdateForm");
		delForm.attr("method", "get");
		delForm.submit();
	});
	
	//삭제버튼
	deleteBtn.on("click", function(){
		if(confirm("정말 삭제하시겠습니까?")){
			delForm.submit();
		}
	});
});

</script>
</html>