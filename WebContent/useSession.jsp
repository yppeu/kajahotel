<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>

<h3>세션 정보</h3>

isNew : <%=session.isNew()%><br>

Session ID : <%=session.getId()%><br>

Session Created : <%=new java.util.Date(session.getCreationTime())

                                  .toString() %><br>

Session Last Access Time : <%=new java.util.Date(session.

                                             getLastAccessedTime()).toString() %><br>

Session Active Time : <%=session.getMaxInactiveInterval()%> sec<br>

</body>
</body>
</html>