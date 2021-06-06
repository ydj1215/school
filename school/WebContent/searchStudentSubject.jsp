</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head><title></title></head>
<script type="text/javascript">
	function changeView(value)
	{
		if(value == "0")
		{
			location.href="/list/searchStudentSubjectList.jsp";
		}
	}
	</script>
<body>
	ID: <input type="text" name="id"/> <button onclick="changeView(0)">search</button><br><br><br>
		<a href="studentMenu.jsp">Menu</a>
</body>
</html>