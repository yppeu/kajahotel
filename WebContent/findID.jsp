<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<script type="text/javascript">
    function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
    }
</script>
<style>
td{
	text-size:10px;
	margin: 4px;
	text-align:center;
	
}

</style>
</head>
<body>
<jsp:include page="/header.jsp"/>
<br><br><br><br>

	<table align = "center">
		<tr>
			<th colspan="3"><h2>아이디 찾기</h2></th>
		<tr>
		<tr>
			<td colspan="3"><p>아이디가 기억나지 않으시나요?<br>등록된 인증 수단으로 아이디를 찾을 수 있습니다.<p></td>	
		<tr>
		<tr>
			<td colspan="3"><p>회원정보에 등록된 전화번호로 찾기<p></td>
		<tr>
		<tr>
			<td colspan="2"><input type="tel" name="findID" placeholder="전화번호 입력" required></td>
			<td><input type="submit" value="찾기">
		<tr>
	
	
	</table>
	<br><br><br><br>
	
   <jsp:include page="footer.jsp"/>
</body>
</html>