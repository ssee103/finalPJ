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
	<title>급여</title>
</head>
<style>
/* 💡 지급/공제 항목 구분선만 강조 (정확한 중앙 분리) */
.pay-stub-details td:nth-child(2) {
    border-right: 2px solid #c6d3df  !important;
}

/* 💡 사원 정보 테이블 줄 제거 및 디자인 개선 */
.pay-stub-emp-info td, 
.pay-stub-emp-info th {
    border: none !important;
    padding: 10px;
    text-align: center;
}

/* 💡 실 지급액 강조 */
#modalTotalPayment, #modalActualSalary {
    color: #0984e3;
    font-weight: bold;
    font-size: 1.4rem;
}

/* 💡 테이블 본문 스타일 */
.table tbody td {
	color: #2f3542;
	font-size: 14px;
}

.modal .modal-footer .btn {
	margin: 5px !important;
}
	
/* 💡 지급/공제 테이블 */
.pay-stub-details th,
.pay-stub-details td {
    padding: 15px;
    vertical-align: middle;
    border-color: #dee2e6;
    font-size: 1rem;
}
/* 💡 전체 테이블 스타일 */
.table {
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 💡 행 배경색 변경 - 줄무늬 효과 */
div.table-responsive .table tbody tr:nth-child(odd) {
	background-color: var(--bs-gray-200) !important;
}

div.table-responsive .table tbody tr:nth-child(even) {
	background-color: #ffffff !important;
}

#confirmMessage {
	white-space: pre-line; /* 줄바꿈 적용 */
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

		<!-- 모달 -->
		<%@ include file="/WEB-INF/views/theme/modal.jsp" %>
		
		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">급여 관리</h2>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="me-2 mb-2">
						</div>
						<div class="mb-2">
							<button class="btn-open-modal btn btn-primary d-flex align-items-center">일괄 지급</button>
						</div>
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
                    <th><input type="checkbox" id="emplNoCheckAll"></th>
										<th>사원번호</th>
										<th>사원명</th>
										<th>직급</th>
										<th>부서</th>
										<th>팀</th>
                    <th></th>
									</tr>
								</thead>
								<tbody id="table-tbody">
                  <!-- 리스트 -->
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
	</div>
	<!-- /Main Wrapper -->

	<!-- 📄 급여 명세서 모달 -->
	<div class="modal fade" id="payStubModal" tabindex="-1" aria-labelledby="payStubModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
						<div class="modal-header text-white">
								<h5 class="modal-title" id="payStubModalLabel">급여 지급 명세서 미리 보기</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>

						<div class="modal-body">
								<!-- 📌 사원 정보 테이블 -->
								<table class="table pay-stub-emp-info">
									<thead>
											<tr>
													<th colspan="4">사원 정보</th>
											</tr>
									</thead>
									<tbody>
											<tr>
													<td>부서</td>
													<td id="modalDeptName">-</td>
													<td>지급 예정일</td>
													<td id="modalPayDate">-</td>
											</tr>
											<tr>
													<td>성명</td>
													<td id="modalEmpName">-</td>
													<td>직급</td>
													<td id="modalPosition">-</td>
											</tr>
									</tbody>
								</table>

								<!-- 지급 및 공제 내역 -->
								<h5 class="mt-4 mb-3">지급 및 공제 내역</h5>
								<table class="table pay-stub-details table-hover text-center">
										<thead>
												<tr>
														<th>지급 항목</th>
														<th>금액 (₩)</th>
														<th>공제 항목</th>
														<th>금액 (₩)</th>
												</tr>
										</thead>
										<tbody>
												<tr>
														<td>기본급</td>
														<td id="modalBasicSalary">-</td>
														<td>소득세</td>
														<td id="modalIncomeTax">-</td>
												</tr>
												<tr>
														<td>시간 외 수당</td>
														<td id="modalOvertimePay">-</td>
														<td>지방세</td>
														<td id="modalLocalTax">-</td>
												</tr>
												<tr>
														<td>식대</td>
														<td id="modalMealPay">-</td>
														<td>고용보험</td>
														<td id="modalEmploymentInsurance">-</td>
												</tr>
												<tr>
														<td>상여금</td>
														<td id="modalBonus">-</td>
														<td>건강보험</td>
														<td id="modalHealthInsurance">-</td>
												</tr>
												<tr>
														<td></td>
														<td></td>
														<td>장기요양보험</td>
														<td id="modalNursingInsurance">-</td>
												</tr>
												<tr>
														<td></td>
														<td></td>
														<td>국민연금</td>
														<td id="modalNationalPension">-</td>
												</tr>
										</tbody>
										<tfoot>
												<tr>
														<th>총 지급액</th>
														<td id="modalTotalPayment">-</td>
														<th>실 지급액</th>
														<td id="modalActualSalary">-</td>
												</tr>
										</tfoot>
								</table>
						</div>

						<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button id="confirmPay" class="btn btn-primary">지급 확정</button>
						</div>
				</div>
		</div>
	</div>
	<!-- 📄 급여 명세서 모달 -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery-3.7.1.min.js"></script>

	<!-- jsPDF 라이브러리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

	<!-- jsPDF AutoTable 플러그인 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>

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
	<script src="${pageContext.request.contextPath }/js/font/font.js"></script>
	<script src="${pageContext.request.contextPath }/js/img/img.js"></script>
  <script type="module" src="${pageContext.request.contextPath }/assets/js/payStub.js"></script>

</body>
</html>