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
			location.href="/school/list/profAboutList01.jsp";
		}
	}
</script>
<body>
      교수:등록한 과목 리스트
      <table border = "1">
      <tr>
            <td>과목 번호</td>
            <td>과목명</td>
            <td>최대 인원</td>
            <td>교수 아이디</td>
      </tr>
 
<%
      Class.forName("com.mysql.cj.jdbc.Driver");
  
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
  
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost/school?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "woehddb5555!";
   
            String query = "select * from subject;";
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
     
            while(rs.next())
            {
%>
      <tr>
            <td onclick="changeView(0)" style="color: blue;"><u><%= rs.getString("id") %></u></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("count") %></td>
            <td><%= rs.getString("prof") %></td>
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
      <a href="../profMenu.jsp">Menu</a><br>
</body>
</html>