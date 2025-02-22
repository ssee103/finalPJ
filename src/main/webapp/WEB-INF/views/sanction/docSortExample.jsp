<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.info{
  font-weight: bold;
  width: 150px;
}
#detail{
  height: 300px;
}
td{
  height: 50px;
  text-align: center;
}
#remark{
  text-align: left;
}

.container {
            width: 300px;
            height: 400px;
            position: relative;
            border: 2px solid black;
        }
     
/* 실선 역할을 할 div */
.line {
    position: absolute;
    top: 33%;
    left: 5%;
    width: 100%;
    height: 1px;
    background-color: black;
}

</style>
<body>
<!-- 연차 신청 -->
<table border="1" cellpadding="1" cellspacing="1" style="width: 1000px; display: none;">
	<tbody>
		<tr>
			<td class="info" id="dept">부서</td>
			<td></td>
			<td class="info" id="emplPosition">직위</td>
			<td></td>
		</tr>
		<tr>
			<td class="info" id="emplNm">성명</td>
			<td></td>
			<td class="info" id="emplNo">사원번호</td>
			<td></td>
		</tr>
	</tbody>
</table> <br/>

<table border="1" cellpadding="1" cellspacing="1" style="width: 1000px;">
	<tbody>
		<tr>
			<td class="info" style="display: none">기간</td>
			<td style="display: none"></td>
		</tr>
		<tr>
			<td class="info">대체자 성명</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="info">사유</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="info" id="detail">세부 사항</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
			<p>&nbsp;</p>

			<p>상기한 사유로 휴가를 신청합니다.</p>

			<p>&nbsp;</p>

			<p>20 년 월 일</p>

			<p>&nbsp;</p>

			<p>신청자:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(인)</p>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="remark">
			<p>&lt;비고&gt;</p>

			<p>&nbsp;</p>

			<p>&nbsp;</p>

			<p>&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>


<div class="container">
	<div class="line"></div>
</div>

<table style="border-collapse:collapse;" border="2px" width="130px">
	<tr>
		<td id="forName"></td>
	</tr>
	<tr height="100px">
		<td id="forEmpNo"></td>
	</tr>
</table>

<table border="1">
	<tr>
		<td>문서 번호</td>
		<td>문서 번호링</td>
	</tr>
	<tr>
		<td>문서 번호</td>
		<td>문서 번호링</td>
	</tr>
</table>
</body>
</html>