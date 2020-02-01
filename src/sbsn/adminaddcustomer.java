package sbsn;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import sbsn.jdbcutil;
public class adminaddcustomer extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		Connection con=null;
		PreparedStatement ps=null;
		try {
			String custname=req.getParameter("customers_name");
			String custid=req.getParameter("customers_id");
			String place=req.getParameter("place_name");
			if(custname!=null&&custid!=null&&place!=null)
			{
				int id=Integer.parseInt(custid);
				con=jdbcutil.getMySqlConnection();
				ps=con.prepareStatement("insert into customers values(?,?,?)");
				ps.setString(1, custname);
				ps.setInt(2,id);
				ps.setString(3, place);
				ps.executeUpdate();
				Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Successful');");
	            out.write("</script>");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.include(req, res);
				
			}
			else
			{
				RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
				rd1.include(req, res);
				Writer out=res.getWriter();
				out.write("<h1>Invalid Details</h1>");
				out.write("<script language='javascript'>");
	            out.write("alert('Unsuccessful');");
	            out.write("</script>");
				RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
				rd2.include(req, res);
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			jdbcutil.cleanup(ps, con);
		}
	}

}
