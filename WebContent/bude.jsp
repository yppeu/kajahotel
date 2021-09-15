<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
.top{
margin-top: 100px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>


</head>
<body>

<div class="top">
<jsp:include page="restaurant.jsp"></jsp:include>
</div>
<jsp:include page="cafe.jsp"></jsp:include>
<jsp:include page="bar.jsp"></jsp:include>
<jsp:include page="pool.jsp"></jsp:include>
<jsp:include page="fitness.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>