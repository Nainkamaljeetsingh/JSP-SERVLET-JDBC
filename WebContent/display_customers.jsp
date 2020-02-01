<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/home.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="./css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type='text/css' href="css/manage.css">
    <title>Dashboard</title>
</head>
<body>
        
    <div class="title">
        <a href="Dashboard.jsp"><img src="./image/Hello.jpeg" alt="" class="logo"></a>
        <span class="heading">Dashboard</span>
     <%--    <a href="index.jsp" style="color: white"><span class="fa fa-sign-out fa-2x">Logout</span></a>
    --%></div>
<div class="nav">
        <ul>
            <li class="dropdown" onclick="toggleDisplay('1')">
                <a href="" class="dropbtn">Places &nbsp
                    <span class="fa fa-angle-down"></span>
                </a>
                <div class="dropdown-content" id="1">
                    <a href="add_places.jsp">Add place</a>
                    <a href="display_places.jsp">Display place</a>
                </div>
            </li>
            <li class="dropdown" onclick="toggleDisplay('2')">
                <a href="#" class="dropbtn">Customers &nbsp
                    <span class="fa fa-angle-down"></span>
                </a>
                <div class="dropdown-content" id="2">
                    <a href="add_customers.jsp">Add customers</a>
                    <a href="delete_customers.jsp">Delete customers</a>
                    <a href="display_customers.jsp">Display customers</a>
		</div>
            </li>
            <li class="dropdown" onclick="toggleDisplay('3')">
                <a href="#" class="dropbtn">Bills &nbsp
                    <span class="fa fa-angle-down"></span>
                </a>
                <div class="dropdown-content" id="3">
                    <a href="add_bills.jsp">Add bills</a>
                    <a href="manage_bills.jsp">Manage bills</a>
                </div>
            </li>
<li class="dropdown" onclick="toggleDisplay('3')">
                
                
                    <a href="bill_logs.jsp">Bill Logs</a>
                   
                
            </li>
        </ul>
    </div>
 <div class="main">
     <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3305/sbsn" user="root" password="Nksingh1998"/>
       <sql:query var="rs" sql="select * from customers" dataSource="${con}"/>
       <table>
       <caption>Places</caption>
       <tr>
                <th>customer Name</th>
                <th>customer id</th>
                <th>place</th>
                </tr>
       <c:forEach var="customer" items="${rs.rows }" >
       <tr>
       <td>${customer.name }</td><td>${customer.cid }</td><td>${customer.place_name }
       </tr>       
       </c:forEach></table>
    </div>   
 <div class="footer">
        <!-- <span>Designed & Coded By Nainkamal</span> -->
    </div>
</body>
</html>
    