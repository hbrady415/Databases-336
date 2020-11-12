<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String username = request.getParameter("FirstName");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/";
String database = "21schema";
String userid = "CS336Group21";
String password = "CS336Group21DatabaseUser";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 75%;
  font-size: 12px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 10px;
}

#Employee {
  border-collapse: collapse;
  width: 75%;
  border: 1px solid #ddd;
  font-size: 12px;
}

#Employee th, #Employee td {
  text-align: left;
  padding: 12px;
}

#Employee tr {
  border-bottom: 1px solid #ddd;
}

#Employee tr.header, #Employee tr:hover {
  background-color: #f1f1f1;
}

</style>
</head>

<body>
<h4>Employee Information Details:</h4>

			<table>
			<tr>
			<td><a href=managerPage.jsp><button>Back</button></a><td>
			<td><a href=registerEmployee.jsp><button>Add a New Employee</button></a><td>
			</tr>
			</table>

<input type="text" id="myInput" onkeyup="searchable()" placeholder= "Enter an employee....." title="Type in a name">

<br>

<table id="Employee" border="1">
<tr>
<th onclick="sortTable(0)">First name</th>
<th onclick="sortTable(1)">Last name</th>
<th onclick="sortTable(2)">SSN</th>
<th onclick="sortTable(3)">Username</th>
<th onclick="sortTable(4)">Password</th>
<th>Update</th>
<th>Delete</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Employee";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("FirstName") %></td>
<td><%=resultSet.getString("LastName") %></td>
<td><%=resultSet.getString("SSN") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
<td><a href="employeeUpdate.jsp?FirstName=<%=resultSet.getString("FirstName")%>">update</a></td>
<td><a href="employeeDelete.jsp?FirstName=<%=resultSet.getString("FirstName")%>">delete</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("Employee");
  switching = true;
  // Set the sorting direction to ascending:
  dir = "asc";
  /* Make a loop that will continue until
  no switching has been done: */
  while (switching) {
    // Start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /* Loop through all table rows (except the
    first, which contains table headers): */
    for (i = 1; i < (rows.length - 1); i++) {
      // Start by saying there should be no switching:
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /* Check if the two rows should switch place,
      based on the direction, asc or desc: */
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /* If a switch has been marked, make the switch
      and mark that a switch has been done: */
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      // Each time a switch is done, increase this count by 1:
      switchcount ++;
    } else {
      /* If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again. */
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>


<!-- Starting a new function here 12px 20px 12px 40px;-->

<script>
function searchable() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("Employee");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>


</body>
</html>