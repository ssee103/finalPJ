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
	<title>승진관리</title>
    
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
						<h2 class="mb-1">승진관리</h2>
					</div>
				</div>
				<!-- /Breadcrumb -->

				<div class="row">

					<!-- Total Plans -->
					<div class="col-lg-3 col-md-6 d-flex">
						<div class="card flex-fill">
							<div class="card-body d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center overflow-hidden">
									<div>
										<span class="avatar avatar-lg bg-dark rounded-circle"><i class="ti ti-users"></i></span>
									</div>
									<div class="ms-2 overflow-hidden">
										<p class="fs-12 fw-medium mb-1 text-truncate">목록</p>
										<h4>1007</h4>
									</div>
								</div>
								<div>                                    
									<span class="badge badge-soft-purple badge-sm fw-normal">
										<i class="ti ti-arrow-wave-right-down"></i>
										+19.01%
									</span>
                                </div>
							</div>
						</div>
					</div>
					<!-- /Total Plans -->

					<!-- Total Plans -->
					<div class="col-lg-3 col-md-6 d-flex">
						<div class="card flex-fill">
							<div class="card-body d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center overflow-hidden">
									<div>
										<span class="avatar avatar-lg bg-success rounded-circle"><i class="ti ti-user-share"></i></span>
									</div>
									<div class="ms-2 overflow-hidden">
										<p class="fs-12 fw-medium mb-1 text-truncate">Active</p>
										<h4>1007</h4>
									</div>
								</div>
								<div>                                    
									<span class="badge badge-soft-primary badge-sm fw-normal">
										<i class="ti ti-arrow-wave-right-down"></i>
										+19.01%
									</span>
                                </div>
							</div>
						</div>
					</div>
					<!-- /Total Plans -->

					<!-- Inactive Plans -->
					<div class="col-lg-3 col-md-6 d-flex">
						<div class="card flex-fill">
							<div class="card-body d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center overflow-hidden">
									<div>
										<span class="avatar avatar-lg bg-danger rounded-circle"><i class="ti ti-user-pause"></i></span>
									</div>
									<div class="ms-2 overflow-hidden">
										<p class="fs-12 fw-medium mb-1 text-truncate">InActive</p>
										<h4>1007</h4>
									</div>
								</div>
								<div>                                    
									<span class="badge badge-soft-dark badge-sm fw-normal">
										<i class="ti ti-arrow-wave-right-down"></i>
										+19.01%
									</span>
                                </div>
							</div>
						</div>
					</div>
					<!-- /Inactive Companies -->

					<!-- No of Plans  -->
					<div class="col-lg-3 col-md-6 d-flex">
						<div class="card flex-fill">
							<div class="card-body d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center overflow-hidden">
									<div>
										<span class="avatar avatar-lg bg-info rounded-circle"><i class="ti ti-user-plus"></i></span>
									</div>
									<div class="ms-2 overflow-hidden">
										<p class="fs-12 fw-medium mb-1 text-truncate">New Joiners</p>
										<h4>67</h4>
									</div>
								</div>
								<div>                                    
									<span class="badge badge-soft-secondary badge-sm fw-normal">
										<i class="ti ti-arrow-wave-right-down"></i>
										+19.01%
									</span>
                                </div>
							</div>
						</div>
					</div>
					<!-- /No of Plans -->

				</div>

				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>사원목록</h5>
						<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="사번" style="width: 120px;" id="emplNo">
								</div>
							</div>
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="이름" style="width: 100px;" id="emplNm">
								</div>
							</div>
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<select class="form-select" style="width: 100px;" id="deptCode">
									</select>
								</div>
							</div>
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<select class="form-select" style="width: 100px;" id="emplPosition">
									</select>
								</div>
							</div>
							<input type="button" class="btn btn-primary d-flex align-items-center" value="검색" id="searchBtn">
						</div>
					<!-- 	<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
									<span class="input-icon-addon">
										<i class="ti ti-chevron-down"></i>
									</span>
								</div>
							</div>
							<div class="dropdown me-3">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Designation
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Finance</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Developer</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Executive</a>
									</li>
								</ul>
							</div>
							<div class="dropdown me-3">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Select Status
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Active</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Inactive</a>
									</li>
								</ul>
							</div>
							<div class="dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Sort By : Last 7 Days
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a>
									</li>
								</ul>
							</div>
						</div> -->
					</div>
					<div class="card-body p-0">
						<div class="custom-datatable-filter table-responsive">
							<table class="table datatable">
								<thead class="thead-light">
									<tr>
										<th class="no-sort">
											<div class="form-check form-check-md">
												<input class="form-check-input" type="checkbox" id="select-all">
											</div>
										</th>
										<th>사원번호</th>
										<th>사원명</th>
										<th>직급</th>
										<th>근속연수</th>
										<th>성과평가점수</th>
										<th>교육내역</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
                                        <td>
											<div class="form-check form-check-md">
												<input class="form-check-input" type="checkbox">
											</div>
										</td>
										<td><a href="employee-details.html">Emp-001</a></td>
                                        <td>
											<div class="d-flex align-items-center">
                                                <a href="employee-details.html" class="avatar avatar-md" data-bs-toggle="modal" data-bs-target="#view_details"><img
                                                    src="assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img"></a>
                                                <div class="ms-2">
													<p class="text-dark mb-0"><a href="employee-details.html" data-bs-toggle="modal"
														data-bs-target="#view_details">Anthony Lewis</a></p>
													<span class="fs-12">Finance</span>
												</div>
                                            </div>
										</td>
                                        <td>anthony@example.com</td>
                                        <td>(123) 4567 890</td>
										<td>
										</td>
                                        <td>12 Sep 2024</td>
                                        <td>
										</td>
										<td>
											<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
												<div class="mb-2">
													<button type="button" id="" class="btn btn-primary d-flex align-items-center">심사대상추가</button>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--심사대상 추가 후 밑에 추가  -->
								<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>심사대상자</h5>
					</div>
					<div class="card-body p-0">
						<div class="custom-datatable-filter table-responsive">
							<table class="table datatable">
								<thead class="thead-light">
									<tr>
										<th class="no-sort">
											<div class="form-check form-check-md">
												<input class="form-check-input" type="checkbox" id="select-all">
											</div>
										</th>
										<th>사원번호</th>
										<th>사원명</th>
										<th>직급</th>
										<th>근속연수</th>
										<th>성과평가점수</th>
										<th>최종승진여부</th>
										<th>승진일자</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
                                        <td>
											<div class="form-check form-check-md">
												<input class="form-check-input" type="checkbox">
											</div>
										</td>
										<td><a href="employee-details.html">Emp-001</a></td>
                                        <td>
											<div class="d-flex align-items-center">
                                                <a href="employee-details.html" class="avatar avatar-md" data-bs-toggle="modal" data-bs-target="#view_details"><img
                                                    src="assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img"></a>
                                                <div class="ms-2">
                                                
													<p class="text-dark mb-0"><a href="employee-details.html" data-bs-toggle="modal"
														data-bs-target="#view_details">Anthony Lewis</a></p>
													<span class="fs-12">Finance</span>
												</div>
                                            </div>
										</td>
                                        <td>anthony@example.com</td>
                                        <td>(123) 4567 890</td>
										<td>
										</td>
                                        <td>12 Sep 2024</td>
                                        <td>
											<span class="badge badge-success d-inline-flex align-items-center badge-xs">
                                                <i class="ti ti-point-filled me-1"></i>Active
											</span>
										</td>
										<td>
											<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
												<div class="mb-2">
													<button type="button" id="" class="btn btn-primary d-flex align-items-center">승진</button>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--/심사대상추가 후 밑에 표시  -->
			</div>

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
			</div>

		</div>
		<!-- /Page Wrapper -->

		<!-- Add Employee -->
		<div class="modal fade" id="add_employee">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="d-flex align-items-center">
							<h4 class="modal-title me-2">Add New Employee</h4><span>Employee  ID : EMP -0024</span>
						</div>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<form action="employees.html">
						<div class="contact-grids-tab">
							<ul class="nav nav-underline" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
								  <button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#basic-info" type="button" role="tab" aria-selected="true">Basic Information</button>
								</li>
								<li class="nav-item" role="presentation">
								  <button class="nav-link" id="address-tab" data-bs-toggle="tab" data-bs-target="#address" type="button" role="tab" aria-selected="false">Permissions</button>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="basic-info" role="tabpanel" aria-labelledby="info-tab" tabindex="0">
									<div class="modal-body pb-0 ">	
										<div class="row">
											<div class="col-md-12">
												<div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">                                                
													<div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
														<i class="ti ti-photo text-gray-2 fs-16"></i>
													</div>                                              
													<div class="profile-upload">
														<div class="mb-2">
															<h6 class="mb-1">Upload Profile Image</h6>
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
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">First Name <span class="text-danger"> *</span></label>
													<input type="text" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Last Name</label>
													<input type="email" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Employee ID <span class="text-danger"> *</span></label>
													<input type="text" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Joining Date <span class="text-danger"> *</span></label>
													<div class="input-icon-end position-relative">
														<input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy">
														<span class="input-icon-addon">
															<i class="ti ti-calendar text-gray-7"></i>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Username <span class="text-danger"> *</span></label>
													<input type="text" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Email <span class="text-danger"> *</span></label>
													<input type="email" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3 ">
													<label class="form-label">Password <span class="text-danger"> *</span></label>
													<div class="pass-group">
														<input type="password" class="pass-input form-control">
														<span class="ti toggle-password ti-eye-off"></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3 ">
													<label class="form-label">Confirm Password <span class="text-danger"> *</span></label>
													<div class="pass-group">
														<input type="password" class="pass-inputs form-control">
														<span class="ti toggle-passwords ti-eye-off"></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Phone Number <span class="text-danger"> *</span></label>
													<input type="text" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Company<span class="text-danger"> *</span></label>
													<input type="text" class="form-control">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Department</label>
													<select class="select">
														<option>Select</option>
														<option>All Department</option>
														<option>Finance</option>
														<option>Developer</option>
														<option>Executive</option>
													</select>
												</div>		
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Designation</label>
													<select class="select">
														<option>Select</option>
														<option>Finance</option>
														<option>Developer</option>
														<option>Executive</option>
													</select>
												</div>		
											</div>
											<div class="col-md-12">
												<div class="mb-3">
													<label class="form-label">About <span class="text-danger"> *</span></label>
													<textarea class="form-control" rows="3"></textarea>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
										<button type="submit" class="btn btn-primary">Save </button>
									</div>
							</div>
							<div class="tab-pane fade" id="address" role="tabpanel" aria-labelledby="address-tab" tabindex="0">
								<div class="modal-body">	
									<div class="card bg-light-500 shadow-none">
										<div class="card-body d-flex align-items-center justify-content-between flex-wrap row-gap-3">
											<h6>Enable Options</h6>
											<div class="d-flex align-items-center justify-content-end">
												<div class="form-check form-switch me-2">
													<label class="form-check-label mt-0">
													<input class="form-check-input me-2" type="checkbox" role="switch">
														Enable all Module
													</label>
												</div>
												<div class="form-check d-flex align-items-center">
													<label class="form-check-label mt-0">
														<input class="form-check-input" type="checkbox" checked="">
														Select All
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="table-responsive border rounded">
										<table class="table">
											<tbody>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch" checked>
																Holidays
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Leaves
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Clients
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Projects
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Tasks
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Chats
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch" checked>
															Assets
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Timing Sheets
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#success_modal">Save </button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /Add Employee -->

		<!-- Edit Employee -->
		<div class="modal fade" id="edit_employee">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="d-flex align-items-center">
							<h4 class="modal-title me-2">Edit Employee</h4><span>Employee  ID : EMP -0024</span>
						</div>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<form action="employees.html">
						<div class="contact-grids-tab">
							<ul class="nav nav-underline" id="myTab2" role="tablist">
								<li class="nav-item" role="presentation">
								  <button class="nav-link active" id="info-tab2" data-bs-toggle="tab" data-bs-target="#basic-info2" type="button" role="tab" aria-selected="true">Basic Information</button>
								</li>
								<li class="nav-item" role="presentation">
								  <button class="nav-link" id="address-tab2" data-bs-toggle="tab" data-bs-target="#address2" type="button" role="tab" aria-selected="false">Permissions</button>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent2">
							<div class="tab-pane fade show active" id="basic-info2" role="tabpanel" aria-labelledby="info-tab2" tabindex="0">
									<div class="modal-body pb-0 ">	
										<div class="row">
											<div class="col-md-12">
												<div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">                                                
													<div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
														<img src="assets/img/users/user-13.jpg" alt="img" class="rounded-circle">
													</div>                                              
													<div class="profile-upload">
														<div class="mb-2">
															<h6 class="mb-1">Upload Profile Image</h6>
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
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">First Name <span class="text-danger"> *</span></label>
													<input type="text" class="form-control" value="Anthony">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Last Name</label>
													<input type="email" class="form-control" value="Lewis">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Employee ID <span class="text-danger"> *</span></label>
													<input type="text" class="form-control" value="Emp-001">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Joining Date <span class="text-danger"> *</span></label>
													<div class="input-icon-end position-relative">
														<input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="17-10-2022">
														<span class="input-icon-addon">
															<i class="ti ti-calendar text-gray-7"></i>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Username <span class="text-danger"> *</span></label>
													<input type="text" class="form-control" value="Anthony">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Email <span class="text-danger"> *</span></label>
													<input type="email" class="form-control" value="anthony@example.com	">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3 ">
													<label class="form-label">Password <span class="text-danger"> *</span></label>
													<div class="pass-group">
														<input type="password" class="pass-input form-control">
														<span class="ti toggle-password ti-eye-off"></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3 ">
													<label class="form-label">Confirm Password <span class="text-danger"> *</span></label>
													<div class="pass-group">
														<input type="password" class="pass-inputs form-control">
														<span class="ti toggle-passwords ti-eye-off"></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Phone Number <span class="text-danger"> *</span></label>
													<input type="text" class="form-control" value="(123) 4567 890">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Company<span class="text-danger"> *</span></label>
													<input type="text" class="form-control" value="Abac Company">
												</div>									
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Department</label>
													<select class="select">
														<option>Select</option>
														<option>All Department</option>
														<option selected>Finance</option>
														<option>Developer</option>
														<option>Executive</option>
													</select>
												</div>		
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="form-label">Designation</label>
													<select class="select">
														<option>Select</option>
														<option selected>Finance</option>
														<option>Developer</option>
														<option>Executive</option>
													</select>
												</div>		
											</div>
											<div class="col-md-12">
												<div class="mb-3">
													<label class="form-label">About <span class="text-danger"> *</span></label>
													<textarea class="form-control" rows="3"></textarea>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
										<button type="submit" class="btn btn-primary">Save </button>
									</div>
							</div>
							<div class="tab-pane fade" id="address2" role="tabpanel" aria-labelledby="address-tab2" tabindex="0">
								<div class="modal-body">	
									<div class="card bg-light-500 shadow-none">
										<div class="card-body d-flex align-items-center justify-content-between flex-wrap row-gap-3">
											<h6>Enable Options</h6>
											<div class="d-flex align-items-center justify-content-end">
												<div class="form-check form-switch me-2">
													<label class="form-check-label mt-0">
													<input class="form-check-input me-2" type="checkbox" role="switch">
														Enable all Module
													</label>
												</div>
												<div class="form-check d-flex align-items-center">
													<label class="form-check-label mt-0">
														<input class="form-check-input" type="checkbox" checked="">
														Select All
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="table-responsive border rounded">
										<table class="table">
											<tbody>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch" checked>
																Holidays
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Leaves
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Clients
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Projects
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Tasks
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Chats
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch" checked>
															Assets
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox" checked="">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check form-switch me-2">
															<label class="form-check-label mt-0">
															<input class="form-check-input me-2" type="checkbox" role="switch">
															Timing Sheets
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Read
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Write
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Create
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Delete
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Import
															</label>
														</div>
													</td>
													<td>
														<div class="form-check d-flex align-items-center">
															<label class="form-check-label mt-0">
																<input class="form-check-input" type="checkbox">
																Export
															</label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#success_modal">Save </button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /Edit Employee -->

		<!-- Add Employee Success -->
		<div class="modal fade" id="success_modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-body">
						<div class="text-center p-3">
							<span class="avatar avatar-lg avatar-rounded bg-success mb-3"><i class="ti ti-check fs-24"></i></span>
							<h5 class="mb-2">Employee Added Successfully</h5>
							<p class="mb-3">Stephan Peralt has been added with Client ID : <span class="text-primary">#EMP - 0001</span>
							</p>
							<div>
								<div class="row g-2">
									<div class="col-6">
										<a href="employees.html" class="btn btn-dark w-100">Back to List</a>
									</div>
									<div class="col-6">
										<a href="employee-details.html" class="btn btn-primary w-100">Detail Page</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Add Client Success -->

		<!-- Delete Modal -->
		<div class="modal fade" id="delete_modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-body text-center">
						<span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">
							<i class="ti ti-trash-x fs-36"></i>
						</span>
						<h4 class="mb-1">Confirm Delete</h4>
						<p class="mb-3">You want to delete all the marked items, this cant be undone once you delete.</p>
						<div class="d-flex justify-content-center">
							<a href="javascript:void(0);" class="btn btn-light me-3" data-bs-dismiss="modal">Cancel</a>
							<a href="employees.html" class="btn btn-danger">Yes, Delete</a>
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

let depCode = $("#depCode");
let emplPosition = $("#emplPosition");
let searchBtn = $("#searchBtn");

$(function(){

	searchBtn.on("click",function(){
		
	})
	
	
})



</script>

</html>