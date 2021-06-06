<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head><title>회원 목록</title></head>
<script type="text/javascript">
	function changeView(value)
	{
		if(value == "0")
		{
			location.href="/school/list/profAboutList.jsp";
		}
	}
</script>
<body>
      교수:과목의 수강생 리스트
      <table id='myTable' border = "1" >
      <tr>
            <td>id</td>
            <td>이름</td>
      </tr>
 
<%
  	  int count = 0;
      Class.forName("com.mysql.cj.jdbc.Driver");
  
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      String id = request.getParameter("id");
      
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost/school?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "woehddb5555!";
   
            String query = "select name from student where id in (select student from enroll where subject =" +id+")";
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
   
            while(rs.next())
            {
            	count++;
%>
      <tr>
            <td><%= count %></td>
            <td><%= rs.getString("name") %></td>
      </tr>
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
      총 수강 인원: <%= count %>명<br>
<a href="../profMenu.jsp">Menu</a><br>  
</body>
</html>