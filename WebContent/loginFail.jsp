<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	$(document).ready(function(){
		$(window.open(alert("가입되어 있지 않은 회원이거나 비밀번호가 일치하지 않습니다.")))
	})
</script>
<title></title>
</head>
<body>

<%
RequestDispatcher rd=request.getRequestDispatcher("loginpage.jsp");
rd.include(request, response);
%>
</body>
</html>