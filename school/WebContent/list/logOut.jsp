<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${id } : logout!
	<%
		session.invalidate();

		response.sendRedirect("../login.jsp");
	%>
</body>
</html>