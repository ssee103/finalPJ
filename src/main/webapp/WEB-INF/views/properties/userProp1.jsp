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
	<title>대여물품조회</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
<br/><br/>
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
				</div>
			</div>
			<!-- /Breadcrumb -->

			<!-- Leads List -->
			<div class="card">
				<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
					<h5>대여가능한 물품조회</h5>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
						<div class="me-3">
							<div class="input-icon-end position-relative">
								<input type="text" class="form-control" placeholder="물품분류코드" style="width: 100px;" id="psCode">
							</div>
						</div>
						<div class="me-3">
							<div class="input-icon-end position-relative">
								<input type="text" class="form-control" placeholder="물품명" style="width: 100px;" id="propName">
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
									<th>물품분류코드</th>
									<th>물품명</th>
									<th>대여가능수량</th>
									<th>대여가능정보</th>
								</tr>
							</thead>
							<tbody id="dataTable-tbody">
							</tbody> <!--  /tbody -->
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
							let psCode = $("#psCode");
							let propName = $("#propName");
							
							console.log("검색어들 : ", psCode.val(), propName.val());
							getList(1, psCode.val(), propName.val());
						});
						
						pagingArea.on("click", "a", function(){
							event.preventDefault();
							let page = $(this).data("page");
							let psCode = $("#psCode");
							let propName = $("#propName");
							let propQty = $("#propQty");
							getList(page, psCode.val(), propName.val(), propQty.val());
						})
						
						
					});
					
					function getList(page, psCode, propName) {
					    let pagingArea = $("#pagingArea");
					    let dataTable_tbody = $("#dataTable-tbody");

					    // 기본 데이터 설정
					    let data = { page: page };

					    if (psCode != null) data.psCode = psCode;
					    if (propName != null) data.propName = propName;
					    
					    console.log("전송 데이터:", data);

					    $.ajax({
					        url: "/hrms/prop/rest/getPropAllList",
					        type: "POST",
					        data: JSON.stringify(data),
					        contentType: "application/json;charset=utf-8",
					        success: function (res) {
					            console.log("응답 데이터:", res);

					            let tr = "";

					            if (res.propAllList && res.propAllList.length > 0) {
					                res.propAllList.forEach(function(prop) {

					                    tr += `
					                        <tr>
					                            <td>\${prop.psCode}</a></td>
					                            <td>\${prop.propName}</td>
					                            <td>\${prop.propQty}</td>
					                            <td><button>대여하기</button></td>
					                        </tr>	
					                    `;
					                });

					                // 데이터 삽입
					                dataTable_tbody.html(tr);
					            } else {
					                dataTable_tbody.html(`<tr><td colspan="4" class="text-center">데이터가 없습니다.</td></tr>`);
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
			</div> <!-- content -->

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2001 - 2025 &copy; HRMS.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">HERMES</a></p>
			</div>
		
<%-- 		<div class="row">
			<div class="col-md-20">
				<div class="filters-content">
					<div class="row grid">
						<% if (userProp != null && !userProp.isEmpty()) { 
							for (PropertiesVO prop : userProp) { %>
								<div class="col-lg-5 col-md-4 all 
									<% if (prop.getPsLarge().equals("전자기기")) { %> des <% } 
										else if (prop.getPsLarge().equals("사무용품")) { %> dev <% } 
										else { %> gra <% } %>">
									<div class="product-item">
										<a href="#"><img src="/assets/img/<%= prop.getFileIdentify() %>.jpg" alt=""></a>
									<div class="down-content">
										<a href="#"><h4><%= prop.getPropName() %></h4></a>
									<p><%= prop.getPropContent() %></p>
											<!-- 대여 신청 버튼 -->
											<button class="btn btn-primary rental-btn" data-propno="<%= prop.getPropNo() %>" data-propname="<%= prop.getPropName() %>">
									    		대여 신청하기지롱
											</button>
										</div>
									</div>
								</div>
						<% } } else { %>
							<div class="col-md-12 text-center">
							    <p>조회된 자산이 없습니다.</p>
							</div>
						<% } %>
					</div>
				</div>
			</div>
		</div> --%>
		<!-- 대여 신청 모달 (Bootstrap Modal로 변경) -->
		<div class="modal fade" id="rentalModal" tabindex="-1" aria-labelledby="rentalModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="rentalModalLabel">물품 대여 신청</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <form id="rentalForm">
		                    <div class="mb-3">
		                        <label for="rentalPropName" class="form-label">물품명:</label>
		                        <input type="text" id="rentalPropName" class="form-control" readonly>
		                    </div>
		                    <div class="mb-3">
		                        <label for="rentalSdate" class="form-label">대여일:</label>
		                        <input type="date" id="rentalSdate" class="form-control" readonly>
		                    </div>
		                    <div class="mb-3">
		                        <label for="rentalEdate" class="form-label">반납 예정일:</label>
		                        <input type="date" id="rentalEdate" class="form-control" required>
		                    </div>
		                    <input type="hidden" id="rentalPropNo">
		                    <input type="hidden" id="rentalRdate">
		                    <input type="hidden" id="emplNo">
		                </form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		                <button type="button" id="rentalSaveBtn" class="btn btn-primary">대여 신청</button>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="bg-white flex-fill border-end border-bottom mail-notifications" style="width: 100%; height: 100%;">
			<div class="slimscroll-active-sidebar">
				<!-- Page Content -->
				<div class="products">
				 	<div class="container">
						
					</div>
				</div>	
			</div>
		</div>
	</div>
<!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->
<!-- 
<script> 
     cleared[0] = cleared[1] = cleared[2] = 0; 
     function clearField(t){                  
      if(! cleared[t.id]) {                      
          cleared[t.id] = 1;  
          t.value='';         
          t.style.color='#fff';
      }
     }
</script> -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const rentalButtons = document.querySelectorAll(".rental-btn");
    const rentalSaveBtn = document.getElementById("rentalSaveBtn");

    rentalButtons.forEach(button => {
        button.addEventListener("click", function () {
            document.getElementById("rentalPropNo").value = this.dataset.propno;
            document.getElementById("rentalPropName").value = this.dataset.propname;
            document.getElementById("rentalRdate").value = "";

            // 오늘 날짜 자동 설정
            let today = new Date().toISOString().split('T')[0];
            document.getElementById("rentalSdate").value = today;

            // Bootstrap Modal 열기
            let rentalModal = new bootstrap.Modal(document.getElementById("rentalModal"));
            rentalModal.show();
        });
    });

    rentalSaveBtn.addEventListener("click", function () {
        const rentalData = {
            emplNo: document.getElementById("emplNo").value,
            propName: document.getElementById("rentalPropName").value,
            propNo: document.getElementById("rentalPropNo").value,
            epSdate: document.getElementById("rentalSdate").value,
            epEdate: document.getElementById("rentalEdate").value,
            epRdate: document.getElementById("rentalRdate").value.trim() === "" ? null : document.getElementById("rentalRdate").value
        };

        if (!rentalData.epEdate) {
            alert("반납 예정일을 선택하세요.");
            return;
        }

        $.ajax({
            url: '/hrms/prop/rentItem',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(rentalData),
            success: function (response) {
                alert(response);
                let rentalModal = bootstrap.Modal.getInstance(document.getElementById("rentalModal"));
                rentalModal.hide();
                setTimeout(() => location.reload(), 1000);
            },
            error: function (error) {
                alert("대여 신청 중 오류가 발생했습니다.");
            }
        });
    });
});

</script>
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
	
</html>