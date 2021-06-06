<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head><title>회원 목록</title></head>
<body>
      학생:수강신청한 과목 리스트
      <table border = "1">
      <tr>
            <td>과목번호</td>
            <td>과목명</td>
      </tr>
 
<%
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
   
            String query = "select b.id, b.name from enroll a, subject b where a.subject=b.id and a.student ="+id+";";
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
   			int count = 0;
   			
            while(rs.next())
            {
            	count ++;
%>
      <tr>
            <td><%= count %></td>
            <td><%= rs.getString("name") %></td>
      </tr>
<%
            }
      }catch(Exception ex){
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