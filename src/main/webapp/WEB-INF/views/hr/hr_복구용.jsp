<%@page import="kr.or.ddit.hr.vo.EmployeeVO"%>
<%@page import="kr.or.ddit.hr.vo.TeamVO"%>
<%@page import="kr.or.ddit.hr.vo.DepartmentVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>조직도</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 조직도 관련 땡겨와야 하는 것 2개.  -->
	<script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css" />

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	<!-- Apple Touch Icon -->
	<link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png">
	<!-- Theme Script js -->
	<script src="assets/js/theme-script.js"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<!-- Feather CSS -->
	<link rel="stylesheet" href="assets/plugins/icons/feather/feather.css">
	<!-- Tabler Icon CSS -->
	<link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css">
	<!-- Bootstrap Tagsinput CSS -->
	<link rel="stylesheet" href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">
	<!-- Owl carousel CSS -->
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<!-- Select2 CSS -->
	<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	 <!-- Color Picker Css -->
	<link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css">
	<link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css">
	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/style.css">
	</head>

	<body>
		<div id="global-loader">
			<div class="page-loader"></div>
		</div>
	
		<script type="text/javascript">
		// 서버에서 데이터 불러오기
		const initialData = [
		    <% 
		    List<DepartmentVO> departments = (List<DepartmentVO>) request.getAttribute("departments");
	
		    for (DepartmentVO department : departments) { 
		    %>
		    {
		        text: '<%= department.getDeptName() %>',
		        children: [
		            <% for (TeamVO team : department.getTeams()) { %>
		            {
		                text: '<%= team.getTeamName() %>',
		            },
		            <% } %>
		        ]
		    },
		    <% 
		    } 
		    %>
		];
		</script>
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
				<div class="content p-0">
					<div class="d-md-flex">
						<div class="email-sidebar border-end border-bottom" style="width: 450px;">
							<div class="active slimscroll h-100">
								<div class="slimscroll-active-sidebar">					
									<div class="p-3">
										<div class="shadow-md bg-white rounded p-2 mb-4"">
											<div id="tree" class="tui-tree-wrap" style="background-color: white; width: 100%;">	
												<script>
											    // Toast UI Tree 초기화
											    var tree = new tui.Tree('#tree', {
											        data: initialData,
											        nodeDefaultState: 'opened',
											        showCheckbox: true,
											        template: {
											            internalNode:
											                '<div class="tui-tree-content-wrapper" style="padding-left: {{indent}}px">' +
											                    '<button type="button" class="tui-tree-toggle-btn tui-js-tree-toggle-btn">' +
											                        '<span class="tui-ico-tree"></span>' +
											                    '</button>' +
											                    '<span class="tui-tree-text tui-js-tree-text ">' +
											                        '<span class="tui-tree-ico tui-ico-folder"></span>' +
											                        '<span >{{text}}</span>' +
											                    '</span>' +
											                '</div>' +
											                '<ul class="tui-tree-subtree tui-js-tree-subtree" >{{children}}</ul>',
											
											            leafNode:
											                '<div class="tui-tree-content-wrapper" style="padding-left: {{indent}}px">' +
											                    '<span class="tui-tree-text tui-js-tree-text">' +
											                        '<span class="tui-tree-ico tui-ico-file"></span>' +
											                        '{{text}}' +
											                    '</span>' +
											                '</div>'
											        }
											    }).enableFeature('Selectable', {
											        selectedClassName: 'tui-tree-selected'
											    }).enableFeature('Checkbox', {
											        checkboxClassName: 'tui-tree-checkbox'
											    }).enableFeature('Editable', {
											        dataKey: 'text'
											    });
	    										</script>
											</div>
										</div>
									</div>
								</div>
								<div class="shadow-md bg-white rounded p-2 mb-4">
									<div class="d-flex align-items-center">
										<br/>
										<button  id="toggleDepartmentFormBtn" class="btn btn-primary">부서추가</button>
										<button  id="toggleTeamFormBtn" class="btn btn-primary">팀 추가</button>
										<button  id="toggleDepartmentDelFormBtn" class="btn btn-primary">부서 삭제</button>
										<button  id="toggleTeamDelFormBtn" class="btn btn-primary">팀 삭제</button>
									</div>
								</div>
								<div class="shadow-md bg-white rounded p-2 mb-4">
									<div class="d-flex align-items-center">
										<form id="delTeamForm" method="post"  style="display: none; border: 1px solid #ddd; width: 100%;">
										    <label for="delTeamCode">팀 코드:</label>
										    <input type="text" id="delTeamCode" name="teamCode" required>
										    <button type="button" id="delTeamBtn">팀 삭제 양식</button>
										</form>
										<form id="delDepartmentForm" method="post"  style="display: none; border: 1px solid #ddd; width: 100%;">
										    <label for="delDepartmentCode">부서 코드:</label>
										    <input type="text" id="delDepartmentCode" name="deptCode" required>
										    <button type="button" id="delDepartmentBtn">부서 삭제 양식</button>
										</form>
										<form id="createDepartmentForm" method="post" style="display: none; border: 1px solid #ddd; width: 100%;">
										    <label for="deptCodeDepartment">부서 코드:</label>
										    <input type="text" id="deptCodeDepartment" name="deptCode" required>
										    HR, IT, FIN
										    <br>
										    <label for="dprlr">부서장:</label>
										    <input type="text" id="dprlr" name="dprlr">
										    <br>
										    <label for="deptName">부서 이름:</label>
										    <input type="text" id="deptName" name="deptName" required>
										    <br>
										    <button type="button" id="submitDepartmentBtn"> ^ 부서 추가 버튼</button>
										</form>
										<br>
										<form id="createTeamForm" method="post" style="display: none; border: 1px solid #ddd; width: 100%;">
										    <label for="teamCode">팀 코드:</label>
										    <input type="text" id="teamCode" name="teamCode" required>
										    <br>
										    <label for="deptCodeTeam">부서 코드:</label>
										    <input type="text" id="deptCodeTeam" name="deptCode" required>
										    <br>
										    <label for="teamHeader">팀장:</label>
										    <input type="text" id="teamHeader" name="teamHeader">
										    <br>
										    <label for="teamName">팀 이름:</label>
										    <input type="text" id="teamName" name="teamName" required>
										    <br>
										    <button type="button" id="submitTeamBtn"> ^ 팀 추가 버튼</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="bg-white flex-fill border-end border-bottom mail-notifications">
							<div class="active slimscroll h-100">
								<div class="slimscroll-active-sidebar">	
									<div class="p-3">
										<div class="d-flex align-items-center justify-content-between flex-wrap row-gap-3">
											<div>
												<br/>
												<h3 class="mb-1" style="font-family: Pretendard-Regular; font-size: 25px; ">부서별 정보조회</h3>
												<br/>
												<div class="d-flex align-items-center">
													<span>팀 명 정보 : <input type="text" id="selectedValue"   readonly /></span>
													<% session.setAttribute("selectedValue", request.getParameter("selectedValue")); %>
												</div>
											</div>
										</div>
									</div>
									<div class="bg-white flex-fill border-end border-bottom mail-notifications" style="width: 100%;">
									<!-- 리스트들 -->
									<script>
									<%
								    String selectedValue = request.getParameter("selectedValue");
								    if (selectedValue != null) {
								        session.setAttribute("selectedValue", selectedValue);
								    }
								%>
								<!-- 부서 정보 표시 -->
								<p style="display: none;">선택된 부서: <strong id="selectedDepartment"><%= selectedValue != null ? selectedValue : "부서 없음" %></strong></p>

								<!-- 팀원 목록을 표시할 div 추가 -->
								    <div id="teamMemberList" style="text-align: center;">
								        <p>팀원을 선택하면 여기에 리스트가 표시됩니다.</p>
								    </div>
								    
								<script>
								tree.on('select', function(eventData) {
								    var nodeData = tree.getNodeData(eventData.nodeId);
								    selectedValue.value = nodeData.text;

								    document.getElementById("selectedDepartment").innerText = nodeData.text;

								    var xhr = new XMLHttpRequest();
								    xhr.open("POST", "/hrms/hr/saveSelectedValue", true);
								    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
								    xhr.send("selectedValue=" + encodeURIComponent(nodeData.text));

								    fetchTeamMembers(nodeData.text);
								});
								</script>
								<script>
								function fetchTeamMembers(teamName) {
								    var xhr = new XMLHttpRequest();
								    xhr.open("GET", "/hrms/hr/members?teamName=" + encodeURIComponent(teamName), true);
								    xhr.setRequestHeader("Content-Type", "application/json");

								    xhr.onreadystatechange = function() {
								        if (xhr.readyState === XMLHttpRequest.DONE) {
								            if (xhr.status === 200) {
								                var teamMembers = JSON.parse(xhr.responseText);
								                console.log("받은 팀원 데이터:", teamMembers);
								                renderTeamMembers(teamMembers);
								            } else {
								                console.error("Error Team members:", xhr.status);
								            }
								        }
								    };
								    xhr.send();
								}

								</script>
								<script>
									function renderTeamMembers(members) {
									    var container = document.getElementById("teamMemberList");
									    container.innerHTML = "";
	
									    if (members.length === 0) {
									        container.innerHTML = "<p>해당 부서에 팀원이 없습니다.</p>";
									        return;
									    }
	
									    members.forEach(function(member) {
									        console.log("member.emplNm 이름:", member.emplNm); 
									        console.log("member.emplPosition 포지션 :", member.emplPosition);
									        console.log("member.emplNo 사번:", member.emplNo);
											console.log("member : ", member);
	
									        container.innerHTML = "";
									        var memberHtml = `
									            <div class="list-group-item border-bottom p-3">
									                <div class="d-flex align-items-center mb-2">
									                    <div class="form-check form-check-md d-flex align-items-center flex-shrink-0 me-2">
									                        <input class="form-check-input" type="checkbox">
									                    </div>
									                    <div class="d-flex align-items-center flex-wrap row-gap-2 flex-fill">
									                        <a href="email-reply.html" class="avatar bg-purple avatar-rounded me-2">
									                            <span class="avatar-title">\${member.emplNm.charAt(0)}</span>
									                        </a>
									                        <div class="flex-fill">
									                            <div class="d-flex align-items-start justify-content-between">
									                                <div>
										                                <h5 class="mb-1">\${member.emplNm} ( 포지션 코드 : \${member.emplPosition})</h5>
										                                <span class="fw-semibold">( 사번 : \${member.emplNo} )</span>
									                                </div>
									                                
									                                <div class="d-flex align-items-center">
									                            <!-- 쪽지 보내기 버튼 -->
									                            <button class="btn btn-primary btn-sm me-2" onclick="sendMessage('\${member.emplNo}', '\${member.emplNm}')">
									                                    쪽지 보내기
									                                </button>
									                                <div class="dropdown">
									                                    <button class="btn btn-icon btn-sm rounded-circle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
									                                        <i class="ti ti-dots"></i>
									                                    </button>
									                                    <ul class="dropdown-menu dropdown-menu-end p-3">
									                                        <li><a class="dropdown-item rounded-1" href="email-reply.html">쪽지 열기</a></li>
									                                        <li><a class="dropdown-item rounded-1" href="javascript:void(0);">답글쓰기</a></li>
									                                    </ul>
									                                </div>
									                            	</div>
									                            </div>
									                        </div>
									                    </div>
									                </div>
									            </div>
									            `;
									        container.innerHTML += memberHtml;
									    });
									}
									</script>
									<!-- 리스트들 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer d-sm-flex align-items-center justify-content-between bg-white p-3">
			<p>Developed By <a href="javascript:void(0);" class="text-primary">HERMES</a></p>
		</div>
		<!-- /Page Wrapper -->
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
	<script>
	var util = {
	    addEventListener: function(element, eventName, handler) {
	        if (element.addEventListener) {
	            element.addEventListener(eventName, handler, false);
	        } else {
	            element.attachEvent('on' + eventName, handler);
	        }
	    }
	};
	</script>
	<script>
	var customInternalNode =
	    '<div class="tui-tree-content-wrapper tui-tree-root-btn" style="padding-left: {{indent}}px">' +
	        '<button type="button" class="tui-tree-toggle-btn tui-js-tree-toggle-btn">' +
	            '<span class="tui-ico-tree"></span>' +
	            '{{stateLabel}}' +
	        '</button>' +
	        '<span class="tui-tree-text tui-js-tree-text">' +
	            '{{text}}' +
	        '</span>' +
	    '</div>' +
	    '<ul class="tui-tree-subtree tui-js-tree-subtree">' +
	        '{{{children}}}' + // Mustache's format
	    '</ul>';

	var customLeafNode =
	    '<div class="tui-tree-content-wrapper tui-tree-root-btn" style="padding-left: {{indent}}px">' +
	        '<span class="tui-tree-text tui-js-tree-text">' +
	            '{{text}}' +
	        '</span>' +
	    '</div>';
	</script>
	<script>
	    var selectedValue = document.getElementById('selectedValue');
	    var rootNodeId = tree.getRootNodeId();
	    var firstChildId = tree.getChildIds(rootNodeId)[0];
	
	    tree.on('select', function(eventData) {
	        var nodeData = tree.getNodeData(eventData.nodeId);
	        selectedValue.value = '' + nodeData.text;
	
	        saveSelectedValueToSession(nodeData.text);
	    });
	
	    function saveSelectedValueToSession(selectedValue) {
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "/saveSelectedValue", true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        xhr.send("selectedValue=" + encodeURIComponent(selectedValue));
	    }
	
	</script>
	<script>

	document.getElementById('delTeamBtn').addEventListener('click', function () {
	    // 팀 코드 가져오기
	    const teamCode = document.getElementById('delTeamCode').value.trim();

	    // 유효성 검사: 빈 값 확인
	    if (!teamCode) {
	        alert('팀 코드를 입력해주세요.');
	        return;
	    }

	    // DELETE 요청 전송
	    fetch('/deleteTeam', {
	        method: 'POST', // Controller에서 @PostMapping 사용 중이므로 DELETE 대신 POST 사용
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({ teamCode: teamCode }) // 서버에서 JSON 형태로 받기 때문에 객체로 변환
	    })
	    .then(response => {
	        if (response.ok) {
	            alert('팀이 성공적으로 삭제되었습니다.');
	            location.reload(); // 페이지 새로고침
	        } else {
	            return response.text().then(errorMessage => {
	                alert(`팀 삭제 실패: ${errorMessage}`);
	            });
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('서버와 통신 중 문제가 발생했습니다. 관리자에게 문의하세요.');
	    });
	});


	document.getElementById('delDepartmentBtn').addEventListener('click', function () {
	    // 팀 코드 가져오기
	    const deptCode = document.getElementById('delDepartmentCode').value.trim();

	    // 유효성 검사: 빈 값 확인
	    if (!deptCode) {
	        alert('부서 코드를 입력해주세요.');
	        return;
	    }

	    // DELETE 요청 전송
	    fetch('/deleteDepartment', {
	        method: 'POST', // Controller에서 @PostMapping 사용 중이므로 DELETE 대신 POST 사용
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({ deptCode: deptCode }) // 서버에서 JSON 형태로 받기 때문에 객체로 변환
	    })
	    .then(response => {
	        if (response.ok) {
	            alert('부서가 성공적으로 삭제되었습니다.');
	            location.reload(); // 페이지 새로고침
	        } else {
	            return response.text().then(errorMessage => {
	                alert(`부서 삭제 실패: ${errorMessage}`);
	            });
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('서버와 통신 중 문제가 발생했습니다. 관리자에게 문의하세요.');
	    });
	});
	//부서와 팀 삭제 후 저장 버튼
	</script>
	<script>
	//부서와 팀 생성 후 저장 버튼
	document.getElementById('submitDepartmentBtn').addEventListener('click', function() {
	    const formData = {
	        deptCode: document.getElementById('deptCodeDepartment').value,
	        dprlr: document.getElementById('dprlr').value,
	        deptName: document.getElementById('deptName').value
	    };
	
	    fetch('/createDepartment', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(formData)
	    })
	    .then(response => {
	        if (response.ok) {
	            alert('부서가 성공적으로 생성되었습니다.');
	            location.reload();
	        } else {
	            alert('부서 생성에 실패했습니다.');
	        }
	    })
	    .catch(error => console.error('Error:', error));
	});
	
	
	
	
	document.getElementById('submitTeamBtn').addEventListener('click', function() {
	    const formData = {
	        teamCode: document.getElementById('teamCode').value,
	        deptCode: document.getElementById('deptCodeTeam').value,
	        teamHeader: document.getElementById('teamHeader').value,
	        teamName: document.getElementById('teamName').value
	    };
	
	    fetch('/createTeam', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(formData)
	    })
	    .then(response => {
	        if (response.ok) {
	            alert('팀이 성공적으로 생성되었습니다.');
	            location.reload();
	        } else {
	            alert('팀 생성에 실패했습니다.');
	        }
	    })
	    .catch(error => console.error('Error:', error));
	});

	</script>
	<script>
	document.getElementById('toggleDepartmentFormBtn').addEventListener('click', function() {
	    const form = document.getElementById('createDepartmentForm');
	    if (form.style.display === 'none') {
	        form.style.display = 'block'; // 폼 표시
	    } else {
	        form.style.display = 'none'; // 폼 숨기기
	    }
	});

	document.getElementById('toggleTeamFormBtn').addEventListener('click', function() {
	    const form = document.getElementById('createTeamForm');
	    if (form.style.display === 'none') {
	        form.style.display = 'block'; // 폼 표시
	    } else {
	        form.style.display = 'none'; // 폼 숨기기
	    }
	});

	document.getElementById('toggleTeamDelFormBtn').addEventListener('click', function() {
	    const form = document.getElementById('delTeamForm');
	    if (form.style.display === 'none') {
	        form.style.display = 'block'; // 폼 표시
	    } else {
	        form.style.display = 'none'; // 폼 숨기기
	    }
	});

	document.getElementById('toggleDepartmentDelFormBtn').addEventListener('click', function() {
	    const form = document.getElementById('delDepartmentForm');
	    if (form.style.display === 'none') {
	        form.style.display = 'block'; // 폼 표시
	    } else {
	        form.style.display = 'none'; // 폼 숨기기
	    }
	});
	</script>
</html>