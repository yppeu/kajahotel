<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<title>chunhyangRoom</title>
<!-- <link rel="stylesheet" href="kajaroom.css"> -->
<jsp:include page="header.jsp"></jsp:include>
<style>
table.rm{
margin-top: 150px;
margin-bottom: 100px;

}

</style>
</head>
<body>
<form action="makeReservation.jsp" method="post">
<div>
<table border=0 class="rm">
<tr>
	<td width=50%>
		<img src="pictures/chunhyang.jpg" width="100%" >
		<input type="hidden" name="picture" value="pictures/chunhyang.jpg">
	</td>
	<td  width=50% align="center">
		<P><h1>Chunhyang Room</h1><p>
		<input type="hidden" name="roomtype" value="Chunhyang Room">
		<p>패밀리 스위트, 시티전망 </p>
		<input type="hidden" " value="패밀리 스위트, 시티전망">
		<p>인원 : 성인 2명, 자녀 2명 </p>
	
		<p>1박 요금 : 350,000KRW </p>
		<input type="hidden" name="price" value="350000">
	<P><b>지금 당장 예약하려면!</b> <input type="submit"  value="예약하기" ></P>
	</td>
</tr>
</table>
</div>
</form>

<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>