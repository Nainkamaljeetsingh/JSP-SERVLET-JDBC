package sbsn;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import sbsn.jdbcutil;
public class adminaddplace extends HttpServlet 
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			String pn=req.getParameter("place_name");
			int pid=Integer.parseInt(req.getParameter("place_id"));
			con=jdbcutil.getMySqlConnection();
			ps=con.prepareStatement("insert into place(name,id) values(?,?)");
			ps.setString(1,pn);
			ps.setInt(2,pid);
			int x=ps.executeUpdate();
			if(x==1)
			{
               Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Successful');");
	            out.write("</script>");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.include(req, res);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
            Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Unsuccessful');");
	            out.write("</script>");
			RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
			rd1.include(req, res);
			out.write("<br><h1>Invalid Place</h1>");
			RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
			rd2.include(req, res);
			
		}finally
		{
			jdbcutil.cleanup(ps, con);
		}
	}
}