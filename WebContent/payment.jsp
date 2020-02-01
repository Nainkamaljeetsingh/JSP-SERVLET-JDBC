<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>
<html>
<head>
<title>
 Power Payment
</title>
<style>
body
{
	background-image:url("image/7.jpg");
background-position:center;
 background-repeat: no-repeat ;
 background-size: cover;
	
}
#txt
{
	width:250px;
	border-style:groove;
	height:30px;
	border-radius:4px;
}
#sl
{
	width:125px;
	border-style:groove;
	height:30px;
	border-radius:4px;
}
#btn
{
	background-color:#1e5799;
	border-style:none;
	width:100px;
	height:30px;
	border-radius:4px;
	color:white;
}
#btn:hover{
background-color:#1e5700;
color:#000;
}
.header
{
		position:fixed;
		top:0px;
		background-color:#000;
		width:100%;
		left:0px;
		color:#fff;	
		opacity:.8;
		text-align:center;
}
		.footer
		{
		position:fixed;
		bottom:0px;
		background-color:#000;
		width:100%;
		left:0px;
		color:#fff;
		
		}
		.footer a
		{
color:#fff;
		}
		.container
		{
			padding-top:120px;
		}
		table
		{
			text-align:center;
		}
		.section
		{
			
		background-color:#A9A9A9;
		width:700px;
		height:490px;
		border-radius:10px;
		
		}
</style>
</head>
<body>
<%
          response.setHeader("Cache-control","no-cache");
          response.setHeader("Cache-control","no-store");
          response.setHeader("Pragma","no-cache");
          response.setDateHeader("Expire",0);
    
    %>

<center>
<div class="container">
<div class="section">
		<br>
<form action="complete.jsp" method="post">
		<input type="text" name="ch" id="txt" placeholder="Card Holder" required>
		<br>
		<br>
		<input type="text" name="cn" id="txt" placeholder="Card Number" required>
		<br>
		<br>
		<input type="text" name="cvs" id="txt" placeholder="CVS" required>
		<br>
		<br>
		<select name="card" id="txt">
                <option selected disabled>Select Your Card</option>
                <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3305/sbsn" user="root" password="Nksingh1998"/>
       <sql:query var="rs" sql="select * from card" dataSource="${con}"/>
                <c:forEach var="cards" items="${rs.rows }" >
                <option value="${cards.card_name }">${cards.card_name }</option>
                </c:forEach>
                </select>
<br>
<label>Card Expire On</label><br>
<select name="mm" id="sl">
		<option value="">Select Month</option>
		<% 
		for(int i=1;i<=12;i++)
		{
          %>
              <option value="<%=i %>"><%=i %></option>  
		<%
		}
		%>
</select>
<select name="yy" id="sl">
		<option value="">Select Year</option>
		<%
		for(int j=2000;j<=2050;j++)
		{
          %>
              <option value="<%=j%>"><%=j %></option>  
		<%
		}
		%>
</select>
		<br>
		<br>
		<input type="submit" name="btnpro" id="btn" value="Pay Now">
	</form>
	<a href="cancel.jsp"><input type="submit"id="btn" value="Cancel"></a><br>
  </center>
  </div>
  </div>
  
</body>
</html>