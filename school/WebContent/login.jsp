<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	YongIn LMS <br>
	<form action="login.do" method="post">
		ID  : <input type="text" name="id"/><br>
		PW: <input type="password" name="pwd"/><br>
		<input type = "radio" name = "prof">Professor 
        <input type = "radio" name = "student">Student<br><br>
		<input type="submit" value="Login"/><br>
	</form>
</body>
</html>