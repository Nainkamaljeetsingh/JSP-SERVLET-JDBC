<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link href="loginluv.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div class="main_div">
<h2><font size="15" color="#10378E">Electricity Bill Payment </font></h2>	
	  	
	  	</div>
<div class="contenido">		

<div class="login">
<ul class="backgroundslider">
	<li></li>
	<li></li>
	<li></li>
	</ul>
<form action="index" method="POST">

<h1>Admin Login</h1><br>
<input type="text" name="adminid" placeholder="Name" required><br><br>
<input type="password" name="password" placeholder="Password" required><br><br>
<input type="submit" name="submit" id="submit" value="LOGIN"><br><br>


<div class="container" style="margin-top:150px;text-align:center;font-style:underline" color="#FFC300">
<p><font size="4"><b>Designed by NainKamal</b></font></p>
</div>
</form>

</div>

<div class="logup">
<ul class="backgroundslider">
	<li></li>
	<li></li>
	<li></li>
	</ul>
<form action="customer" method="post">

                <fieldset>

<h1>Customer Login</h1><br>
                                       <select name="place_name">
                <option selected disabled>Select place</option>
                <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3305/sbsn" user="root" password="Nksingh1998"/>
       <sql:query var="rs" sql="select * from place" dataSource="${con}"/>
                <c:forEach var="place" items="${rs.rows }" >
                <option value="${place.name }">${place.name }</option>
                </c:forEach>
                </select>
                   
                    <input type="text" name="rn" placeholder="enter customer id">
                    <input type="submit" value="Get bill and pay">
                </fieldset>
</form>

</div>



</div>
	
</body>
</html>