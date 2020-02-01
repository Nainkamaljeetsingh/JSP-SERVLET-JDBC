<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
   
        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/home.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="./css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="normalize.css">
    <title>Dashboard</title>
    <style>
        .main{
            border-radius: 10px;
            border-width: 5px;
            border-style: solid;
            padding: 20px;
            margin: 7% 20% 0 20%;
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
        
    <div class="title">
        <a href="Dashboard.jsp"><img src="./image/Hello.jpeg" alt="" class="logo"></a>
        <span class="heading">Dashboard</span>
        <a href="index.jsp" style="color: white"><span class="fa fa-sign-out fa-2x">Logout</span></a>
    </div>

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
    <% int i=0,j=0,k=0; %>
    <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3305/sbsn" user="root" password="Nksingh1998"/>
       <sql:query var="rs" sql="select * from place" dataSource="${con}"/>
            <c:forEach var="place" items="${rs.rows }" >
            <%
            i++;
            
            %>
            </c:forEach>
             <sql:query var="rs1" sql="select * from customers" dataSource="${con}"/>
             <c:forEach var="customer" items="${rs1.rows }" >
            <%
            j++;
            %> 
             </c:forEach>
             <sql:query var="rs2" sql="select * from bill" dataSource="${con}"/>
             <c:forEach var="bill" items="${rs2.rows }" >
             <%
             k++;
             %>
             </c:forEach>
             <p>Number of places:<%=i%></p>
             <p>Number of customers:<%=j %></p>
             <p>Number of bills:<%=k %></p>
         </div>

    <div class="footer">
         <span> Coded By Nainkamal</span> 
    </div>
</body>
</html>

