<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%

String email=(String)request.getAttribute("inputmail");
int idx = email.indexOf("@");
String mail1=email.substring(0,idx);
String mail2=email.substring(idx+1);
String pwd = (String)request.getAttribute("inputpwd");



RequestDispatcher rd1=request.getRequestDispatcher("/loginNow.do");
rd1.forward(request,response);
%>





</body>
</html>