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
								<h5 class="card-title">결재 문서 상세 페이지 입니다.</h5> <br/>
								
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
					
					<div class="col-md-12" id="buttonDiv">
						<div class="card">
							<div class="card-header">
								<div>
									<button class="btn btn-primary" id="allowBtn">승인</button>
									<button class="btn btn-secondary" id="rejectBtn">반려</button>
									<button class="btn btn-primary" id="proxyBtn" style="display: none;">전결</button>
								</div>
								
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
			
			<a href="/hrms/sanction/requestedApvDocuments">
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

let dsCode = "";

$(function(){
    // 세션에서 userId 가져오기
    const userId = sessionStorage.getItem("userId");
    console.log("userId: ", userId);
    
    // URL의 쿼리스트링에서 문서번호(docNo) 추출
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const docNo = urlParams.get('docNo');
    console.log("docNo: ", docNo);
    
    let userIdData = { userId: userId };
    let docNoData = { docNo: docNo };
    let docApv = "";
    let dcrbAllow = "";
    let dcrbRight = "";
    
    let thisData = {
        sanctnerNo: userId,
        docNo: docNo
    };
    
    // 현재 사용자의 직위 정보를 저장할 변수
    let myEmplPosition = "";
    
    // 현재 내 직위 조회
    $.ajax({
        url: "/sanction/nowEmplInfo",
        method: "get",
        data: userIdData,
        dataType: 'json',
        success: function(res){
            console.log("현재 내 직위코드: ", res.emplPosition);
            myEmplPosition = res.emplPosition;
            
            // 현재 문서에서 내 결재 상태 조회
            $.ajax({
                url: "/sanction/thisDocApvStatus",
                method: "get",
                data: thisData,
                dataType: 'json',
                success: function(res){
                    console.log("현재 문서의 내 결재상태: ", res);
                    let nowSanctnSt = res.sanctnStatus;
                    console.log("nowSanctnSt", nowSanctnSt);
                    let nowSanctnFlow = res.sanctnFlow;
                    
                    if(nowSanctnSt == 03 || nowSanctnSt == 04 || nowSanctnSt == 05 || nowSanctnSt == 06) {
                        $("#buttonDiv").hide();
                    }
                    
                    // 결재자 서명 조회
                    $.ajax({
                        url: "/sanction/getSanctnerSign",
                        method: "get",
                        data: userIdData,
                        dataType: 'json',
                        success: function(res){
                            console.log("결제자 서명: ", res);
                            let emplSignature = res.emplSignature;
                            
                            // 문서 상세 정보 조회 및 DOM 업데이트를 담당하는 함수
                            function loadDocDetail() {
                                $.ajax({
                                    url: "/sanction/getApvDocDetail",
                                    method: 'get',
                                    data: docNoData,
                                    dataType: 'json',
                                    success: function(res){
                                        console.log("문서 상세 정보: ", res);
                                        
                                     	// 양식 코드 담기
    									dsCode = res.dsCode;
                                        
                                        // 문서 기본정보 업데이트
                                        $("#docNo").html(res.docNo);
                                        $("#writer").html(res.writerNo);
                                        $("#docTitle").html(res.docTitle);
                                        
                                        if(res.docApv == '01') {
                                            docApv = "결재 중";
                                        } else if(res.docApv == '02') {
                                            docApv = "승인";
                                        } else if(res.docApv == '03') {
                                            docApv = "반려";
                                        }
                                        $("#docStatus").html(docApv);
                                        
                                        $("#submitDate").html(res.sanctnRqstdt);
                                        $("#expiredDate").html(res.docPeriod);
                                        
                                        if(res.dcrbAllow == 'Y') {
                                            dcrbAllow = "허용";
                                        } else if(res.dcrbAllow == 'N') {
                                            dcrbAllow = "불허";
                                        }
                                        $("#allowAt").html(dcrbAllow);
                                        
                                        // 사용자의 전결권 보유 여부 업데이트
                                        if(myEmplPosition != '01') {
                                            dcrbRight = "보유";
                                        } else {
                                            dcrbRight = "미보유";
                                        }
                                        
                                        if(dcrbAllow == '허용' && dcrbRight == '보유') {
    										$("#proxyBtn").show();
    									}
                                        
                                        $("#myAllow").html(dcrbRight);
                                        
                                        // 결재 선 업데이트
                                        if (res.aprRefList && res.aprRefList.length > 0) {
                                            var sanctionHtml = "";
                                            $.each(res.aprRefList, function(index, approver) {
                                                sanctionHtml += "<div>" + approver.sanctnerNo + " (" + approver.sanctnStatus + ")</div>";
                                            });
                                            $("#sanctionLine").html(sanctionHtml);
                                        }
                                        
                                        // 문서 내용 업데이트
                                        $("#docContent").html(res.docContent);
                                    },
                                    error: function(error){
                                        alert("문서 상세정보 호출에 오류가 발생했습니다.");
                                    }
                                });
                            }
                            
                            // 초기 문서 상세정보 로드
                            loadDocDetail();
                            
                            // 승인 버튼 클릭 이벤트
                            $("#allowBtn").on("click", function(){
                                let allowUpdateData = {
                                    userId: userId,
                                    docNo: docNo
                                };
                                console.log("allowUpdate: ", allowUpdateData);
                                
                                $.ajax({
                                    url: "/sanction/allowUpdate",
                                    method: "post",
                                    data: allowUpdateData,
                                    dataType: 'json',
                                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                    success: function(res){
                                        if(res == 1) {
                                            // 결재 서명 업데이트
                                            var imgHtml = '<img src="data:image/png;base64,' + emplSignature + '" alt="Signature" />';
                                            $("#"+userId).html(imgHtml);
                                            
                                            // 전체 결재 박스의 서명 완료 여부 확인 후 최종 승인 처리
                                            var totalSignBoxCount = $(".signBox").length;
                                            var signedBoxCount = $(".signBox img").length;
                                            console.log("전체 결재 박스 수: ", totalSignBoxCount);
                                            console.log("서명된 결재 박스 수: ", signedBoxCount);
                                            
                                            if(signedBoxCount === totalSignBoxCount) {
                                                console.log("모든 결재자가 서명을 마쳤습니다.");
                                                $.ajax({
                                                    url: "/sanction/allowFinalStatus",
                                                    method: "post",
                                                    data: docNoData,
                                                    dataType: 'json',
                                                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                                    success: function(res){
                                                        if(res === 1) {
                                                            console.log("최종 승인 처리가 완료되었습니다.");
                                                            
                                                            // 연장근무, 야간근무 결재시 히스토리 테이블 인서트
                                                            insertHistory(docNoData);
                                                            
                                                            // 사원 평가일 때
                                                            if(dsCode == '99') {
                                                            	let emplNoValue = $("#emplNoValue").text();
                                                            	let evalScore = $("#totalScore").text();
                                                            	let evalScoreStr = evalScore.split("점")[0];
                                                            	let evalSbj = $("#emplNo").text();
                                                            	
                                                        		let evalData = {
                                                        				evalSbj: evalSbj,
                                                        				emplObj: emplNoValue,
                                                        				evalScore: evalScoreStr,
                                                        		};
                                                        		console.log("evalData: ", evalData);
                                                        		insertEvaluation(evalData);
                                                        		
                                                        		
                                                        	}
                                                            
                                                        } else {
                                                            alert("최종 승인 처리 중 오류가 발생했습니다.");
                                                        }
                                                    },
                                                    error: function(){
                                                        alert("최종 승인 과정 중 ajax 오류입니다.");
                                                    }
                                                });
                                            }
                                            
                                            // 서명이 반영된 문서 내용 업데이트
                                            let docContentHtml = $("#docContent").html();
                                            console.log("docContentHtml: ", docContentHtml);
                                            
                                            let signUpdateData = {
                                                docContent: docContentHtml,
                                                docNo: docNo
                                            };
                                            
                                            $.ajax({
                                                url: "/sanction/docSignUpdate",
                                                method: "post",
                                                data: signUpdateData,
                                                dataType: 'json',
                                                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                                success: function(res){
                                                    if(res == 1) {
                                                        $("#buttonDiv").hide();
                                                        // 전체 페이지 새로고침 대신 loadDocDetail() 호출
                                                        loadDocDetail();
                                                    } else {
                                                        alert("문서 업데이트에 실패했습니다.");
                                                    }
                                                }
                                            });
                                        } else {
                                            alert("승인 처리 중 오류가 발생했습니다.");
                                        }
                                    }
                                });
                            }); // 승인 버튼 클릭 이벤트 종료
                            
                            // 전결 버튼 클릭 이벤트
                            $("#proxyBtn").on("click", function(){
                            	
                            	$("#buttonDiv").hide();
                            	
                                let proxyData = {
                                    docNo: docNo,
                                    sanctnFlow: nowSanctnFlow
                                };
                                
                                // 내 결재 정보는 05(전결)로, 이후 결재자들은 06(위임전결)로 업데이트
                                $.ajax({
                                    url: "/sanction/proxyUpdate",
                                    method: "post",
                                    data: proxyData,
                                    dataType: 'json',
                                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                    success: function(proxyRes){
                                        console.log("proxy update res: ", proxyRes);
                                        
                                        // 본인 칸에 전결 도장 표시
                                        $("#"+userId).append('<img src="${pageContext.request.contextPath }/assets/img/etcsign/proxySign.png" alt="Signature" />');
                                        
                                        // 본인 외 다른 결재자 칸에 위임전결 도장 표시
                                        $(".signBox").each(function(){
                                            var boxId = $(this).attr("id");
                                            // 내 사원번호랑 태그 id 다른 칸들에
                                            if(boxId != userId){
                                                $(this).append('<img src="${pageContext.request.contextPath }/assets/img/etcsign/delegateSign.png" alt="Signature" />');
                                            }
                                        });
                                        
                                        // 연장근무 신청서 등 dsCode에 따른 히스토리 테이블 삽입
                                        insertHistory(docNoData);
                                        
                                     	// 사원 평가일 때
                                        if(dsCode == '99') {
                                        	let emplNoValue = $("#emplNoValue").text();
                                        	let evalScore = $("#totalScore").text();
                                        	let evalScoreStr = evalScore.split("점")[0];
                                        	let evalSbj = $("#emplNo").text();
                                        	
                                    		let evalData = {
                                    				evalSbj: evalSbj,
                                    				emplObj: emplNoValue,
                                    				evalScore: evalScoreStr,
                                    		};
                                    		console.log("evalData: ", evalData);
                                    		insertEvaluation(evalData);
                                    		
                                    		
                                    	}
                                        
                                        // 문서 상태 업데이트
                                        $.ajax({
                                            url: "/sanction/updateDocStatus",
                                            method: "post",
                                            data: docNoData,
                                            dataType: 'json',
                                            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                            success: function(statusRes){
                                                if(statusRes == 1) {
                                                    let proxyDocContentUpdate = $("#docContent").html();
                                                    let proxyDocContentData = {
                                                        docNo: docNo,
                                                        docContent: proxyDocContentUpdate
                                                    };
                                                    $.ajax({
                                                        url: "/sanction/updateProxyDocContent",
                                                        method: "post",
                                                        data: proxyDocContentData,
                                                        dataType: 'json',
                                                        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                                        success: function(proxyContentRes){
                                                            // 전결 처리 후 변경된 정보를 다시 불러옴
                                                            loadDocDetail();
                                                        },
                                                        error: function(error){
                                                            alert("전결 후 문서 교체에 실패했습니다.");
                                                        }
                                                    });
                                                } else {
                                                    alert("문서 상태 최종업데이트 중 문제가 발생했습니다.");
                                                }
                                            }
                                        });
                                    },
                                    error: function(error){
                                        alert("전결 처리 중 오류가 발생했습니다.");
                                    }
                                });
                            }); // 전결 버튼 클릭 이벤트 종료
                            
                        },
                        error: function(error){
                            alert("결제자 서명 조회에 오류가 발생했습니다.");
                        }
                    });
                }
            });
        }
    });
});

