package sbsn;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import sbsn.jdbcutil;
import java.io.*;
public class deletebill extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
		String cid=req.getParameter("cid");
		System.out.println(cid);
		if(cid.equals(""))
		{
		
			RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
			rd1.include(req, res);

            Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Unsuccessful');");
	            out.write("</script>");
			out.write("<h1>INVALID CUSTOMER ID</h1>");
			RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
			rd2.include(req, res);			

					
		
		}else{
			Integer id=Integer.parseInt(cid);
			con=jdbcutil.getMySqlConnection();
			String sql="delete from bill where cid="+id;
			ps=con.prepareStatement(sql);
			int x=ps.executeUpdate();
           if(x==1) {
            Writer out=res.getWriter();
				out.write("<script language='javascript'>");
	            out.write("alert('Successful');");
	            out.write("</script>");
			
		RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
						rd.include(req, res);}
           else {
           Writer out=res.getWriter();
			out.write("<script language='javascript'>");
            out.write("alert('Unsuccessful');");
            out.write("</script>");
        	RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.include(req, res);
           }
		}
						}catch(Exception e)
		{
							   Writer out=res.getWriter();
								out.write("<script language='javascript'>");
					            out.write("alert('Unsuccessful');");
					            out.write("</script>");
							out.write("<h1>INVALID CUSTOMER ID</h1>");
							RequestDispatcher rd2=req.getRequestDispatcher("footer.jsp");
							rd2.include(req, res);
			e.printStackTrace();
			
		}finally
		{
			jdbcutil.cleanup(ps, con);
		}
	}

}