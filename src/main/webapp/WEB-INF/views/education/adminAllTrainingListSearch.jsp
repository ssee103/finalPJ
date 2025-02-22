<%@page import="kr.or.ddit.education.vo.BookVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>전체교육목록관리</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<div id="global-loader">
		<div class="page-loader"></div>
	</div>
	
	<div class="main-wrapper">
		<%@ include file="/WEB-INF/views/theme/header.jsp" %>
		<%@ include file="/WEB-INF/views/theme/sidebar.jsp" %>
		
		
		<div class="page-wrapper">
			<div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">전체교육목록관리</h2>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="me-2 mb-2">
							<div class="dropdown">
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
									</li>
								</ul>
							</div>
						</div>
						<div class="mb-2">
							<a href="#" data-bs-toggle="modal" data-bs-target="#add_book" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>교재 등록하기</a>
						</div>&nbsp;
						<div class="mb-2">
							<a href="#" data-bs-toggle="modal" data-bs-target="#add_project" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>강의 등록하기</a>
						</div>
						<div class="ms-2 head-icons">
							<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
								<i class="ti ti-chevrons-up"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /Breadcrumb -->

				<!-- Leads List -->
				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>전체교육목록관리</h5>
						<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="교육명" style="width: 100px;" id="edcTitle">
								</div>
							</div>
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="강사" style="width: 100px;" id="educator">
								</div>
							</div>
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="교육분류" style="width: 100px;" id="edcSort">
								</div>
							</div>
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="교육대상" style="width: 100px;" id="edcTarget">
								</div>
							</div>
							<input type="button" class="btn btn-primary d-flex align-items-center" value="검색" id="searchBtn">
						</div>
					</div>
					<div class="card-body p-0"> <!-- CARD CARD CARDCARDCARDCARDCARDCARDCARDCARDCARDCARDCARDCARD -->
						<div class="custom-datatable-filter table-responsive">
							<table class="table datatable">
								<thead class="thead-light">
									<tr>
										<th>강의제목</th>
										<th>교육담당</th>
										<th>수강정원</th>
										<th>수강기간</th>
										<th>교육대상</th>
										<th>모집기간</th>
										<th>교육해당부서</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="dataTable-tbody">
								
								</tbody> 
							</table> <!-- /테이블 -->
						</div>
					</div>
					<div id="pagingArea" style="display: flex; justify-content: center; align-items: center; padding:15px;">
					</div>
					<script>
						let searchBtn = $("#searchBtn");
						let pagingArea = $("#pagingArea");
						getList(1);
					$(function(){
						/* 	
 							if(!sessionStorage.getItem("currentPage")){
								getList(1);
							}else{
								getList(sessionStorage.getItem("currentPage"));
							} */
							searchBtn.on("click", function(){
								let edcTitle = $("#edcTitle");
								let educator = $("#educator");
								let edcSort = $("#edcSort");
								let edcTarget = $("#edcTarget");
								
								console.log("검색어들 : ", edcTitle.val(), educator.val(), edcSort.val(), edcTarget.val());
								getList(1, edcTitle.val(), educator.val(), edcSort.val(), edcTarget.val());
							});
							
							pagingArea.on("click", "a", function(){
								event.preventDefault();
								let page = $(this).data("page");
								let edcTitle = $("#edcTitle");
								let educator = $("#educator");
								let edcPsncpa = $("#edcPsncpa");
								let edcSdate = $("#edcSdate");
								let edcEdate = $("#edcEdate");
								let recruitSdate = $("#recruitSdate");
								let recruitEdate = $("#recruitEdate");
								let edcTarget = $("#edcTarget");
								let edcSort = $("#edcSort");
								getList(page, edcTitle.val(), educator.val(), edcSort.val(), edcTarget.val());
							})
							
							
						});
						
						function getList(page, edcTitle, educator, edcSort, edcTarget) {
						    let pagingArea = $("#pagingArea");
						    let dataTable_tbody = $("#dataTable-tbody");

						    // 기본 데이터 설정
						    let data = { page: page };

						    if (edcTitle != null) data.edcTitle = edcTitle;
						    if (educator != null) data.educator = educator;
						    if (edcSort != null) data.edcSort = edcSort;
						    if (edcTarget != null) data.edcTarget = edcTarget;
						    
						    console.log("전송 데이터:", data);

						    $.ajax({
						        url: "/hrms/education/admin/rest/getEducationAllList",
						        type: "POST",
						        data: JSON.stringify(data),
						        contentType: "application/json;charset=utf-8",
						        success: function (res) {
						            console.log("응답 데이터:", res);

						            let tr = "";

						            if (res.eduAllList && res.eduAllList.length > 0) {
						            	res.eduAllList.forEach(function(edu) {
						            	    let recruitPeriod = `${edu.recruitSdateFormatted} ~ ${edu.recruitEdateFormatted}`;
						            	    let edcPeriod = `${edu.edcSdateFormatted} ~ ${edu.edcEdateFormatted}`;

						            	    tr += `
												<tr>
							            	    	<td><p class="fs-14 text-dark fw-medium"><a href="/hrms/education/admin/adminTrainingDetail">\${edu.edcTitle}</a></p></td>
						                            <td>\${edu.educator}</td>
						                            <td>\${edu.edcPsncpa}</td>
						                            <td>
						                                <span class="text-nowrap">\${edu.edcSdateFormatted}</span> <br> 
						                                <span class="text-nowrap"> ~ \${edu.edcEdateFormatted}</span>
						                            </td>
						                            <td>\${edu.edcTarget}</td>
						                            <td>
						                                <span class="text-nowrap">\${edu.recruitSdateFormatted}</span> <br> 
						                                <span class="text-nowrap"> ~ \${edu.recruitEdateFormatted}</span>
						                            </td>
						                            <td>\${edu.edcSort}</td>
						                            <td>
						                                <div class="action-icon d-inline-flex">
						                                    <a href="#" class="me-2" data-bs-toggle="modal" data-bs-target="#edit_activity"><i class="ti ti-edit"></i></a>
						                                    <a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash"></i></a>
						                                </div>
						                            </td>
						            	        </tr>	
						            	    `;
						            	});



						                // 데이터 삽입
						                dataTable_tbody.html(tr);
						            } else {
						                dataTable_tbody.html(`<tr><td colspan="8" class="text-center">데이터가 없습니다.</td></tr>`);
						            }

						            pagingArea.html(res.pageVO.pagingHTML);
						        },
						        error: function (error) {
						            console.log("AJAX 요청 실패", error);
						        },
						    });
						}

					</script>
				</div>
				<!-- /Leads List -->
			</div>
			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2001 - 2025 &copy; HRMS.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">HERMES</a></p>
			</div>
		</div>
		<!-- /Page Wrapper -->
		<!-- Add Project -->
		<div class="modal fade" id="add_project" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header header-border align-items-center justify-content-between">
						<div class="d-flex align-items-center">
							<h5 class="modal-title me-2">Add Project </h5>
							<p class="text-dark">Project ID : PRO-0004</p>
						</div>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<div class="add-info-fieldset ">
						<div class="contact-grids-tab p-3 pb-0">
							<ul class="nav nav-underline" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="basic-tab" data-bs-toggle="tab" data-bs-target="#basic-info" type="button" role="tab" aria-selected="true">Basic Information</button>
								  </li>
								  <li class="nav-item" role="presentation">
									<button class="nav-link" id="member-tab" data-bs-toggle="tab" data-bs-target="#member" type="button" role="tab" aria-selected="false">Members</button>
								  </li>
							</ul>
						</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="basic-info" role="tabpanel" aria-labelledby="basic-tab" tabindex="0">
							<form>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">                                                
												<div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
													<i class="ti ti-photo text-gray-2 fs-16"></i>
												</div>                                              
												<div class="profile-upload">
													<div class="mb-2">
														<h6 class="mb-1">Upload Project Logo</h6>
														<p class="fs-12">Image should be below 4 mb</p>
													</div>
													<div class="profile-uploader d-flex align-items-center">
														<div class="drag-upload-btn btn btn-sm btn-primary me-2">
															Upload
															<input type="file" class="form-control image-sign" multiple="">
														</div>
														<a href="javascript:void(0);" class="btn btn-light btn-sm">Cancel</a>
													</div>
													
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Project Name</label>
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Client</label>
												<select class="select">
													<option>Select</option>
													<option>Anthony Lewis</option>
													<option>Brian Villalobos</option>
												</select>
											</div>
										</div>
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-6">
													<div class="mb-3">
														<label class="form-label">Start Date</label>
														<div class="input-icon-end position-relative">
															<input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
															<span class="input-icon-addon">
																<i class="ti ti-calendar text-gray-7"></i>
															</span>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="mb-3">
														<label class="form-label">End Date</label>
														<div class="input-icon-end position-relative">
															<input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
															<span class="input-icon-addon">
																<i class="ti ti-calendar text-gray-7"></i>
															</span>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label class="form-label">Priority</label>
														<select class="select">
															<option>Select</option>
															<option>High</option>
															<option>Medium</option>
															<option>Low</option>
														</select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label class="form-label">Project Value</label>
														<input type="text" class="form-control" value="$">
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label class="form-label">Price Type</label>
														<input type="text" class="form-control" value="">
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Description</label>
												<div class="summernote"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="input-block mb-0">
												<label class="form-label">Upload Files</label>
												<input class="form-control" type="file">
											</div>
										</div>
									</div>								
								</div>
								<div class="modal-footer">
									<div class="d-flex align-items-center justify-content-end">
										<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
										<button class="btn btn-primary" type="submit">Save</button>
									</div>
								</div>
							</form>
							</div>
							<div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab" tabindex="0">
							<form>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label me-2">Team Members</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Jerald,Andrew,Philip,Davis">
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label me-2">Team Leader</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Hendry,James">
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label me-2">Project Manager</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Dwight">
											</div>
										</div>
										<div class="col-md-12">
											<div>
												<label class="form-label">Tags</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Collab,Promotion,Rated">
											</div>
										</div>
										
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Status</label>
												<select class="select">
													<option>Select</option>
													<option>Active</option>
													<option>Inactive</option>
												</select>
											</div>
										</div>
									</div>								
								</div>
								<div class="modal-footer">
									<div class="d-flex align-items-center justify-content-end">
										<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
										<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#success_modal">Save</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!-- /Add Project -->
		
		<!-- Add Book -->
		<div class="modal fade" id="add_book" role="dialog">
		    <div class="modal-dialog modal-dialog-centered modal-lg">
		        <div class="modal-content">
		            <div class="modal-header header-border align-items-center justify-content-between">
		                <div class="d-flex align-items-center">
		                    <h5 class="modal-title me-2">강의 도서추가</h5>
		                </div>
		                <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
		                    <i class="ti ti-x"></i>
		                </button>
		            </div>
		            <div class="add-info-fieldset ">
		                <div class="contact-grids-tab p-3 pb-0">
		                    <ul class="nav nav-underline" id="myTab" role="tablist">
		                        <li class="nav-item" role="presentation">
		                            <button class="nav-link active" id="basic-tab" data-bs-toggle="tab" data-bs-target="#basic-info" type="button" role="tab" aria-selected="true">Basic Information</button>
		                        </li>
		                    </ul>
		                </div>
		                <div class="tab-content" id="myTabContent">
		                    <div class="tab-pane fade show active" id="basic-info" role="tabpanel" aria-labelledby="basic-tab" tabindex="0">
		                        <form id="bookForm">
		                            <div class="modal-body">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">
		                                            <div class="profile-upload">
		                                                <div class="mb-2">
		                                                    <h6 class="mb-1">도서 검색하기 (ENTER 키를 눌러주세요!)</h6>
		                                                    <div class="search-container">
		                                                        <input type="text" id="searchInput" placeholder="책 제목을 입력하세요">
		                                                        <button type="button" onclick="searchBooks()">Search</button>
		                                                    </div>
		                                                    <div id="searchResults" style="display: none;"></div>
		                                                    <p class="fs-12">Image should be below 4 mb</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-12 text-center">
		                                        <img id="bookThumbnail" src="" alt="Book Thumbnail" style="max-width: 150px; display: none;">
		                                    </div>
		                                    <div class="col-md-12">
		                                        <div class="mb-3">
		                                            <label class="form-label">Title</label>
		                                            <input type="text" id="bookTitle" class="form-control" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-12">
		                                        <div class="mb-3">
		                                            <label class="form-label">Sale Price</label>
		                                            <input type="text" id="bookPrice" class="form-control" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-12">
		                                        <div class="mb-3">
		                                            <label class="form-label">Publisher</label>
		                                            <input type="text" id="bookPublisher" class="form-control" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-12">
		                                        <div class="mb-3">
		                                            <label class="form-label">ISBN</label>
		                                            <input type="text" id="bookIsbn" class="form-control" readonly>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="modal-footer">
		                                <div class="d-flex align-items-center justify-content-end">
		                                    <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">닫기</button>
		                                    <button type="button" onclick="saveBookBtn()" class="btn btn-primary">저장</button>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- /Add Book -->
		
		<script>
		// 날짜 형식을 "yyyy-MM-dd HH:mm"으로 변환하는 함수
		function formatDateTime(dateString) {
		    if (!dateString) return "";
		    
		    let date = new Date(dateString);
		    let year = date.getFullYear();
		    let month = String(date.getMonth() + 1).padStart(2, "0");
		    let day = String(date.getDate()).padStart(2, "0");
		    let hours = String(date.getHours()).padStart(2, "0");
		    let minutes = String(date.getMinutes()).padStart(2, "0");
		    
		    return `${year}-${month}-${day} ${hours}:${minutes}`;
		}

		
		function searchBooks() {
		    var searchInput = $('#searchInput').val();
		    $.ajax({
		        method: 'GET',
		        url: 'https://dapi.kakao.com/v3/search/book',
		        data: { query: searchInput },
		        headers: { Authorization: "KakaoAK 50d753224767b8df6c6cc952f53afdf8" }
		    })
		    .done(function (response) {
		        var books = response.documents;
		        var searchResults = $('#searchResults');
		        searchResults.empty().show();
		        books.forEach(function (book) {
		            var resultHtml = '<div class="book-item" onclick="fillBookForm(' + JSON.stringify(book).replace(/"/g, '&quot;') + ')">' +
		                '<img src="' + book.thumbnail + '" style="cursor:pointer; width:100px;">' +
		                '<p>' + book.title + '</p>' + '<p>' + book.sale_price + '</p>' + '<p>' + book.publisher + '</p>' +
		                '<p>' + book.isbn + '</p>' + '<p>' + book.thumbnail + '</p>'  +
		                '</div>';
		            searchResults.append(resultHtml);
		        });
		    })
		    .fail(function (error) {
		        console.error('책 검색에 실패했습니다:', error);
		    });
		}
		
		function fillBookForm(book) {
		    $('#bookTitle').val(book.title);
		    $('#bookPrice').val(book.sale_price);
		    $('#bookPublisher').val(book.publisher);
		    $('#bookIsbn').val(book.isbn);
		    $('#bookThumbnail').attr('src', book.thumbnail).show();
		}
		
		function saveBookBtn() {
		
	        console.log("saveBookBtn 클릭"); 

	        let bookData = {
	            bookNo: $('#bookIsbn').val(),           				// ISBN → BOOK_NO
	            bookName: $('#bookTitle').val(),       					// 제목 → BOOK_NAME
	            bookPrice: $('#bookPrice').val(),      					// 가격 → BOOK_PRICE
	            bookCompany: $('#bookPublisher').val() 					// 출판사 → BOOK_COMPANY
	        };

	        console.log("보낼 데이터:", bookData); 						// 데이터 확인

	        $.ajax({
	            url: '/hrms/education/admin/rest/insertBook',
	            method: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(bookData),
	            success: function (response) {
	                console.log("성공 응답:", response); 				// 서버 응답 확인
	                alert('도서가 성공적으로 등록되었습니다!');
	                location.reload();
	            },
	            error: function (xhr, status, error) {
	                console.error("도서 등록 실패:", xhr.responseText);  // 에러 로그
	                alert('도서 등록 중 오류가 발생했습니다.');
	            }
	        });
		}
		</script>
		
		<!-- Edit Project -->
		<div class="modal fade" id="edit_project" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header header-border align-items-center justify-content-between">
						<div class="d-flex align-items-center">
							<h5 class="modal-title me-2">Edit Project </h5>
							<p class="text-dark">Project ID : PRO-0004</p>
						</div>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<div class="add-info-fieldset ">
						<div class="contact-grids-tab p-3 pb-0">
							<ul class="nav nav-underline" id="myTab1" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="basic-tab1" data-bs-toggle="tab" data-bs-target="#basic-info1" type="button" role="tab" aria-selected="true">Basic Information</button>
								  </li>
								  <li class="nav-item" role="presentation">
									<button class="nav-link" id="member-tab1" data-bs-toggle="tab" data-bs-target="#member1" type="button" role="tab" aria-selected="false">Members</button>
								  </li>
							</ul>
						</div>
							<div class="tab-content" id="myTabContent1">
								<div class="tab-pane fade show active" id="basic-info1" role="tabpanel" aria-labelledby="basic-tab1" tabindex="0">
							<form>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">                                                
												<div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
													<i class="ti ti-photo text-gray-2 fs-16"></i>
												</div>                                              
												<div class="profile-upload">
													<div class="mb-2">
														<h6 class="mb-1">Upload Project Logo</h6>
														<p class="fs-12">Image should be below 4 mb</p>
													</div>
													<div class="profile-uploader d-flex align-items-center">
														<div class="drag-upload-btn btn btn-sm btn-primary me-2">
															Upload
															<input type="file" class="form-control image-sign" multiple="">
														</div>
														<a href="javascript:void(0);" class="btn btn-light btn-sm">Cancel</a>
													</div>
													
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Project Name</label>
												<input type="text" class="form-control" value="Office Management">
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Client</label>
												<select class="select">
													<option>Select</option>
													<option selected>Anthony Lewis</option>
													<option>Brian Villalobos</option>
												</select>
											</div>
										</div>
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-6">
													<div class="mb-3">
														<label class="form-label">Start Date</label>
														<div class="input-icon-end position-relative">
															<input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
															<span class="input-icon-addon">
																<i class="ti ti-calendar text-gray-7"></i>
															</span>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="mb-3">
														<label class="form-label">End Date</label>
														<div class="input-icon-end position-relative">
															<input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
															<span class="input-icon-addon">
																<i class="ti ti-calendar text-gray-7"></i>
															</span>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label class="form-label">Priority</label>
														<select class="select">
															<option>Select</option>
															<option>High</option>
															<option>Medium</option>
															<option>Low</option>
														</select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label class="form-label">Project Value</label>
														<input type="text" class="form-control" value="$">
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label class="form-label">Price Type</label>
														<input type="text" class="form-control" value="">
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Description</label>
												<div class="summernote"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="input-block mb-0">
												<label class="form-label">Upload Files</label>
												<input class="form-control" type="file">
											</div>
										</div>
									</div>								
								</div>
								<div class="modal-footer">
									<div class="d-flex align-items-center justify-content-end">
										<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
										<button class="btn btn-primary" type="submit">Save</button>
									</div>
								</div>
							</form>
							</div>
							<div class="tab-pane fade" id="member1" role="tabpanel" aria-labelledby="member-tab1" tabindex="0">
							<form>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label me-2">Team Members</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Jerald,Andrew,Philip,Davis">
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label me-2">Team Leader</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Hendry,James">
											</div>
										</div>
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label me-2">Project Manager</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Dwight">
											</div>
										</div>
										<div class="col-md-12">
											<div>
												<label class="form-label">Tags</label>
												<input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Collab,Promotion,Rated">
											</div>
										</div>
										
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label">Status</label>
												<select class="select">
													<option>Select</option>
													<option selected>Active</option>
													<option>Inactive</option>
												</select>
											</div>
										</div>
									</div>								
								</div>
								<div class="modal-footer">
									<div class="d-flex align-items-center justify-content-end">
										<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
										<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#success_modal">Save</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!-- /Edit Project -->
		
		<!-- Add Project Success -->
		<div class="modal fade" id="success_modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-body">
						<div class="text-center p-3">
							<span class="avatar avatar-lg avatar-rounded bg-success mb-3"><i class="ti ti-check fs-24"></i></span>
							<h5 class="mb-2">Project  Added Successfully</h5>
							<p class="mb-3">Stephan Peralt has been added with Client ID : <span class="text-primary">#pro - 0004</span>
							</p>
							<div>
								<div class="row g-2">
									<div class="col-6">
										<a  class="btn btn-dark w-100">Back to List</a>
									</div>
									<div class="col-6">
										<a href="project-details.html" class="btn btn-primary w-100">Detail Page</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Add Project Success -->
		
		<!-- Delete Modal -->
		<div class="modal fade" id="delete_modal">
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
							<a href="projects-grid.html" class="btn btn-danger">Yes, Delete</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Delete Modal -->
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

<!-- Datatable JS -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/dataTables.bootstrap5.min.js"></script>	

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
</html>