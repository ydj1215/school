package school.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import school.dao.SchoolDao;
import school.vo.SchoolDto;

public class SchoolDao {
	private static SchoolDao dao = new SchoolDao();
	private SchoolDao() {}
	public static SchoolDao getInstance()
	{
		return dao;
	}
	
	public Connection connect()
	{
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","woehddb5555!");
		}
		catch(Exception e)
		{
			System.out.println("MDAO:connect"+e);
		}
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement pstmt)
	{
		if(pstmt != null)
		{
			try
			{
				pstmt.close();
			}
			catch(Exception e)
			{
				System.out.println("Pstmt close error!"+e);
			}
		}
		if(conn != null)
		{
			try
			{
				conn.close();
			}
			catch(Exception e)
			{
				System.out.println("Conn close error!"+e);
			}
		}
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs)
	{			
		if(rs != null)
		{
			try
			{
				rs.close();
			}
			catch(Exception e) {
				System.out.println("rs close error!"+e);
			}
		}
		close(conn,pstmt);
	}
	
	public boolean profLogin(String id, String pwd) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("select * from prof where id = ? and pwd = ?;");
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
			result = true;
		}
		else
		{
			result = false;
		}
		}
		catch(Exception e)
		{
			System.out.println("profLogin error!" +e);
		}
		finally
		{
			close(conn,pstmt,rs);
		}
		return result;
	}
	
	public boolean studentLogin(String id, String pwd) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("select * from student where id = ? and pwd = ?;");
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
			result = true;
		}
		else
		{
			result = false;
		}
		}
		catch(Exception e)
		{
			System.out.println("studentLogin error!" +e);
		}
		finally
		{
			close(conn,pstmt,rs);
		}
		return result;
	}
	
	public void profEnrollSubject(SchoolDto subject) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("insert into subject values(?,?,?,?);");
			pstmt.setString(1,subject.getId());
			pstmt.setString(2,subject.getName());
			pstmt.setString(3,subject.getCount()+"");
			pstmt.setString(4,subject.getpId());
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("profEnrollSubject error!" +e);
		}
		finally
		{
			close(conn,pstmt);
		}
	}
}
