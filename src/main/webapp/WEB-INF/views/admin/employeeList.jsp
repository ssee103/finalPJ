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
<style>
.modal{
            position:absolute;
            display:none;
            
            justify-content: center;
            top:0;
            left:0;

            width:100%;
            height:100%;
            background-color: rgba(0,0,0,0.4);
        }
        
.modal_body{
            position:absolute;
            top:50%; 
        
            padding:40px;  

            text-align: center;

            background-color: rgb(255,255,255); 
            border-radius:10px;
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

            transform:translateY(-50%); 
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
						<h2 class="mb-1">전체사원 목록</h2>
						<!-- 
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item">
									<a href="index.html"><i class="ti ti-smart-home"></i></a>
								</li>
								<li class="breadcrumb-item">
									CRM
								</li>
								<li class="breadcrumb-item active" aria-current="page">Activity</li>
							</ol>
						</nav> 
						-->
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="me-2 mb-2">
							<!-- 
							<div class="dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									<i class="ti ti-file-export me-1"></i>Export
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
									</li>
								</ul>
							</div> 
							-->
						</div>
						<div class="mb-2">
							<button class="btn-open-modal btn btn-primary d-flex align-items-center">신규 사원 등록</button>
							<!-- <button class="btn btn-primary btn-open-modal"><i class="ti ti-circle-plus me-2"></i>사원 추가</button> -->
						</div>
						<!-- 
						<div class="ms-2 head-icons">
							<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
								<i class="ti ti-chevrons-up"></i>
							</a>
						</div>
						 -->
					</div>
				</div>
				<!-- /Breadcrumb -->

				<!-- Leads List -->
				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>전체사원 목록</h5>
						<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control" placeholder="사번" style="width: 100px;" id="emplNo">
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
					</div>
					<div class="card-body p-0">
						<div class="custom-datatable-filter table-responsive">
							<table class="table datatable">
								<thead class="thead-light">
									<tr>
										<th>사원번호</th>
										<th>사원프로필 이미지</th>
										<th>사원명</th>
										<th>직급</th>
										<th>부서</th>
										<th>팀</th>
									</tr>
								</thead>
								<tbody id="table-tbody">
									<tr>
										<td><p class="fs-14 text-dark fw-medium">We scheduled a meeting for next week</p>
										<td>
											<span class=" badge badge-pink-transparent"><i class="ti ti-device-computer-camera me-1"></i>Meeting</span>
										</td>
										<td>16 Jan 2024</td>
										<td>Hendry</td>
										<td>14 Jan 2024</td>
										<td>
											<div class="action-icon d-inline-flex">
												<a href="#" class="me-2" data-bs-toggle="modal" data-bs-target="#edit_activity"><i class="ti ti-edit"></i></a>
												<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="ti ti-trash"></i></a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="pagingArea" style="display: flex; justify-content: center; align-items: center; padding:15px;">
					
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

		<!-- Add Activiy -->
		<div class="modal">
			<div class="modal_body">
				<div class="modal-header">
	            	<h4 class="modal-title">신규사원 추가</h4>
	            </div>
	            <form id="employeeForm">
	            	<div class="modal-body p-4">
		            	<div class="row">
			            	<div class="col-md-4">
			            		<div class="mb-3">
					            	<label class="form-label">사원번호 </label>
					            	<div class="input-icon-end position-relative">
					            		<input type="text" id="emplNo1" name="emplNo" class="form-control"/>
					            	</div>
					            </div>
				            </div>
				            <div class="col-md-4">
					            <div class="mb-3">
					            	<label class="form-label">비밀번호 </label>
					            	<div class="input-icon-end position-relative">
					            		<input type="text" id="emplPwd1" name="emplPwd" class="form-control"/>
					            	</div>
					            </div>
				            </div>
				            <div class="col-md-4">
					            <div class="mb-3">
					            	<label class="form-label">사원명 </label>
					            	<div class="input-icon-end position-relative">
					            		<input type="text" id="emplNm1" name="emplNm" class="form-control"/>
					            	</div>
					            </div>
				            </div>
		            	</div>
		            	<div class="row">
		            		<div class="col-md-4">
		            			<div class="mb-3">
			            			<label class="form-label">직위 코드 </label>
					            	<select id="positionSelect1" name="emplPosition" class="form-control">
					            			<option>직위 선택</option> <!-- 직위 코드 다 받아와서 동적 출력(공통코드 테이블 내부) -->
			            			</select>
		            			</div>
	            			</div>
	            			<div class="col-md-4">
	            				<div class="mb-3">
	            					<label class="form-label">부서 코드 </label>
				            		<select id="deptCode1" name="deptCode" class="form-control">
				            			<option>부서 선택</option> <!-- 부서 목록 다 받아와서 동적 출력 -->
				            		</select>
            					</div>
           					</div>
           					<div class="col-md-4">
	            				<div class="mb-3">
	            					<label class="form-label">팀 코드 </label>
				            		<select id="teamCode1" name="teamCode" class="form-control">
				            			<option>팀 선택</option> <!-- 팀 목록 다 받아와서 동적 출력 -->
				            		</select>
	            				</div>
	            			</div>
	            		</div>
	            		<div class="row">
	            			<div class="col-md-6">
			            		<div class="mb-3">
			            			<label class="form-label">생년월일 </label>
			            			<input type="date" id="emplBrthdy1" name="emplBrthdy" class="form-control"/>
			            		</div>
			            	</div>
	            			<div class="col-md-6">
			            		<div class="mb-3">
			            			<label class="form-label">입사 일자 </label>
			            			<input type="date" id="hireDate1" name="hireDate" class="form-control"/>
			            		</div>
			            	</div>
	            		</div>
	            		<div class="row">
	            			<div class="col-md-6">
			            		<div class="mb-3">
			            			<label class="form-label">은행코드 </label>
			            			<select id="bankCode1" name="bankCode" class="form-control">
			            				<option>은행 선택</option>	<!-- 은행코드 전부 받아오기 -->
			            			</select>
			            		</div>
		            		</div>
	            			<div class="col-md-6">
			            		<div class="mb-3">
			            			<label class="form-label">은행지점명 </label>
			            			<input type="text" id="bankName1" name="bankName" class="form-control"/>
			            		</div>
		            		</div>
	            		</div>
	            		<div class="col-md-12">
	            			<div class="mb-3">
	            				<label class="form-label">계좌 번호 </label>
			            		<input type="text" id="account1" name="account" class="form-control"/>
			            	</div>
	            		</div>
	            		<div class="col-md-12">
	            			<div class="mb-3">
	            				<label class="form-label">기본 급여 </label>
			            		<input type="text" id="basicSalary1" name="basicSalary" class="form-control"/>
			            	</div>
	            		</div>
	            		<div class="col-md-12">
	            			<div class="mb-3">
	            				<label class="form-label">권한 부여 </label>
	            				<button id="addAuthBtn" class="btn btn-primary me-2 align-items-center">추가 권한</button>
	            				<div id="authContainer">
						        	<select id="authSelect1" name="authSelect" class="authSelect form-control">
			           					<option>권한 선택</option>
				           			</select>
					           	</div>
	            			</div>
            			</div>
            			
            		</div>
			            <button type="button" id="saveBtn" class="btn btn-primary me-2 align-items-center">등록</button>
			            <button class="btn-close-modal btn btn-light me-2 waves-effect">닫기</button>
	            </form>
	            <br>
	            <div class="modal-footer">
	            	<h4 class="modal-title">일괄등록</h4>
		            <form id="bulkEmployeeForm" method="post" enctype="multipart/form-data">
			           	<input type="file" name="excelFile" accept=".xlsx, .xls" required class="form-control" style="float: left; width: auto;"/>&nbsp;
			           	<button type="button" id="bulkSaveBtn" class="btn btn-primary me-2 align-items-center">일괄 등록</button>
		           	</form>
	           	</div>
        	</div>
		</div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/managingEmployee.js"></script>

</body>
<script>
let table_tbody = $("#table-tbody");
let searchBtn = $("#searchBtn");
let pagingArea = $("#pagingArea");
let deptCode = $("#deptCode");
let emplPosition = $("#emplPosition");

$(function(){
	getSelectBoxList();
	if(!sessionStorage.getItem("currentPage")){
		printList(1); // 페이지 최초로드시
	}else{
		printList(sessionStorage.getItem("currentPage"));
	}
	// 검색버튼 클릭이벤트
	searchBtn.on("click", function(){ 
		let emplNo = $("#emplNo").val();
		let emplNm = $("#emplNm").val();
		let emplPosition = $("#emplPosition").val();
		let deptCode = $("#deptCode").val();
		printList(1, emplNo, emplNm, emplPosition, deptCode);
	});
	
	// 페이지버튼 클릭이벤트
	pagingArea.on("click", "a", function(){ 
		event.preventDefault();
		let page = $(this).data("page");
		let emplNo = $("#emplNo").val();
		let emplNm = $("#emplNm").val();
		let emplPosition = $("#emplPosition").val();
		let deptCode = $("#deptCode").val();
		sessionStorage.setItem("currentPage", page);
		printList(page, emplNo, emplNm, emplPosition, deptCode);
	});
	
});

//목록가져오기 함수
function printList(page, emplNo, emplNm, emplPosition, deptCode){
	data = {page : page}
	if(emplNo != null){data.emplNo = emplNo}
	if(emplNm != null){data.emplNm = emplNm}
	if(emplPosition != null){data.emplPosition = emplPosition}
	if(deptCode != null){data.deptCode = deptCode}
	$.ajax({
		url : "/hrms/admin/selectEmplList",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		success : function(res){
			console.log(res);
			let tr = "";
			for(let i=0; i<res.emplList.length; i++){
				let img = "";
				if(res.emplList[i].profileImgpath != null){
					img = res.emplList[i].profileImgpath;
				}else{
					img = "forNull.png";
				}
				tr += `
					<tr>
						<td>\${res.emplList[i].emplNo}</td>
						<td><img src="/assets/img/profile_images/\${img}" class="card-img mb-3" alt="img" style="width:100px; height:100px; object-fit: cover;"></td>
						<td><a href="/hrms/admin/employeeDetail/\${res.emplList[i].emplNo}">\${res.emplList[i].emplNm}</a></td>
						<td>\${res.emplList[i].emplPosition}</td>
						<td>\${res.emplList[i].deptCode}</td>
						<td>\${res.emplList[i].teamCode}</td>
					</tr>
				`;
			}
			table_tbody.html(tr);
			pagingArea.html(res.pageVO.pagingHTML)
		},
		error : function(error){
			console.log(error);
		}
	});
}

function getSelectBoxList(){
	$.ajax({
		url : "/hrms/admin/getSelectBoxList",
		type : "post",
		success : function(res){
			console.log(res);
			let deptOptions = "<option value='' selected>부서</option>";
			for(let i=0; i<res.deptCode.length; i++){
				deptOptions += `
					<option value="\${res.deptCode[i].deptCode}">\${res.deptCode[i].deptName}</option>
				`;
			}
			let emplPositionOptions = "<option value='' selected>직급</option>";
			for(let i=0; i<res.emplPosition.length; i++){
				emplPositionOptions += `
					<option value="\${res.emplPosition[i].ccCode}">\${res.emplPosition[i].ccName}</option>
				`;
			}
			
			deptCode.html(deptOptions);
			emplPosition.html(emplPositionOptions);
			
		},
		error : function(error){console.log(error);}
	});
}
</script>
</html>