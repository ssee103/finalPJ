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
	
	<script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css" />

	<!-- CKEditor -->
	<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>

</head>
<style>
#prevDiv table {
    border: 2px solid;
    margin-left:auto; 
    margin-right:auto;
}

#prevDiv table td, 
#prevDiv table th {
    border: 2px solid;
}

#prevDiv .info{
  font-weight: bold;
  width: 180px;
  background-color: #E8E8E8;
}

#prevDiv #detail{
  height: 300px;
}

#prevDiv td{
  height: 50px;
  text-align: center;
}

#prevDiv #remark{
  text-align: left;
}

h1{
  text-align: center;
}

  /* 노드 항목 전체를 flex 컨테이너로 지정 */
  .tui-tree-item {
      display: flex;
      align-items: center; /* 버튼과 텍스트를 수직 중앙 정렬 */
  }

  /* + 버튼 스타일 재정의 */
  .tui-tree-toggle-btn {
      display: inline-block; /* 인라인 블록으로 설정 */
      vertical-align: middle;
      margin-right: 10px;     /* 버튼과 레이블 사이 간격 */
      width: 25px;           /* 원하는 너비 */
      height: 25px;          /* 원하는 높이 */
      
  }

  /* 노드 레이블도 인라인 블록으로 설정하여 함께 정렬 */
  .tui-tree-text {
      display: inline-block;
      vertical-align: middle;
  }
  
  .tui-ico-tree {
  	display: inline-block;
  	text-align: center;
  }
  
  .tui-tree-root {
  	width: 200px;
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
		
		<!-- 모달창들 -->
		<%@ include file="/WEB-INF/views/theme/modal.jsp" %>
		<!-- /모달창들 -->

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

					<!-- Editor -->
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title">기안문서 작성</h5> <br/>
								<select id="docSortSelect" class="form-control w-auto">
									<option class="option" value="default">양식을 선택하세요.</option>
								</select> <br/>
								<button class="btn btn-primary" id="defineLineBtn" data-bs-toggle="modal" 
									data-bs-target="#defineLineModal">결재 라인 지정</button>&nbsp;	
<!-- 								<button class="btn btn-secondary" id="defineRefBtn" data-bs-toggle="modal"  -->
<!-- 									data-bs-target="#defineRefModal">참조자 지정</button> &nbsp; -->
								<button class="btn btn-secondary" id="customSanctnerLine" data-bs-toggle="modal" 
									data-bs-target="#getCustomModal">결재 라인 템플릿</button> &nbsp;	
								<button class="btn btn-outline-light border me-3">임시 저장</button>
								
								<!-- 모달 바깥 결재자&참조자 영역 -->	
								<div id="outModalAprRef" style="display: flex; margin-right: 20px; margin-top: 20px;">
									<div style="margin-right: 100px;">
										<h5 class="card-title">결재자 라인 (내림차순)</h5>
										<span id="aprDefault">지정 된 결재자가 없습니다.</span>
										<div id="chosenLine">
											
										</div>
									</div>
									<div style="margin-right: 20px;">
										<h5 class="card-title">참조자 라인</h5>
										<span id="refDefault">지정 된 참조자가 없습니다.</span>
										<div id="chosenRef">
											
										</div>
									</div>
									<div style="margin-right: 20px;">
										<button class="btn btn-outline-light border me-3" id="removeLine">결재선 초기화</button>
									</div>
								</div>	
							</div>
							
						</div>
					</div>
					
					<div id="viewDiv" style="display: none;">
						<div id="passiveDiv" class="row">
							<div class="col-md-12">
								<div class="card">
									<div>
										<div class="card-header">
											<h5 class="card-title">문서 제목</h5><br>
											<input type="text" id="docTitle" class="form-control"/>
										</div>
										<div class="card-header" style="display: flex;">
											<input type="file" id="docFile" multiple="multiple" class="form-control"/>
										</div>	
										<div class="card-header" style="display: flex;">
											<h5 class="card-title">전결 허용 여부:&nbsp;</h5>
											<input id="passiveChk" type="checkbox"/>
										</div>		
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12" id="writeDiv">
							<div class="card">
								<div class="card-body">
									<div id="docDiv">
										
									</div>
									
									<div id="ckeditorDiv">
										<textarea rows="" cols="" id="ckEditor"></textarea>
									</div>
								</div>
							</div>
						</div>
						<button id="prevModal" class="btn btn-primary" data-bs-toggle="modal" 
									data-bs-target="#previewModal" style="float: right; margin-bottom: 20px;">미리보기</button>
					</div>
					
				</div>
				
			</div>

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				
			</div>
			
		</div>
	</div>
	
	<!-- 기안 미리보기 Modal -->
	<div class="modal fade" id="previewModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-xl"> <!-- modal-xl: 큰 모달 -->
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="previewModalLabel">기안 미리보기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
	      </div>
	      <div class="modal-body" id="prevDiv">
	        <!-- 미리보기 내용을 여기에 삽입 -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> &nbsp;
	        <button type="button" class="btn btn-primary" id="requestApvBtn">결재 요청</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 결재라인 지정 Modal -->
	<div class="modal fade" id="defineLineModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- 모달 헤더 -->
	      <div class="modal-header">
	        <h5 class="modal-title" id="previewModalLabel">결재 라인을 지정하세요</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
	      </div>
	      <!-- 추가 참조자 지정 옵션 -->
	      <div class="mt-3 d-flex align-items-center" style="margin-left: 30px;">
              <h5 class="card-title mb-0 me-2">참조자 지정</h5>
              <input type="checkbox" id="refChk"/>
          </div>
	      <!-- 모달 본문 -->
	      <div class="modal-body">
	        <div class="row">
	          <!-- 조직도 영역 (왼쪽) -->
	          <div class="col-md-3" id="companyTree">
	            <!-- 조직도 들어가는 부분 -->
	          </div>
	          <!-- 결재/참조 영역 (오른쪽) -->
	          <div class="col-md-9">
	            <div class="row" style="margin-left: 70px;">
	              <!-- 지정한 결재자 라인 영역 -->
	              <div class="col-md-6">
	                <h5 class="card-title">지정한 결재자 라인</h5>
	                <!-- 이 div에 결재자 데이터가 출력됩니다. 제목 바로 아래에 위치 -->
	                <div id="sanctionerLineDiv">
	                  <!-- 예: 결재자 데이터 출력 -->
	                </div>
	              </div>
	              <!-- 지정한 참조자 목록 영역 -->
	              <div class="col-md-6">
	                <h5 class="card-title">지정한 참조자 목록</h5>
	                <!-- 이 div에 참조자 데이터가 출력됩니다. 제목 바로 아래에 위치 -->
	                <div id="referenceDiv">
	                  <!-- 예: 참조자 데이터 출력 -->
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      
	      <!-- 모달 푸터 -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="showCustomModal" style="margin: 2px;" data-bs-toggle="modal" 
									data-bs-target="#customModal">커스텀 결재 라인 저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin: 2px;">닫기</button>
	        <button type="button" class="btn btn-secondary" id="removeSanctioner" style="margin: 2px;">초기화</button>
	        <button type="button" class="btn btn-primary" id="saveLine" style="margin: 2px;">저장</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 커스텀 결재선 저장 Modal -->
	<div class="modal fade" id="customModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm"> <!-- modal-xl: 큰 모달 -->
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="previewModalLabel">커스텀 결재선 저장</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
	      </div>
	      <div class="modal-body">
	      	커스텀 결재 선 제목: <input type="text" class="form-control" id="customTitle" placeholder="템플릿 제목을 지정해주세요."/>
	      </div>
	      <div class="modal-body" style="border: 1px solid black;">지정 된 결재 선(↓)</div>
	      <div class="modal-body" id="customDiv">
	        <!-- 미리보기 내용을 여기에 삽입 -->
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> &nbsp;
	        <button type="button" class="btn btn-primary" id="saveCustom">결재선 저장</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 커스텀 결재선 Modal -->
	<div class="modal fade" id="getCustomModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg"> <!-- modal-xl: 큰 모달 -->
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="previewModalLabel">커스텀 결재선</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
	      </div>
	      <div class="modal-body" id="getCustomDiv">
	        <!-- 미리보기 내용을 여기에 삽입 -->
	        <table class="table datatable">
		        <thead>
		        	<tr>
		        		<th>번호</th>
		        		<th>제목</th>
		        		<th>결재 선</th>
		        		<th>생성일</th>
		        		<th>삭제</th>
		        	</tr>
	        	</thead>
	        	<tbody>
	        	</tbody>
	        </table>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> &nbsp;
	        <button type="button" class="btn btn-primary" id="outCustomBtn">결재선 지정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 	<!-- 참조자 지정 Modal --> -->
<!-- 	<div class="modal fade" id="defineRefModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true"> -->
<!-- 	  <div class="modal-dialog modal-lg">  -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	        <h5 class="modal-title" id="previewModalLabel">참조자를 지정하세요</h5> -->
<!-- 	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-body" id="companyTree"> -->
<!-- 	        이 부분에서 작업 -->
	        
<!-- 	      </div> -->
<!-- 	      <div id="refDiv"> -->
<!-- 	      	<h5 class="card-title">&nbsp;&nbsp;지정한 참조자 목록</h5><br/> -->
<!-- 	      </div> -->
<!-- 	      <div id="refViewDiv"> -->
	      	
<!-- 	      </div> -->
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> &nbsp; -->
<!-- 	        <button type="button" class="btn btn-secondary" id="removeRef">초기화</button> &nbsp; -->
<!-- 	        <button type="button" class="btn btn-primary" id="saveRef">저장</button> -->
<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->

	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery-3.7.1.min.js"></script>

	<!-- Feather Icon JS -->
	<script src="${pageContext.request.contextPath }/assets/js/feather.min.js"></script>

	<!-- Slimscroll JS -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.slimscroll.min.js"></script>

	<!-- Datatable JS -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/dataTables.bootstrap5.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Color Picker JS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

	<!-- Daterangepikcer JS -->
	<script src="${pageContext.request.contextPath }/assets/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/daterangepicker.js"></script>

	<!-- Custom JS -->
	<script src="${pageContext.request.contextPath }/assets/js/theme-colorpicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/script.js"></script>
	
	

</body>
<script>

const userId = sessionStorage.getItem("userId"); // 세션 아이디 가져오기
console.log("userId: ", userId);

$(function(){
	
	let docSortSelect = $("#docSortSelect");
	
	$.ajax({
		url: '/sanction/getDocSort',
		method: 'get',
		success: function(res){
			console.log("문서양식 종류 조회 결과: ", res);
			console.log("문서양식 html: " + res[0].dsForm);
			
			$.each(res, function(index, item) {
				console.log(`dsCode: \${item.dsCode}, dsType: \${item.dsType}`);
				docSortSelect.append(`<option class="option" value="\${item.dsCode}">\${item.dsType}</option>`);
            });
			
			// id가 ckEditor인 textarea를 CKEditor로 변환
			CKEDITOR.replace('ckEditor', {
				allowedContent: true,
				height: 1000,
				width: '100%',
				contentsCss: "${pageContext.request.contextPath }/ckeditor/docSortStyle/docSortStyle.css"
			});
				
			// 문서 양식 select 이벤트
			docSortSelect.on("change", function(){
				
				$("#viewDiv").show();
				$("#docDiv").empty();
				
				let option = docSortSelect.val();
				
				if(option == "default") {
					$("#viewDiv").hide();
					$("#docDiv").empty();
				}
				
				$("#passiveChk").removeAttr("checked");
				
				if(option == "01") {	// 연차 신청서
					
					if(res[0].dsPassive == 'Y') {
						$("#passiveChk").attr("checked", "checked");
					}
					
					$("#docDiv").append(`기간 :&nbsp; <input type="date" id="sDate" class="form-control w-auto d-inline-block"/>
							-&nbsp;<input type="date" id="eDate" class="form-control w-auto d-inline-block"/> <br/><br/>`);
					
					CKEDITOR.instances.ckEditor.setData(res[0].dsForm);
					
				}	// if 범위
				
				if(option == "03") {
					
					if(res[2].dsPassive == 'Y') {
						$("#passiveChk").attr("checked", "checked");
					}
					
					$("#docDiv").append(`일자 :&nbsp; <input type="date" id="sDate" class="form-control w-auto d-inline-block"/>
					-&nbsp;<input type="date" id="eDate" class="form-control w-auto d-inline-block"/> <br/><br/>`);
					$("#docDiv").append(`시간 :&nbsp; <input type="time" id="sTime" class="form-control w-auto d-inline-block"/>
					-&nbsp;<input type="time" id="eTime" class="form-control w-auto d-inline-block"/> <br/><br/>`);
					
					CKEDITOR.instances.ckEditor.setData(res[2].dsForm);
					
				}
				
				if(option == "04") {
					
					if(res[3].dsPassive == 'Y') {
						$("#passiveChk").attr("checked", "checked");
					}
					
					$("#docDiv").append(`일자 :&nbsp; <input type="date" id="sDate"/>
					-&nbsp;<input type="date" id="eDate"/> <br/><br/>`);
					$("#docDiv").append(`시간 :&nbsp; <input type="time" id="sTime"/>
					-&nbsp;<input type="time" id="eTime"/> <br/><br/>`);
					
					CKEDITOR.instances.ckEditor.setData(res[3].dsForm);
					
				}
				
				if(option == "99") {
					
					if(res[4].dsPassive == 'Y') {
						$("#passiveChk").attr("checked", "checked");
					}
					
					CKEDITOR.instances.ckEditor.setData(res[4].dsForm);
					
				}
			
			});	// selectBox onChange 범위 종료
			
		} // success 범위 종료
	});	// ajax 범위 종료
	
	// 미리보기 모달 창 열기 + 결재 요청
	$("#prevModal").on("click", function(){
		
		let dataForEmpl = {userId: userId};
		
		$.ajax({
			url: '/sanction/getEmplInfo',
			method: 'get',
			data: dataForEmpl,
			dataType: 'json',
			success: function(res){
				console.log("사원 정보 호출: ", res);
				
				let dataForRealEmpl = {
						emplNo: res.emplNo,
						deptCode: res.deptCode,
						emplPosition: res.emplPosition,
						teamCode: res.teamCode
				};
				
				$.ajax({
					url: '/sanction/getEmplRealInfo',
					method: 'get',
					data: dataForRealEmpl,
					dataType: 'json',
					success: function(res){
						console.log("사원 정보 재호출: ", res);
						
						let option = docSortSelect.val();
						
						// ckEditor 내부 입력 영역에 접근하여 아이디에 접근 -> 해당 요소에 데이터 삽입
						let editor = CKEDITOR.instances.ckEditor;
						
						let deptElem = editor.document.getById("dept");
						let emplPosition = editor.document.getById("emplPosition");
						let emplNm = editor.document.getById("emplNm");
						let emplNo = editor.document.getById("emplNo");
						let submitDate = editor.document.getById("submitDate");
						
						let aprDiv = editor.document.getById("aprDiv"); // ckEditor 내부의 아이디가 aprDiv인 div태그를 검색
						aprDiv.setStyle('display', 'flex');	// 인장이 찍히는 박스의 부모요소인 aprDiv에 스타일을 적용
						aprDiv.setStyle('float', 'right');
						aprDiv.setStyle('margin-right', '54px');
						aprDiv.setStyle('margin-bottom', '54px');
						aprDiv.setStyle('margin-left', '600px');
						
						deptElem.setHtml(res.teamCode);
						emplPosition.setHtml(res.emplPosition);
						emplNm.setHtml(res.emplNm);
						emplNo.setHtml(res.emplNo);
						
						if(option == 01) {	// 연차 신청서 일 때
							let dateElem = editor.document.getById("dateValue");	// 기간 찾아 담기
							let sDate = $("#sDate").val();
							let eDate = $("#eDate").val();
							dateElem.setHtml(sDate + " - " + eDate);
						}
						
						if(option == 03) {	// 연장 근무 신청서 일 때
							let dateElem = editor.document.getById("dateValue");	// 기간 찾아 담기
							let timeElem = editor.document.getById("timeValue");
							let sDate = $("#sDate").val();
							let eDate = $("#eDate").val();
							dateElem.setHtml(sDate + " - " + eDate);
							
							let sTime = $("#sTime").val();
							let eTime = $("#eTime").val();
							timeElem.setHtml(sTime + " - " + eTime);
						}
						if(option == 04) {	// 야간 근무 신청서 일 때
							let dateElem = editor.document.getById("dateValue");	// 기간 찾아 담기
							let timeElem = editor.document.getById("timeValue");
							let sDate = $("#sDate").val();
							let eDate = $("#eDate").val();
							dateElem.setHtml(sDate + " - " + eDate);
							
							let sTime = $("#sTime").val();
							let eTime = $("#eTime").val();
							timeElem.setHtml(sTime + " - " + eTime);
						}
						
						// 실적 보고서 평가 일 때
						if(option == 99) {
							var totalScore = 0;
						    let cells = editor.document.find('.evalScore');
						    for (var i = 0; i < cells.count(); i++) {
						        var cell = cells.getItem(i);
						        var text = cell.getText().trim();  // CKEditor의 경우 getText() 사용
						        if (text === '우수') {
						            totalScore += 20;
						        } else if (text === '보통') {
						            totalScore += 10;
						        } else if (text === '미흡') {
						            totalScore += 0;
						        }
						    }
						    console.log("총점: " + totalScore);
						    let totalScoreStr = editor.document.getById("totalScore");
						    totalScoreStr.setHtml(totalScore + "점");
						}
						
						
						// #chosenLine 영역의 각 결재자 요소를 순회
						$("#chosenLine .sanctioner").each(function(idx, element){
						    // 각 결재자의 이름을 추출
						    let approverName = $(element).text().trim();
						    let emplno = $(element).data("emplno");
						    console.log("emplno: ", emplno);
						    // 각 결재자의 이름을 forName 셀에 삽입하는 테이블 HTML을 생성
						    let tableHtml = `<table style="border-collapse:collapse; display:none; margin-left: 2px;" border="2px" width="120px;">
						                        <tr>
						                            <td id="forName">\${approverName}</td>
						                        </tr>
						                        <tr height="80px">
						                            <td class="signBox" id="\${emplno}"></td>
						                        </tr>
						                     </table>`;
						                     
						    // CKEditor 문서 내에 테이블 HTML을 추가 (CKEDITOR.dom.element의 appendHtml() 사용)
						    aprDiv.appendHtml(tableHtml);
						});
						
						// 기안일자(연,월,일 삽입)
						const today = new Date();

						const year = today.getFullYear();
						const month = today.getMonth() + 1;
						const day = today.getDate();
						
						let dateString = `\${year}년 \${month}월 \${day}일`;
						
						console.log("###날짜### ", dateString);
						// 문서 하단 날짜 삽입
						submitDate.setHtml(dateString);
						
// 						// 결재자 수 카운팅
// 						let aprCount = $("#chosenLine .sanctioner").length;
// 						console.log("결재자의 수: ", aprCount);
						
						let editorContent = CKEDITOR.instances.ckEditor.getData();
						console.log("editorContent: ", editorContent);
						
						editorContent = editorContent.replace(/display:\s*none;/g, '');	// 최종적으로 종결된 html 결과
						
						// 원래 prevDiv append 위치
						$("#prevDiv").append(editorContent);
						
						// 결재 요청 버튼 누른 시점 시작
						
						// 결재 요청 로직 시작(결재 요청 버튼 클릭 시)
						$("#requestApvBtn").off("click").on('click', function(){
							
							// 전결 여부에 따라 보낼 데이터 설정
							let dcrbAllow = "";
							
							if($("#passiveChk").is(":checked")) {
								dcrbAllow = "Y";
							} else {
								dcrbAllow = "N";
							}
							
							// 선택된 결재자 사원코드
							var emplNoApr = $('#chosenLine .sanctioner').map(function() {
							    return $(this).attr('data-emplno');
							}).get();  // .get()을 사용하면 배열 형태로 반환됩니다.
													
							// 선택된 참조자 사원코드
							var emplNoRef = $('#chosenRef .reference').map(function() {
							    return $(this).attr('data-emplno');
							}).get();  // .get()을 사용하면 배열 형태로 반환됩니다.
							
							console.log("emplNoApr: ", emplNoApr);
							console.log("emplNoRef: ", emplNoRef);
							
							let fileInput = $("#docFile")[0];
							
							//파일 첨부
							let formData = new FormData();
							
							if(fileInput.files != null && fileInput.files.length > 0) {
								let files = fileInput.files;
								console.log("fileInput" ,fileInput);
								console.log("fileInput.files" ,fileInput.files);
								
								// 파일
								$.each(files, function(index, file) { // 파일들 반복문으로 FormData객체에 append 하기
						            formData.append("docFile", file);
						        });
							}
							
							formData.append('dsCode', $("#docSortSelect").val());	// 문서 양식 코드
							console.log("문서 양식 코드: ", $("#docSortSelect").val());
							
							formData.append('writerNo', sessionStorage.getItem("userId"));	// 기안자 사원번호
							console.log("기안자 사원번호: ", sessionStorage.getItem("userId"))
							
							formData.append('docTitle', $("#docTitle").val());	// 문서 제목
							console.log("문서 제목: ", $("#docTitle").val());
							
							formData.append('docContent', editorContent);// 문서 내용
							console.log('문서 내용 html 코드: ', editorContent);
							
							formData.append('dcrbAllow', dcrbAllow);// 전결 허용 여부
							console.log("전결 허용 여부: ", dcrbAllow);
							
							// 결재자(사번) 목록
							formData.append('aprList', emplNoApr);
							
							// 참조자(사번) 목록
							formData.append('refList', emplNoRef);
							
							$.ajax({
								url: '/sanction/createNewDoc',
								method: 'post',
								data: formData,
								dataType: 'json',
								contentType: false,
								processData: false,
								success: function(res){
									if(res == 1) {
										showSessionToastMessage("결재 요청이 완료되었습니다.", "success");
										location.href = "/hrms/sanction/personalDocuments";
									}
								},
								error: function(error){
									showToastMessage("결재 요청 중 오류가 발생하였습니다.", "danger");
								}
								
							});
							
						})
						
					}
					
				});
				
				
			}
		});
		
	});
	
 	// 결재 라인 지정 로직 시작
	let defineLineBtn = $("#defineLineBtn");
	
	defineLineBtn.on("click", function(){
		
		// 다시 열때 이전에 지정한 결재자, 참조자, 참조자 체크박스 요소 비워주기
		$("#sanctionerLineDiv").empty();
		$("#referenceDiv").empty();
		$("#refChk").prop("checked", false);
		
		var originalTreeData;	// 원본 트리 데이터 저장 공간
		
		$.ajax({
			url: '/organization/getTree',
			method: 'get',
			dataType: 'json',
			success: function(res){
				console.log("조직도 트리 데이터: ", res);
				originalTreeData = res;
				var treeContainer = $("#companyTree")[0];
				treeContainer.innerHTML = "";
				
				var tree = new tui.Tree(treeContainer, {
					data: res,
					selectable: true,
					initialState: 'expanded' // 모든 노드 펼치기
				});
				
				// 이 영역에서 선택된 노드 관련 작업
				// 노드 선택 이벤트 처리(조직도 트리 내부 사원명 클릭 이벤트)
				tree.enableFeature('Selectable').on('select', function(event) {
				    var clickedText = event.target.innerText.trim();
				    console.log("클릭된 텍스트: ", clickedText);
				    
				    // 원본 데이터에서 해당 텍스트를 갖는 노드를 찾음
				    var foundNode = findNodeByText(originalTreeData, clickedText);
				    
				    // 사원 노드인지 확인 (id가 "emp_"로 시작)
				    if (foundNode && foundNode.id && foundNode.id.indexOf("emp_") === 0) {
				        console.log("선택된 사원의 사원번호: ", foundNode.data);
				        
				     	// 자기 자신은 선택 불가
				        if (foundNode.data === userId) {
				            if (!$("#refChk").is(":checked")) {
				                showToastMessage("자기 자신은 결재자로 선택할 수 없습니다.", "warning");
				            } else {
				                showToastMessage("자기 자신은 참조자로 선택할 수 없습니다.", "warning");
				            }
				            return;
				        }
				        
				        // 결재자 지정과 참조자 지정을 구분
				        let sanctionerLineDiv = $("#sanctionerLineDiv");
				        let referenceDiv = $("#referenceDiv");
				        
				        if ($("#refChk").is(":checked")) {
				        	// 먼저 반대쪽(결재자 목록)에 같은 사원이 있는지 체크
				            if ($("#sanctionerLineDiv").find(`[data-emplNo="\${foundNode.data}"]`).length > 0) {
				                showToastMessage("결재자와 참조자는 같을 수 없습니다.", "warning");
				                return;
				            }
				        	
				            // 참조자 지정인 경우 referenceDiv에서 중복 체크
				            if ( $("#referenceDiv").find(`[data-emplNo="\${foundNode.data}"]`).length === 0 ) {	// 문제 없을 경우
				                referenceDiv.append(`<div>
				                        <span class="reference" data-emplNo="\${foundNode.data}">\${clickedText}</span>
				                        <button class="btn btn-sm btn-outline-danger remove-reference">❌</button>
				                    </div>`);
				            } else {
				                console.log("참조자가 중복되었습니다.");
				                showToastMessage("참조자가 중복되었습니다.", "warning");
				            }
				        } else {
				        	// 결재자 지정인 경우: 반대쪽(참조자 목록)에 같은 사원이 있는지 체크
				            if ($("#referenceDiv").find(`[data-emplNo="\${foundNode.data}"]`).length > 0) {
				                showToastMessage("결재자와 참조자는 같을 수 없습니다.", "warning");
				                return;
				            }
				        	
				            // 결재자 지정인 경우 sanctionerLineDiv에서 중복 체크
				            if ($("#sanctionerLineDiv").find(`[data-emplNo="\${foundNode.data}"]`).length === 0) {	// 문제 없을 경우
				                sanctionerLineDiv.append(`<div>
				                        <span class="sanctioner" data-emplNo="\${foundNode.data}">\${clickedText}</span>
				                        <button class="btn btn-sm btn-outline-secondary move-up">⬆</button>
				                        <button class="btn btn-sm btn-outline-secondary move-down">⬇</button>
				                        <button class="btn btn-sm btn-outline-danger remove-sanctioner">❌</button>
				                        </div>
				                    `);
				            } else {
				                console.log("결재자가 중복되었습니다.");
				                showToastMessage("결재자가 중복되었습니다.", "warning");
				            }
				        }
				    } else {
				        console.log("해당 노드는 사원 노드가 아닙니다.");
				    }
				});
				
			}	// success 영역 종료
		});
		
		// 재귀적으로 노드를 검색하는 함수 (텍스트가 일치하는 노드를 찾습니다)
		function findNodeByText(nodes, text) {
		    for (var i = 0; i < nodes.length; i++) {
		        // 만약 text 값이 일치하면 해당 노드를 반환
		        if(nodes[i].text === text) {
		            return nodes[i];
		        }
		        // 자식 노드가 있다면 재귀적으로 검색
		        if(nodes[i].children && nodes[i].children.length > 0) {
		            var found = findNodeByText(nodes[i].children, text);
		            if(found) return found;
		        }
		    }
		    return null;
		}
		
	}); // defineLineBtn
	
	// 결재자 지정 모달 내부 초기화 버튼 클릭
	$("#removeSanctioner").on("click", function(){
		console.log("removeSanctioner 작동");
	    $("#sanctionerLineDiv").empty();
	    $("#referenceDiv").empty();
	    $("#refChk").prop("checked", false);
	});
	
	// 결재자 지정 후 저장 클릭
    $("#saveLine").on("click", function(){
    	
    	
    	var approversHTML = $("#sanctionerLineDiv").html();
    	var referencesHTML = $("#referenceDiv").html();
        $("#chosenLine").append(approversHTML);
        $("#chosenRef").append(referencesHTML);
        if(approversHTML != "") {
        	$("#aprDefault").hide();
        }
        if(referencesHTML != "") {
        	$("#refDefault").hide();
        }
        $("#defineLineModal").modal("hide");
    });
	
	$('#previewModal').on('hidden.bs.modal', function () {
	    $("#prevDiv").empty();
	    
	    // 미리보기 모달 닫힐 때 중첩된 결재자 요소 지워주기
	    let editor = CKEDITOR.instances.ckEditor;
	    let aprDiv = editor.document.getById("aprDiv");
	    aprDiv.setHtml("");
	    
	});
	
	// 커스텀 결재선 저장 버튼 클릭(결재자 지정 모달 안에서)
	$("#showCustomModal").on('click', function(){
		var approversHTML = $("#sanctionerLineDiv").html();
		$("#customDiv").html(approversHTML);
	});
	
	// 결재선 저장 버튼 클릭(커스텀 결재자 모달 안에서)
	$("#saveCustom").on("click", function(){
		// 선택된 결재자들 사원코드
		let emplNoApr = $('#customDiv .sanctioner').map(function() {
		    return $(this).attr('data-emplno');
		}).get();  // .get()을 사용하면 배열 형태로 반환됩니다.
		
		let customTitle = $("#customTitle").val();
		
		let customData = {
			emplNo: userId,
			msTitle: customTitle,
			csanctnerNoList: emplNoApr
		};
		
		console.log("customData: ", customData);
		
		$.ajax({
			url: "/sanction/insertCustomApr",
			method: "post",
			data: JSON.stringify(customData),
			dataType: 'json',
			contentType: "application/json; charset=UTF-8",
			success: function(res) {
				console.log("커스텀 결재자 저장 res: ", res);
				if(res == 1) {
					showToastMessage("커스텀 결재선 저장이 완료되었습니다.", "success");
					$("#customModal").modal("hide");
				} else {
					showToastMessage("커스텀 결재선 저장 중 오류가 발생했습니다.", "danger");
					$("#customModal").modal("hide");
				}
			}
		});
		
	});
	
	// 커스텀 결재라인 버튼 클릭 이벤트(sanctionPage에서)
	$("#customSanctnerLine").on("click", function(){
		getCustomAprLine();
	});
	
	// 본문 페이지 결재선 초기화 버튼 이벤트
	$("#removeLine").on("click", function(){
		$("#chosenLine").empty();
		$("#chosenRef").empty();
		$("#aprDefault").show();
		$("#refDefault").show();
	});
		
	
	
}); // readyFunction 범위 종료

// 커스텀 결재자 목록 받아오기 함수
function getCustomAprLine() {
	
	$("#getCustomDiv tbody").empty();
	
	let userIdData = {userId: userId};
	
	$.ajax({
		url: "/sanction/getCustomSanctionLine",
		method: "get",
		data: userIdData,
		dataType: 'json',
		success: function(res){
			console.log("커스텀 결재자 목록 res: ", res);
			
			$.each(res, function(index, doc) {
				
				const tdId = `aprTd-\${index}`;
				
				$("#getCustomDiv tbody").append(`
							<tr>
								<td>\${doc.msNo}</td>
								<td><a class="msTitle">\${doc.msTitle}</a></td>
								<td id='\${tdId}'>
									
								</td>
								<td>\${doc.msDate}</td>
								<td><button class="delCustomBtn btn btn-outline-light border me-3" data-msno="\${doc.msNo}">삭제</button></td>
							</tr>
						`);
				
				$.each(doc.customAprList, function(index, approver){
					$(`#\${tdId}`).append(`
							<div><span class="sanctioner" data-emplno="\${approver.csanctnerNo}">
			        		(\${approver.emplPosition}) \${approver.emplNm}
					        </span></div>
					        `);
				});

			}); // each 종료 영역
		} // success 종료 영역
	});
}

//제목 클릭 이벤트
$(document).on("click", ".msTitle", function() {	// 문서 전체$(document)에서 'click' 이벤트가 클래스가 'msTitle'인 요소에 발생하면 핸들러를 실행하겠다
	// 클릭한 제목이 포함된 행의 3번째 <td> (0부터 시작하므로 eq(2))를 찾아 결재자 정보를 가져옵니다.
	var approversHtml = $(this).closest("tr").find("td").eq(2).html();
	console.log("approversHtml", approversHtml);
	
	// jQuery로 가상 DOM을 생성하여 버튼 추가
    var modifiedHtml = $("<div>").html(approversHtml); // jQuery 객체로 변환

    // 각 결재자 요소에 상하 버튼과 삭제 버튼 추가
    modifiedHtml.find(".sanctioner").each(function() {
        var emplNo = $(this).data("emplno"); // 기존 결재자 데이터 유지
        var approverName = $(this).text().trim();
        
        console.log("emplNo: ", emplNo);
        console.log("approverName: ", approverName);

        // 새로운 HTML 구조 생성
        var newHtml = `
            <div>
                <span class="sanctioner" data-emplno="\${emplNo}">\${approverName}</span>
                <button class="btn btn-sm btn-outline-secondary move-up">⬆</button>
                <button class="btn btn-sm btn-outline-secondary move-down">⬇</button>
                <button class="btn btn-sm btn-outline-danger remove-sanctioner">❌</button>
            </div>
        `;

        // 기존 요소를 새로운 HTML로 변경
        $(this).parent().replaceWith(newHtml);
    });
	
	$("#chosenLine").html(modifiedHtml.html());
	$("#getCustomModal").modal("hide");
	$("#aprDefault").hide();
});

$('#getCustomModal').on('hidden.bs.modal', function() {
	  $(this).find('tbody').empty();
});

// 삭제 버튼 클릭 이벤트
$(document).on("click", ".delCustomBtn", function() {
	let msNoStr = $(this).data("msno");
	let msNo = parseInt(msNoStr);
	let customData = {msNo: msNo };
	
	// 삭제 처리
	$.ajax({
		url: "/sanction/deleteCustomApr",
		method: "post",
		data: customData,
		dataType: 'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(res) {
			if(res == 1) {
				showToastMessage("커스텀 결재자의 삭제가 완료되었습니다.", "success");
				getCustomAprLine();
			} else {
				showToastMessage("커스텀 결재자 삭제 중 오류가 발생했습니다.", "danger");
			}
		}
	});
});

$(document).ready(function () {

    // 🔹 상위 요소에서 이벤트 위임을 사용하여 동적 요소에 대한 클릭 이벤트 처리
    $(document).on("click", ".move-up", function () {
        var current = $(this).closest("div");
        var prev = current.prev();
        if (prev.length !== 0) {
            prev.before(current); // 현재 요소를 이전 요소 앞에 배치
        }
    });

    $(document).on("click", ".move-down", function () {
        var current = $(this).closest("div");
        var next = current.next();
        if (next.length !== 0) {
            next.after(current); // 현재 요소를 다음 요소 뒤에 배치
        }
    });

    // 🔹 개별 삭제 버튼 클릭 시 해당 요소 제거
    $(document).on("click", ".remove-reference", function () {
        $(this).closest("div").remove();
        if ($("#referenceDiv").children().length === 0) {
            $("#refDefault").show(); // 참조자 없으면 기본 메시지 표시
        }
    });

    $(document).on("click", ".remove-sanctioner", function () {
        $(this).closest("div").remove();
        if ($("#sanctionerLineDiv").children().length === 0) {
            $("#aprDefault").show(); // 결재자 없으면 기본 메시지 표시
        }
    });
});
	
</script>
</html>