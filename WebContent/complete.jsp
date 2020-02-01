<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>
 Power Payment
</title>
<style>
body
{
	background-image:url("image/10.jpeg");
background-position:center;
 background-repeat: no-repeat ;
 background-size: cover;

	background-color:#F8ECC2

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
<h1><font color="yellow">Electricity Bill Payment</font></h1>
<hr>
<br>
<br>
<br>
<p> <font size="6">
Your Payment Is Received</font>
</p>
<a href="index.jsp">Click Here</a>To Go Home
</center>
</body>
</html>