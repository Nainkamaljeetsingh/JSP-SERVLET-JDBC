package sbsn;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import sbsn.jdbcutil;
import java.sql.*;
import java.util.*;
public class logincustomer extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		String place=req.getParameter("place_name");
		Integer custid=Integer.parseInt(req.getParameter("rn"));
		HttpSession sess=req.getSession();
		sess.setAttribute("ID", custid);
		sess.setAttribute("PLACE",place);
		RequestDispatcher rd=req.getRequestDispatcher("customer.jsp");
		rd.forward(req, res);
	}

}
