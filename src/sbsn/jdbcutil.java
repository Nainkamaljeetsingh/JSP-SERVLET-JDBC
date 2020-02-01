package sbsn;
import java.sql.*;
public class jdbcutil 
{
	static 
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException ex)
		{
			System.out.println(ex);
		}
	}
	public static Connection getMySqlConnection()throws SQLException
	{
		String url="jdbc:mysql://localhost:3305/sbsn";
		Connection con=DriverManager.getConnection(url,"root","Nksingh1998");
		return con;
	}
	public static void cleanup(Statement st,Connection con)
	{
		try
		{
			if(st!=null)st.close();
			if(con!=null)con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public static void cleanup(ResultSet rs,Statement st,Connection con)
	{
		try
		{
			if(rs!=null)
				rs.close();
			if(st!=null)st.close();
			if(con!=null)con.close();		
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	

}
