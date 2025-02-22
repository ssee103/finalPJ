<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
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
        

            width:400px;  
            height:600px; 

            padding:40px;  

            text-align: center;

            background-color: rgb(255,255,255); 
            border-radius:10px;
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

            transform:translateY(-50%); 
        }
        
</style>
</head>
<body>

<!-- JS : managingEmployee.js -->
	<div class="modal">
        <div class="modal_body">
            <h2>신규 사원 등록</h2>
            <!-- 권한 부여 해야된다 -->
            <form id="employeeForm">
	            사원 번호: <input type="text" id="emplNo" name="emplNo"/> <br/>
	            비밀 번호: <input type="text" id="emplPwd" name="emplPwd"/> <br/>
	            사원 명: <input type="text" id="emplNm" name="emplNm"/> <br/>
	            직위 코드: <select id="positionSelect" name="emplPosition">
	            			<option>직위 선택</option> <!-- 직위 코드 다 받아와서 동적 출력(공통코드 테이블 내부) -->
	            		</select> <br/>
	            부서 코드: <select id="deptCode" name="deptCode">
	            			<option>부서 선택</option> <!-- 부서 목록 다 받아와서 동적 출력 -->
	            		</select> <br/>
	            팀 코드: <select id="teamCode" name="teamCode">
	            			<option>팀 선택</option> <!-- 팀 목록 다 받아와서 동적 출력 -->
	            		</select> <br/>
	            생년월일: <input type="date" id="emplBrthdy" name="emplBrthdy"/> <br/>
	            입사 일자: <input type="date" id="hireDate" name="hireDate"/> <br/>
	            기본 급여: <input type="text" id="basicSalary" name="basicSalary"/> <br/>
	            은행 코드: <select id="bankCode" name="bankCode">
	            			<option>은행 선택</option>	<!-- 은행코드 전부 받아오기 -->
	            		</select> <br/>
	            은행 지점명: <input type="text" id="bankName" name="bankName"/> <br/>
	            계좌 번호: <input type="text" id="account" name="account"/> <br/>
	            <div id="authContainer">
		           	권한 부여: <select id="authSelect" name="authSelect" class="authSelect">
		           				<option>권한 선택</option>
		           			</select> <button id="addAuthBtn">추가 권한</button><br/>
	           	</div>
	           	
				<br/>	           			
	            <button type="button" id="saveBtn">등록</button>
	            <button class="btn-close-modal">닫기</button>
            </form>
            
            <form id="bulkEmployeeForm" method="post" enctype="multipart/form-data">
	           	<p>회원 일괄 등록</p>
	           	<input type="file" name="excelFile" accept=".xlsx, .xls" required/>
	           	<button type="button" id="bulkSaveBtn">일괄 등록</button>
           	</form>
        </div>
    </div>
	<button class="btn-open-modal">신규 사원 등록</button>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/managingEmployee.js"></script>
</body>
</html>