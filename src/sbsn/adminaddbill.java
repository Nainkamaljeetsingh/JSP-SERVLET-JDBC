package sbsn;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import sbsn.jdbcutil;
public class adminaddbill extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		PreparedStatement ps1=null;
		ResultSet rs1=null;
		try {
			String place=req.getParameter("place_name");
			String custid=req.getParameter("cid");
			Integer billno=Integer.parseInt(req.getParameter("billno"));
			Integer units=Integer.parseInt(req.getParameter("units"));
			Integer amt=Integer.parseInt(req.getParameter("amount"));
			Integer due=Integer.parseInt(req.getParameter("due"));
			int total=amt+due;
			if(place!=null && custid!=null && billno!=null && units!=null && amt!=null && due!=null)
			{
				
				int id=Integer.parseInt(custid);
				con=jdbcutil.getMySqlConnection();
				String sql="Select * from customers where cid="+id;
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				String name = null;
				while(rs.next()) {
				name=rs.getString(1);
				}
				ps1=con.prepareStatement("insert into bill(name,cid,place,billno,units,amount,due,totalamt) values(?,?,?,?,?,?,?,?)");
				ps1.setString(1, name);
				ps1.setInt(2,id);
				ps1.setString(3, place);
				ps1.setInt(4,billno);
				ps1.setInt(5,units);
				ps1.setInt(6,amt);
				ps1.setInt(7, due);
				ps1.setInt(8,total);
				ps1.executeUpdate();
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
			RequestDispatcher rd3=req.getRequestDispatcher("header.jsp");
			rd3.include(req, res);
			Writer out=res.getWriter();
			out.write("<h1>Invalid Details</h1>");

			out.write("<script language='javascript'>");
            out.write("alert('Unsuccessful');");
            out.write("</script>");
			RequestDispatcher rd4=req.getRequestDispatcher("footer.jsp");
			rd4.include(req, res);

		}
		finally
		{
			jdbcutil.cleanup(ps, con);
		}
	}

}
