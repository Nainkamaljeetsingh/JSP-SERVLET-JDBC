<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <a href="dashboard.php"><img src="./image/Hello.jpeg" alt="" class="logo"></a>
        <span class="heading">Dashboard</span>
        <a href="logout.php" style="color: white"><span class="fa fa-sign-out fa-2x">Logout</span></a>
    </div>
<div class="nav">
        <ul>
            <li class="dropdown" onclick="toggleDisplay('1')">
                <a href="" class="dropbtn">Places &nbsp
                    <span class="fa fa-angle-down"></span>
                </a>
                <div class="dropdown-content" id="1">
                    <a href="add_places.php">Add place</a>
                    <a href="display_places.php">Display place</a>
                </div>
            </li>
            <li class="dropdown" onclick="toggleDisplay('2')">
                <a href="#" class="dropbtn">Customers &nbsp
                    <span class="fa fa-angle-down"></span>
                </a>
                <div class="dropdown-content" id="2">
                    <a href="add_customers.php">Add customers</a>
                    <a href="delete_customers.php">Delete customers</a>
                    <a href="display_customers.php">Display customers</a>
		</div>
            </li>
            <li class="dropdown" onclick="toggleDisplay('3')">
                <a href="#" class="dropbtn">Bills &nbsp
                    <span class="fa fa-angle-down"></span>
                </a>
                <div class="dropdown-content" id="3">
                    <a href="add_bills.php">Add bills</a>
                    <a href="manage_bills.php">Manage bills</a>
                </div>
            </li>
<li class="dropdown" onclick="toggleDisplay('3')">
                
                
                    <a href="bill_logs.php">Bill Logs</a>
                   
                
            </li>
        </ul>
    </div>
 <div class="main">
        <?php
            include('init.php');
            include('session.php');

            $sql = "CALL `getcustomers`();";
            $bill = mysqli_query($conn, $sql);

            if (mysqli_num_rows($bill) > 0) {
               echo "<table>
                <caption>Customers</caption>
                <tr>
                <th>customer Name</th>
                <th>customer id</th>
                <th>place</th>
                </tr>";

                while($row = mysqli_fetch_array($bill))
                  {
                    echo "<tr>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['cid'] . "</td>";
                    echo "<td>" . $row['place_name'] . "</td>";
                    echo "</tr>";
                  }

                echo "</table>";
            } else {
                echo "0 customers";
            }
        ?>
    </div>   
 <div class="footer">
        <!-- <span>Designed & Coded By Nainkamal</span> -->
    </div>
</body>
</html>
    