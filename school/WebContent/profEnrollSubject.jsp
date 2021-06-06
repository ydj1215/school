<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="profEnrollSubject.do" method="post">
		ID : <input type="text" name="id"/> 교과목 번호<br>
		ProfId : <input type="text" name="pId"/> 교수 아이디<br>
		Title: <input type = "text" name = "title"/> 강의명<br>
		# of Student: <input type="text" name="count"/> 학생수<br><br>
		<input type="submit" value="Enroll"/>
	</form>
</body>
</html>