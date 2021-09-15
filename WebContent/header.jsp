<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KAJA 호텔에 오신걸 환영합니다.</title>
<link rel="stylesheet" href="header.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>

<script>
$(document).ready(function() {

	$('#dropmenu .rooms').hide();

	$('.info').mouseover(function() {
		$('.rooms').slideDown();
	});

	$('.info').mouseleave(function() {
		$('.rooms').hide();
	});
});

var login="<%=session.getAttribute("login")%>"
	


	function chkREV() {
		var login="<%=session.getAttribute("login")%>"
		
		if(login !="yes"){
			swal("로그인 먼저 해주세요");
			return false;
		}
		
	}
</script>



</head>
<body>
	<header>
		<div class="logo">

			<div>
				<h1 align=center>
					<a href="index.jsp">KAJA <br />HOTEL
					</b><br /></a>
				</h1>
			</div>

		<nav class="nav1">
				<!-- <ul class="loginmenu">
					<li><a href="loginpage.jsp">로그인 |</a> <a
						href="join.jsp">회원가입</a></li>
				
				</ul> -->
					<ul>
					
					<c:choose>
						<c:when test="${login ne 'yes'}" >
							<li><a href="loginpage.jsp">로그인 |</a> 
							<a href="join.jsp">회원가입</a></li>
						</c:when>
						<c:when test="${login eq 'yes' }">
							 <li><%=session.getAttribute("username") %>님 환영합니다. |</li> 
							 <li><a href="logOutNow.do"> 로그아웃 </a></li>
						 </c:when>
					</c:choose>
	
					</ul>
				<br /> <br />
			</nav>

			
			<div id="dropmenu">
				<ul>
					<li><a href="kajabrand.jsp">KAJA소개</a></li>
					<li><a href="bude.jsp">부대시설</a></li>
					<li class="info"><a href="#">객실안내</a>
						<ul class="rooms">
							<li><a href="ondalRoom.jsp">Ondal Room</a></li>
							<li><a href="bidamRoom.jsp">Bidam Room</a></li>
							<li><a href="chunhyangRoom.jsp">Chunhyang Room</a></li>
						</ul></li>
					<li><a href="bk_chk.do" onclick="return chkREV();">예약확인</a></li>
				</ul>
			</div>
	</header>

</body>
</html>