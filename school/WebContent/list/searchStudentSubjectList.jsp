<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head><title>학생 목록</title></head>
<style>
	tr
	{
  		counter-increment: aaa;
	}
	tr>td:first-child:before
	{
		content: counter(aaa) " ";
	}
</style>
<script type="text/javascript">
	function changeView(value)
	{
		if(value == "0")
		{
			location.href="../studentMenu.jsp";
		}
	}
</script>
<body>
	Subject
	<form action="searchStudentSubjectList.jsp" method="post">
	ID: <input type="text" name="id"/> <button onclick="changeView(0)">search</button><br><br><br>
	</form>
	
	<table>
<%
	  String id = request.getParameter("id");
      Class.forName("com.mysql.cj.jdbc.Driver");
  
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost/school?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "woehddb5555!";
   
            String query = "select title from subject where id = "+id;
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
   
            while(rs.next())
            {
%>
     			<tr><td><%= rs.getString("title") %>  <input type = 'button' value = 'enrollment' onclick="changeView(0)"/></td></tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
      <a href="../studentMenu.jsp">Menu</a><br>
</body>
</html>