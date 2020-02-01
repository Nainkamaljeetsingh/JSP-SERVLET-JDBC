package sbsn;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import sbsn.jdbcutil;
import java.sql.*;
public class loginadmin extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		String id=null;String pass=null;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Writer out=res.getWriter();
		try
		{
			con=jdbcutil.getMySqlConnection();
			ps=con.prepareStatement("select * from admin_login");
		    rs=ps.executeQuery();
		    while(rs.next())
		    {
		       id=rs.getString(1);
		       pass=rs.getString(2);
		    }
		    String adminid=req.getParameter("adminid");
		    String password=req.getParameter("password");
		    if(adminid!=null &&password!=null)
		    {
		    	if(adminid.equals(id)&&password.equals(pass))
		    	{
		    		out.write("<h4 style='color:red;'>login success,welcome</h4>");
		    		RequestDispatcher rd1=req.getRequestDispatcher("Dashboard.jsp");
		    		rd1.forward(req, res);
		    	}
		    	else
		    	{
		    		out.write("<h4>login failed!</h4><a href='index.jsp'>goback</a>");
		    	}
		    }else
		    {
		   
		    	RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
		    	rd.include(req, res);
		    }
		    
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			jdbcutil.cleanup(rs, ps, con);
		}
	}

}
