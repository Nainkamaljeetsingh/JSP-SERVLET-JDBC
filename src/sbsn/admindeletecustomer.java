package sbsn;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import sbsn.jdbcutil;
import java.io.*;
public class admindeletecustomer extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		Connection con=null;
		PreparedStatement ps=null;
		try {
		String custname=req.getParameter("customers_name");
		Integer cid=Integer.parseInt(req.getParameter("cid"));
		if(custname!=null && cid!=null)
		{
			try {
			con=jdbcutil.getMySqlConnection();
			String sql="delete from customers where cid="+cid+" and name='"+custname+"'";
			ps=con.prepareStatement(sql);
			int x=ps.executeUpdate();
			if(x!=1)
			{
				RequestDispatcher rd1=req.getRequestDispatcher("footer.jsp");
				rd1.include(req, res);
				
				Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Unsuccessful');");
	            out.write("</script>");
				RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
				rd2.include(req, res);
				
			}
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.include(req, res);
			}catch(Exception e)
			{
				Writer out=res.getWriter();
				RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
				rd1.include(req, res);
				out.write("<h1>Please enter the valid details</h1>");
				out.write("<script language='javascript'>");
		            out.write("alert('Unsuccessful');");
		            out.write("</script>");
				e.printStackTrace();
				RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
				rd2.include(req, res);
				
			}finally
			{
				jdbcutil.cleanup(ps, con);
			}
		}else
		{
			RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
			rd1.include(req, res);
			Writer out1=res.getWriter();
			out1.write("<h1>Enter the valid details</h1>");
			RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
			rd2.include(req, res);
		}
	}catch(Exception e)
		{
		Writer out=res.getWriter();
		RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
		rd1.include(req, res);
		out.write("<h1>Please enter the valid details</h1>");
		out.write("<script language='javascript'>");
            out.write("alert('Unsuccessful');");
            out.write("</script>");
		e.printStackTrace();
		RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
		rd2.include(req, res);
		
	}
		}

}
