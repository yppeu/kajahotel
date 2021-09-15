<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<style type="text/css">

table.tb{
margin-top:100px;
margin-bottom: 200px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>예약하기</h1>
<!-- 
<form action="bk_chk.jsp" method="post"> -->
<form action="insertRervInfo.do">
<table border=1 width="80%" class="tb">
	<tr>
		<td width="50%"  >
			<img src="${param.picture}" padding="20%" width="100%">
		</td>
	
		<td  width="50%" align="center">
			<p>룸타입: ${param.roomtype }</p><br>
			<input type="hidden" name="roomtype" value="${param.roomtype }">
			<p>1박 요금: ${param.price }</p><br>
			<p>체크인날짜 선택<input type="date" name="checkindate"></p><br>
			<p>체크아웃 날짜 선택<input type="date" name="checkoutdate"></p><br>
			<p >숙박인원 :
				<select name="headcount">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				명
			</p>
			<p>전화번호 입력: <input type="text" name="tel"></p>
		<div>
			<p> 결제정보입력<p>
			<p>
				<select>
					<option id="card" value="MCM">MCM</option>
					<option id="card" value="VISA">VISA</option>
				</select>
				
				<input type="number"  value="card1" width="20%" maxlength="4" required>
				-<input type="number" value="card2" width="20%" maxlength="4" required>
				-<input type="number" value="card3" width="20%" maxlength="4" required>
				-<input type="number" value="card4" width="20%" maxlength="4" required>
			</p>
			<input type="submit" value="예약하기">
			
			<input type="reset" value="취소하기">
 		</div>
		</td>
	</tr>
	<!-- 확인용 회원쪽 완성되면 지우고 변수 받아야함
	<input type="hidden" name="firstname" value="kim">
	<input type="hidden" name="lastname" value="babo">
	
	<input type="hidden" name="roomtype" value="chunhyang"> -->
</table>
</form>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>