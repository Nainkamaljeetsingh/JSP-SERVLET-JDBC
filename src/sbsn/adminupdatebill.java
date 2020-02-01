package sbsn;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import sbsn.jdbcutil;
public class adminupdatebill extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		Connection con=null;
		PreparedStatement ps=null;
		try {
		String place=req.getParameter("place");
		Integer cid=Integer.parseInt(req.getParameter("rn"));
		Integer billno=Integer.parseInt(req.getParameter("billno"));
		Integer units=Integer.parseInt(req.getParameter("units"));
		Integer amt=Integer.parseInt(req.getParameter("amount"));
		Integer due=Integer.parseInt(req.getParameter("due"));
		int total=amt+due;
		con=jdbcutil.getMySqlConnection();
		String sql="update bill set billno="+billno+",units="+units+",amount="+amt+",due="+due+",totalamt="+total+" where cid="+cid;
		ps=con.prepareStatement(sql);
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
			RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
			rd1.include(req, res);
			Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Successful');");
	            out.write("</script>");
			
			out.write("<h1>Please enter all the correct details</h1>");
			RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
			rd2.include(req, res);
		}
	}

}
