         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/customer.css">
    <title>Bill</title>
<style>
body
{ 
	background-image:url("image/8.jpg");
background-position:center;
 background-repeat: no-repeat ;
 background-size: cover;
    
}
    #nk
    {
    
    }
</style>

</head>
<body>
    <div class="container">
<center>
<fieldset style="width:675px; background-color:#CCCCCC;">
        <div class="details">
      <h3><p style="background-color:grey;color:red;border-radius:50px;width:300px;">CUSTOMER DETAIL</p></h3>
             <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3305/sbsn" user="root" password="Nksingh1998"/>
       <sql:query var="rs" sql="select * from customers where cid=${ID}" dataSource="${con}"/>
           <c:forEach var="customer" items="${rs.rows }">
            
            <table>
                <tr><td>Customer</td><td>:</td><td>${customer.name }</td></tr> 
                <tr><td>place</td> <td>: </td><td>${customer.place_name } </td> </tr>
                <tr><td>Customer id</td><td>:</td><td>${customer.cid }</td></tr>
            </table></c:forEach>
                </div>

        <div class="details">
            <div class="details"><% int i=0; %>
                <h3> <p style="background-color:grey;color:red;border-radius:50px;width:300px;">BILL DETAILS</p></h3>
                <sql:query var="rs1" sql="select * from bill where cid=${ID} and place='${PLACE}'" dataSource="${con}"/>
           <c:forEach var="bill" items="${rs1.rows }">
                <table><% i=1; %>
                    <tr><td>Bill no.    </td><td></td><td>:</td><td></td> <td> ${bill.billno }</td></tr>
                    <tr><td>Unit </td><td></td><td>:</td><td></td><td> ${bill.units }</td></tr><br>
                    <tr><td>Amount </td><td></td><td>:</td><td></td><td> ${bill.amount }</td>
                    <tr><td>Due</td><td></td><td>  :</td><td></td><td> ${bill.due }</td></tr>
                    <tr id="nk"><td>Date</td><td style="color:transparent;">.....</td><td>: </td><td></td><td style="padding:0 5px;" > ${bill.date }</td></tr>
                </table>
            </div>
        </div>

        <div class="result">
            <p>Total amount to be paid :${bill.totalamt } 
            
               </p></c:forEach>

     
<div class="bd">
<% if(i==0){
            	%>
            	<h1>Please Enter the valid place and customer id!!</h1>
            	<h2><a href="index.jsp">Goback</a></h2>
           <%  }%>
<% if(i==1){ %>
<form action="pay.jsp" method="post">
<input type="submit" name="btn_update" value="Pay Now" id="btn"/>
</form>
</div>
</br>
</br>
        <div class="button">
            <button onclick="window.print()"> Print </button>
         </div><% } %>
</fieldset>
</center>
</body>
</html>