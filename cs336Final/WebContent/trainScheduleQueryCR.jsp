<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
//String username = (String) session.getAttribute("username");
String Origin = request.getParameter("Origin");
String fromStation = request.getParameter("fromStation");
String toStation = request.getParameter("toStation");
//String ScheduleDate = request.getParameter("ScheduleDate");

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

#User {
  border-collapse: collapse;
  width: 75%;
  border: 1px solid #ddd;
  font-size: 12px;
}

#User th, #User td {
  text-align: left;
  padding: 12px;
}

#User tr {
  border-bottom: 1px solid #ddd;
}

#User tr.header, #User tr:hover {
  background-color: #f1f1f1;
}

</style>
</head>

<body>
<h4>Train Schedule from <%=request.getParameter("fromStation") %> to <%=request.getParameter("toStation")%>: </h4>

			<table>
			<tr>
			<td><a href=reservationCR.jsp><button>Return to make a reservation page</button></a><td>
			</tr>
			</table>

<br>
<table id="User" border="1">
<tr>
<th onclick="sortTable(0)">Transit Line</th>
<th onclick="sortTable(1)">Departing From</th>
<th onclick="sortTable(2)">Arriving To</th>
<th onclick="sortTable(3)">Train Number</th>
<th onclick="sortTable(4)">From Station</th>
<th onclick="sortTable(5)">To Station</th>
<th onclick="sortTable(6)">Date of travel</th>
<th onclick="sortTable(7)">Travel Time</th>
<th onclick="sortTable(8)">Number of Stops</th>
<th onclick="sortTable(9)">Departure Time</th>
<th onclick="sortTable(10)">Arrival Time</th>
<th onclick="sortTable(11)">Fare</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);

statement=connection.createStatement();

String sql = "SELECT t1.TransitLine, t1.Origin, t1.Destination, t1.Train, t1.Station, "

			+ "t2.Station, t1.ScheduleDate, (t1.TravelTime - t2.TravelTime), (t1.Stops - t2.Stops), "
			
			+ "t1.DepartureTime, t2.ArrivalTime, (t1.Fare - t2.Fare) "
			
			+ "FROM TrainScheduleData t1 INNER JOIN TrainScheduleData t2 ON t1.ScheduleDate = t2.ScheduleDate"
		
			+ " and t1.Train = t2.Train and t1.Origin = t2.Origin and t1.Destination = t2.Destination "
			
			+ "WHERE t1.Origin ='"+ Origin +"' and t1.Station='"+ fromStation +"'and t2.Station='"+ toStation +"' Order by t1.ScheduleDate asc";
			
			//+ " and t1.ScheduleDate='"+ ScheduleDate +"'";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("t1.TransitLine") %></td>
<td><%=resultSet.getString("t1.Origin") %></td>
<td><%=resultSet.getString("t1.Destination") %></td>
<td><%=resultSet.getString("t1.Train") %></td>
<td><%=resultSet.getString("t1.Station") %></td>
<td><%=resultSet.getString("t2.Station") %></td>
<td><%=resultSet.getString("t1.ScheduleDate") %></td>
<td><%=resultSet.getString("(t1.TravelTime - t2.TravelTime)") %></td>
<td><%=resultSet.getString("(t1.Stops - t2.Stops)") %></td>
<td><%=resultSet.getString("t1.DepartureTime") %></td>
<td><%=resultSet.getString("t2.ArrivalTime") %></td>
<td><%=resultSet.getString("(t1.Fare - t2.Fare)") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>
<br>
<a href=trainScheduleCR.jsp><button>Back</button></a>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("User");
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
  table = document.getElementById("User");
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