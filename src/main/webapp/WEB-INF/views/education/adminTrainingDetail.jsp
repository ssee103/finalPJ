<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"  %>
<%@page import="kr.or.ddit.properties.vo.PropertiesVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>전체교육관리자세히보기</title>
</head>
<body>
<%
	List<PropertiesVO> userRentalAll = (List<PropertiesVO>) request.getAttribute("userRentalAll");          
%>
	
	
	<div class="main-wrapper">
		<%@ include file="/WEB-INF/views/theme/header.jsp" %>
		<%@ include file="/WEB-INF/views/theme/sidebar.jsp" %>
		
		
		<div class="page-wrapper">
			<div class="content">

				<div class="row align-items-center mb-4">
					<div class="d-md-flex d-sm-block justify-content-between align-items-center flex-wrap">
						<h6 class="fw-medium d-inline-flex align-items-center mb-3 mb-sm-0"><a href="/hrms/education/admin/adminAllTrainingListSearch">
							<i class="ti ti-arrow-left me-2"></i>Back to List</a>
						</h6>
						<div class="d-flex">
							<div class="text-end">
								<a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edit_project"><i class="ti ti-edit me-1"></i>Edit Project</a>
							</div>
							<div class="head-icons ms-2 text-end">
								<a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
									<i class="ti ti-chevrons-up"></i>
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xxl-3 col-xl-4 theiaStickySidebar">
						<div class="card">
							<div class="card-body">
								<h5 class="mb-3">교육상세정보</h5>
								<div class="list-group details-list-group mb-4">
									
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육명</span>
											<p class="text-gray-9">{교육명}</p>
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육분류</span>
											<p class="text-gray-9">150 hrs</p>
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육방식</span>
											<p class="text-gray-9">14 Nov 2026</p>
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육자</span>
											<p class="text-gray-9">15 Jan 2026</p>
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육정원</span>
											<p class="text-gray-9">15 Jan 2026</p>
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육자</span>
											<p class="text-gray-9">15 Jan 2026</p>
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육대상</span>
											<div class="d-flex align-items-center">
												<p class="text-gray-9 mb-0">15 Nov 2026</p>
												<span class="badge badge-danger d-inline-flex align-items-center ms-2"><i class="ti ti-clock-stop"></i>1</span>
											</div>
											
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>모집기간</span>
											<div class="d-flex align-items-center">
												<span class="avatar avatar-sm avatar-rounded me-2">
													<img src="assets/img/profiles/avatar-02.jpg" alt="Img">
												</span>
												<p class="text-gray-9 mb-0">Cameron</p>
											</div>
											
										</div>
									</div>
									<div class="list-group-item">
										<div class="d-flex align-items-center justify-content-between">
											<span>교육기간</span>
											<div class="d-flex align-items-center">
												<span class="avatar avatar-sm avatar-rounded me-2">
													<img src="assets/img/profiles/avatar-02.jpg" alt="Img">
												</span>
												<p class="text-gray-9 mb-0">Cameron</p>
											</div>
										</div>
									</div>
								</div>
								<h5 class="mb-3">교육 교재</h5>
								<div class="bg-light p-2 rounded">
									<span class="d-block mb-1">교육 교재</span>
									<h4 class="mb-2">{교재명}</h4>
									<a href="${pageContext.request.contextPath }/assets/img/media/media-big-08.jpg" data-fancybox="gallery" class="gallery-item">
										<img src="${pageContext.request.contextPath }/assets/img/media/media-08.jpg" class=" rounded" alt="img">
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xxl-9 col-xl-8">
						<div class="card">
							<div class="card-body">
								<div class="bg-light rounded p-3 mb-3">
									<div class="d-flex align-items-center">
										<a href="project-details.html" class="flex-shrink-0 me-2">
											<img src="${pageContext.request.contextPath }/assets/img/social/project-01.svg" alt="Img">
										</a>
										<div>
											<h6 class="mb-1"><a href="project-details.html">Hospital Administration</a></h6>
											<p>교육번호 : <span class="text-primary"> PRO-0004</span></p>
										</div>
									</div>
								</div>
								<div class="row align-items-center">
									<div class="col-sm-3">
										<p class="d-flex align-items-center mb-3"><i class="ti ti-square-rounded me-2"></i>교육활성화 여부</p>
									</div>
									<div class="col-sm-9">
										<span class="badge badge-soft-purple d-inline-flex align-items-center mb-3"><i class="ti ti-point-filled me-1"></i>InProgress</span>
									</div>
									<div class="col-sm-3">
										<p class="d-flex align-items-center mb-3"><i class="ti ti-users-group me-2"></i>교육대상</p>
									</div>
									<div class="col-sm-9">
										<div class="d-flex align-items-center mb-3">
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/profiles/avatar-12.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Lewis</a></h6>
											</div>
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/users/user-19.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Leona</a></h6>
											</div>
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/users/user-33.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Pineiro</a></h6>
											</div>
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/users/user-37.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Moseley</a></h6>
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<p class="d-flex align-items-center mb-3"><i class="ti ti-user-shield me-2"></i>교육대상직급</p>
									</div>
									<div class="col-sm-9">
										<div class="d-flex align-items-center mb-3">
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/users/user-42.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Ruth</a></h6>
											</div>
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/users/user-44.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Meredith</a></h6>
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<p class="d-flex align-items-center mb-3"><i class="ti ti-user-star me-2"></i>교육강사</p>
									</div>
									<div class="col-sm-9">
										<div class="d-flex align-items-center mb-3">
											<div class="bg-gray-100 p-1 rounded d-flex align-items-center me-2">
												<a href="#" class="avatar avatar-sm avatar-rounded border border-white flex-shrink-0 me-2">
													<img src="${pageContext.request.contextPath }/assets/img/users/user-45.jpg" alt="Img">
												</a>
												<h6 class="fs-12"><a href="#">Dwight</a></h6>
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<p class="d-flex align-items-center mb-3"><i class="ti ti-bookmark me-2"></i>Tags</p>
									</div>
									<div class="col-sm-9">
										<div class="d-flex align-items-center mb-3">
											<a href="#" class="badge task-tag bg-pink rounded-pill me-2">Admin Panel</a>
											<a href="#" class="badge task-tag badge-info rounded-pill">High Tech</a>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="mb-3">
											<h6 class="mb-1">교육정보설명</h6>
											<p>{교육설명}
											</p>
										</div>
									</div>
									<div class="col-md-12">
										<div class="bg-soft-secondary p-3 rounded d-flex align-items-center justify-content-between">
											<p class="text-secondary mb-0">Time Spent on this project</p>
											<h3 class="text-secondary">65/120 <span class="fs-16">Hrs</span></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="custom-accordion-items">
							<div class="accordion accordions-items-seperate" id="accordionExample">
								<div class="accordion-item">
									<div class="accordion-header" id="headingTwo">
										<div class="accordion-button">
											<h5>커리큘럼</h5>
											<div class=" ms-auto">
												<a href="#" class="d-flex align-items-center collapsed collapse-arrow" data-bs-toggle="collapse" data-bs-target="#primaryBorderTwo" aria-expanded="false" aria-controls="primaryBorderTwo">
													<i class="ti ti-chevron-down fs-18"></i>
												</a>
											</div>
										</div>
									</div>
									<div id="primaryBorderTwo" class="accordion-collapse collapse show border-top" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<div class="list-group list-group-flush">
												<div class="list-group-item border rounded mb-2 p-2">
													<div class="row align-items-center row-gap-3">
														<div class="col-md-7">
															<div class="todo-inbox-check d-flex align-items-center flex-wrap row-gap-3">
																<span><i class="ti ti-grid-dots me-2"></i></span>
																<div class="strike-info">
																	<h4 class="fs-14">Patient appointment booking</h4>
																</div>
															</div>
														</div>
														<div class="col-md-5">
															<div class="d-flex align-items-center justify-content-md-end flex-wrap row-gap-3">
																<span class="badge bg-soft-pink d-inline-flex align-items-center me-3"><i class="fas fa-circle fs-6 me-1"></i>Onhold</span>
																<div class="d-flex align-items-center">
																	<div class="dropdown ms-2">
																		<a href="javascript:void(0);" class="d-inline-flex align-items-center" data-bs-toggle="dropdown">
																			<i class="ti ti-dots-vertical"></i>
																		</a>
																		<ul class="dropdown-menu dropdown-menu-end p-3">
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#edit_todo"><i class="ti ti-edit me-2"></i>Edit</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash me-2"></i>Delete</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#view_todo"><i class="ti ti-eye me-2"></i>View</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="list-group-item border rounded mb-2 p-2">
													<div class="row align-items-center row-gap-3">
														<div class="col-md-7">
															<div class="todo-inbox-check d-flex align-items-center flex-wrap row-gap-3">
																<span><i class="ti ti-grid-dots me-2"></i></span>
																<div class="strike-info">
																	<h4 class="fs-14">Appointment booking with payment gateway</h4>
																</div>
															</div>
														</div>
														<div class="col-md-5">
															<div class="d-flex align-items-center justify-content-md-end flex-wrap row-gap-3">
																<span class="badge bg-transparent-purple d-flex align-items-center me-3"><i class="fas fa-circle fs-6 me-1"></i>Inprogress</span>
																<div class="d-flex align-items-center">
																	<div class="dropdown ms-2">
																		<a href="javascript:void(0);" class="d-inline-flex align-items-center" data-bs-toggle="dropdown">
																			<i class="ti ti-dots-vertical"></i>
																		</a>
																		<ul class="dropdown-menu dropdown-menu-end p-3">
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#edit_todo"><i class="ti ti-edit me-2"></i>Edit</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash me-2"></i>Delete</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#view_todo"><i class="ti ti-eye me-2"></i>View</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="list-group-item border rounded mb-2 p-2">
													<div class="row align-items-center row-gap-3">
														<div class="col-md-7">
															<div class="todo-inbox-check d-flex align-items-center flex-wrap row-gap-3">
																<span><i class="ti ti-grid-dots me-2"></i></span>
																<div class="strike-info">
																	<h4 class="fs-14">Patient and Doctor video conferencing</h4>
																</div>
															</div>
														</div>
														<div class="col-md-5">
															<div class="d-flex align-items-center justify-content-md-end flex-wrap row-gap-3">
																<span class="badge badge-soft-success align-items-center me-3"><i class="fas fa-circle fs-6 me-1"></i>Completed</span>
																<div class="d-flex align-items-center">
																	<div class="dropdown ms-2">
																		<a href="javascript:void(0);" class="d-inline-flex align-items-center" data-bs-toggle="dropdown">
																			<i class="ti ti-dots-vertical"></i>
																		</a>
																		<ul class="dropdown-menu dropdown-menu-end p-3">
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#edit_todo"><i class="ti ti-edit me-2"></i>Edit</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash me-2"></i>Delete</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#view_todo"><i class="ti ti-eye me-2"></i>View</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="list-group-item border rounded mb-2 p-2">
													<div class="row align-items-center row-gap-3">
														<div class="col-md-7">
															<div class="todo-inbox-check d-flex align-items-center flex-wrap row-gap-3">
																<span><i class="ti ti-grid-dots me-2"></i></span>
																<div class="strike-info">
																	<h4 class="fs-14">Go-Live and Post-Implementation Support</h4>
																</div>
															</div>
														</div>
														<div class="col-md-5">
															<div class="d-flex align-items-center justify-content-md-end flex-wrap row-gap-3">
																<span class="badge badge-secondary-transparent d-flex align-items-center me-3"><i class="fas fa-circle fs-6 me-1"></i>Pending</span>
																<div class="d-flex align-items-center">
																	<div class="dropdown ms-2">
																		<a href="javascript:void(0);" class="d-inline-flex align-items-center" data-bs-toggle="dropdown">
																			<i class="ti ti-dots-vertical"></i>
																		</a>
																		<ul class="dropdown-menu dropdown-menu-end p-3">
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#edit_todo"><i class="ti ti-edit me-2"></i>Edit</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash me-2"></i>Delete</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#view_todo"><i class="ti ti-eye me-2"></i>View</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="list-group-item border rounded mb-2 p-2">
													<div class="row align-items-center row-gap-3">
														<div class="col-md-7">
															<div class="todo-inbox-check d-flex align-items-center flex-wrap row-gap-3">
																<span><i class="ti ti-grid-dots me-2"></i></span>
																<div class="strike-info">
																	<h4 class="fs-14">Go-Live and Post-Implementation Support</h4>
																</div>
															</div>
														</div>
														<div class="col-md-5">
															<div class="d-flex align-items-center justify-content-md-end flex-wrap row-gap-3">
																<span class="badge bg-transparent-purple d-flex align-items-center me-3"><i class="fas fa-circle fs-6 me-1"></i>Inprogress</span>
																<div class="d-flex align-items-center">
																	<div class="dropdown ms-2">
																		<a href="javascript:void(0);" class="d-inline-flex align-items-center" data-bs-toggle="dropdown">
																			<i class="ti ti-dots-vertical"></i>
																		</a>
																		<ul class="dropdown-menu dropdown-menu-end p-3">
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#edit_todo"><i class="ti ti-edit me-2"></i>Edit</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash me-2"></i>Delete</a>
																			</li>
																			<li>
																				<a href="javascript:void(0);" class="dropdown-item rounded-1" data-bs-toggle="modal" data-bs-target="#view_todo"><i class="ti ti-eye me-2"></i>View</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<button class="btn bg-primary-transparent border-dashed border-primary w-100 text-start" data-bs-toggle="modal" data-bs-target="#add_todo">
													<i class="ti ti-plus me-2"></i>New task
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2001 - 2025 &copy; HRMS.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">HERMES</a></p>
			</div>
		</div>
		<!-- /Page Wrapper -->
		
		
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
					<form action="projects.html">
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
					<form action="projects.html">
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
										<a href="projects.html" class="btn btn-dark w-100">Back to List</a>
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

		<!-- Edit Todo -->
		<div class="modal fade" id="edit_todo">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Edit Todo</h4>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<form action="project-details.html">
						<div class="modal-body">
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">Todo Title</label>
										<input type="text" class="form-control" value="Update calendar and schedule">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<label class="form-label">Tag</label>
										<select class="select">
											<option>Select</option>
											<option selected>Internal</option>
											<option>Projects</option>
											<option>Meetings</option>
											<option>Reminder</option>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<label class="form-label">Priority</label>
										<select class="select">
											<option>Select</option>
											<option>High</option>
											<option selected>Medium</option>
											<option>Low</option>
										</select>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="mb-3">
										<label class="form-label">Descriptions</label>
										<div class="summernote"></div>
									</div>
								</div>
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">Add Assignee</label>
										<select class="select">
											<option>Select</option>
											<option selected>Sophie</option>
											<option>Cameron</option>
											<option>Doris</option>
											<option>Rufana</option>
										</select>
									</div>
								</div>
								<div class="col-12">
									<div class="mb-0">
										<label class="form-label">Status</label>
										<select class="select">
											<option>Select</option>
											<option selected>Completed</option>
											<option>Pending</option>
											<option>Onhold</option>
											<option>Inprogress</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /Edit Todo -->

		<!-- Todo Details -->
		<div class="modal fade" id="view_todo">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header bg-dark">
						<h4 class="modal-title text-white">Respond to any pending messages</h4>
						<span class="badge badge-danger d-inline-flex align-items-center"><i class="ti ti-square me-1"></i>Urgent</span>
						<span><i class="ti ti-star-filled text-warning"></i></span>
						<a href="#"><i class="ti ti-trash text-white"></i></a>
						<button type="button" class="btn-close custom-btn-close bg-transparent fs-16 text-white position-static" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<div class="modal-body">
						<h5 class="mb-2">Task Details</h5>
						<div class="border rounded mb-3 p-2">
							<div class="row row-gap-3">
								<div class="col-md-4">
									<div class="text-center">
										<span class="d-block mb-1">Created On</span>
										<p class="text-dark">22 July 2025</p>
									</div>
								</div>
								<div class="col-md-4">
									<div class="text-center">
										<span class="d-block mb-1">Due Date</span>
										<p class="text-dark">22 July 2025</p>
									</div>
								</div>
								<div class="col-md-4">
									<div class="text-center">
										<span class="d-block mb-1">Status</span>
										<span class="badge badge-soft-success d-inline-flex align-items-center">
											<i class="fas fa-circle fs-6 me-1"></i>Completed
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<h5 class="mb-2">Description</h5>
							<p>Hiking is a long, vigorous walk, usually on trails or footpaths in 
								the countryside. Walking for pleasure developed in Europe during the eighteenth century. 
								Religious pilgrimages have existed much longer but they involve walking long distances for a 
								spiritual purpose associated with specific 
								religions and also we achieve inner peace while we hike at a local park.
							</p>
						</div>
						<div class="mb-3">
							<h5 class="mb-2">Tags</h5>
							<div class="d-flex align-items-center">
								<span class="badge badge-danger me-2">Internal</span>
								<span class="badge badge-success me-2">Projects</span>
								<span class="badge badge-secondary">Reminder</span>
							</div>
						</div>
						<div>
							<h5 class="mb-2">Assignee</h5>
							<div class="avatar-list-stacked avatar-group-sm">
								<span class="avatar avatar-rounded">
									<img class="border border-white" src="assets/img/profiles/avatar-23.jpg" alt="img">
								</span>
								<span class="avatar avatar-rounded">
									<img class="border border-white" src="assets/img/profiles/avatar-24.jpg" alt="img">
								</span>
								<span class="avatar avatar-rounded">
									<img class="border border-white" src="assets/img/profiles/avatar-25.jpg" alt="img">
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Todo Details -->

		<!-- Add Todo -->
		<div class="modal fade" id="add_todo">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add New Todo</h4>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<form action="project-details.html">
						<div class="modal-body">
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">Todo Title</label>
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<label class="form-label">Tag</label>
										<select class="select">
											<option>Select</option>
											<option>Internal</option>
											<option>Projects</option>
											<option>Meetings</option>
											<option>Reminder</option>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<label class="form-label">Priority</label>
										<select class="select">
											<option>Select</option>
											<option>Medium</option>
											<option>High</option>
											<option>Low</option>
										</select>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="mb-3">
										<label class="form-label">Descriptions</label>
										<div class="summernote"></div>
									</div>
								</div>
								<div class="col-12">
									<div class="mb-3">
										<label class="form-label">Add Assignee</label>
										<select class="select">
											<option>Select</option>
											<option>Sophie</option>
											<option>Cameron</option>
											<option>Doris</option>
											<option>Rufana</option>
										</select>
									</div>
								</div>
								<div class="col-12">
									<div class="mb-0">
										<label class="form-label">Status</label>
										<select class="select">
											<option>Select</option>
											<option>Completed</option>
											<option>Pending</option>
											<option>Onhold</option>
											<option>Inprogress</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Add New Todo</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /Add Todo -->

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
							<a href="project-details.html" class="btn btn-danger">Yes, Delete</a>
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