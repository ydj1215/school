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
      교수:등록한 과목 리스트
      <table border = "1">
      <tr>
            <td>과목번호</td>
            <td>학생명</td>
      </tr>
 
<%
      Class.forName("com.mysql.cj.jdbc.Driver");
  
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      String sId = (String)request.getSession().getAttribute("sId");
      request.setAttribute("sId", sId);
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost/school?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "woehddb5555!";
   
            String query = "select * from enroll;";
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
   
            while(rs.next())
            {
%>
      <tr>
            <td><%= rs.getString("subject") %></td>
            <td><%= rs.getString("student") %></td>
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
</body>
</html>