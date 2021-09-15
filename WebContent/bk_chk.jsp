<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 확인</title>
<style>
.bk_content{
	line-height:2;
	text-decoration: underline;
	text-underline-position:under;
	border-style: solid;
	width:250px;
	padding-left:10px;
}
.op{
	padding-left:15%;
	margin-bottom: 5px;
	margin-top: 5px;
}

.body1{
width:auto;
height:400px;
padding-left:45%;
}
.emty{
font-size:45px;
font-color:red;
padding-left:35%;
margin-top: 100px;
margin-bottom: 400px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div align=center>
	<div class="bk_chk"><h1>예약 정보 확인</h1></div>
	<div class="hotel_name"><h3> KAJA HOTEL</h3></div>
	<div class="hotel_number"><h3> 02-1234-5678</h3></div>
</div>

<c:choose>
<c:when test="${setone ne '1' }">
<c:if test="${empty blist}">
	<div class="emty">예약된 내용이 없습니다.</div>
</c:if>
<c:forEach var="bk" items="${blist }">
<div class="body1" >

	<div class="bk_content" >예약 번호:${bk.BKNUM}<br>
	체크인 날짜:${bk.CHKIN}<br>
	체크아웃 날짜:${bk.CHKOUT}<br>
	룸 타입: ${bk.RMTYPE}<br>
	예약자 이름:${bk.LASTNAME} ${bk.FIRSTNAME}님<br>
	숙박인원: ${bk.HEADCNT} 명
	<br>
	</div>
	
	<div class="op"><a href="bkDelete.do?BKNUM=${bk.BKNUM }" onclick="return confirm('정말 예약 취소하시겠습니까?');">예약 취소하기</a></div>
	
	<div class="op"><a href="bkUpdate.do?BKNUM=${bk.BKNUM }" onclick="return confirm('예약 변경하시겠습니까?');">예약 변경하기</a></div>
	<br>
	

</div>
</c:forEach>
</c:when>
<c:when test="${setone eq '1' }">
<c:if test="${empty blist}">
	<div class="emty">예약된 내용이 없습니다.</div>
</c:if>
<c:forEach var="bk" items="${blist }" begin="0" end="0">
<div class="body1">
	
	
	<div class="bk_content">예약 번호:${bk.BKNUM}<br>
	체크인 날짜:${bk.CHKIN}<br>
	체크아웃 날짜:${bk.CHKOUT}<br>
	룸 타입: ${bk.RMTYPE}<br>
	예약자 이름:${bk.LASTNAME} ${bk.FIRSTNAME}님<br>
	숙박인원: ${bk.HEADCNT} 명
	</div><br>
	
	<div class="op"><a href="bkDelete.do?BKNUM=${bk.BKNUM }" onclick="return confirm('정말 예약 취소하시겠습니까?');">예약 취소하기</a></div>
	<div class="op"><a href="bkUpdate.do?BKNUM=${bk.BKNUM }" onclick="return confirm('예약 변경하시겠습니까?');">예약 변경하기</a></div>
</div>
</c:forEach>

</c:when>
</c:choose>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>