// 연장, 야간 히스토리 insert
function insertHistory(docNoData) {
	
	// 연장근무 신청서 등 dsCode에 따른 히스토리 테이블 삽입
    if(dsCode == '03' || dsCode == '04') {
        $.ajax({
            url: "/sanction/getWriterNo",
            method: "get",
            data: docNoData,
            dataType: 'json',
            success: function(writerRes) {
                console.log("기안자 사원번호: ", writerRes.writerNo);
                let writerNo = writerRes.writerNo;
                let hisType = (dsCode == '03') ? "01" : "02";
                
                // 일자, 시간 값 추출 (해당 요소의 id가 dateValue, timeValue)
                let dateRange = $("#dateValue").text();
                let timeRange = $("#timeValue").text();
                let [startDate, endDate] = dateRange.split(" - ");
                let [startTime, endTime] = timeRange.split(" - ");
                
                let overTimeData = {
                    emplNo: writerNo,
                    hisType: hisType,
                    hisSdate: startDate,
                    hisEdate: endDate,
                    hisStime: startTime,
                    hisEtime: endTime
                };
                console.log("overTimeData: ", overTimeData);
                
                $.ajax({
                    url: "/sanction/historyInsert",
                    method: "post",
                    data: JSON.stringify(overTimeData),
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    success: function(histRes){
                        console.log("히스토리 테이블 인서트 res: ", histRes);
                        if(histRes == 1) {
                            console.log("히스토리 테이블 인서트 완료");
                        }
                    },
                    error: function(error) {
                        console.error("히스토리 테이블 인서트 실패:", error);
                        alert("히스토리 테이블 인서트 중 오류 발생");
                    }
                });
            }
        });
    }
	
} // insertHistory 종료 영역

// 사원 평가 시 데이터 인서트
function insertEvaluation(evalData) {
	$.ajax({
		url: "/sanction/insertEvaluation",
		method: "post",
		data: JSON.stringify(evalData),
		dataType: "json",
        contentType: "application/json; charset=UTF-8",
        success: function(evalRes) {
        	console.log("evalRes: ", evalRes);
        	if(evalRes == 1) {
        		alert("사원 평가 데이터 삽입 성공");
        	} else {
        		alert("사원 평가 데이터 삽입 실패");
        	}
        }
	});
}
</script>
</html>