<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String reservationID = request.getParameter("reservationID");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Reservation where reservationID='"+ reservationID +"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h4>Customer reservation update form</h4>

<form method="post" action="reservationUpdateProcess.jsp">
<table>
<tr>
<td>Reservation ID:</td>
<td><input type="text" name="reservationID" value="<%=resultSet.getString("reservationID") %>"></td>
</tr>
<tr>
<td>Passenger:</td>
<td><input type="text" name="username" value="<%=resultSet.getString("username") %>"></td>
</tr>
<tr>
<td>Transit Line:</td>
<td><input type="text" name="TransitLine" value="<%=resultSet.getString("TransitLine") %>"></td>
</tr>
<tr>
<td>Departing From:</td>
<td><input type="text" name="DepartingFrom" value="<%=resultSet.getString("DepartingFrom") %>"></td>
</tr>
<tr>
<td>Arriving To:</td>
<td><input type="text" name="ArrivingTo" value="<%=resultSet.getString("ArrivingTo") %>"></td>
</tr>
<tr>
<td>Train Number:</td>
<td><input type="text" name="TrainNumber" value="<%=resultSet.getString("TrainNumber") %>"></td>
</tr>
<tr>
<td>From Station:</td>
<td><input type="text" name="fromStation" value="<%=resultSet.getString("fromStation") %>"></td>
</tr>
<tr>
<td>To Station:</td>
<td><input type="text" name="toStation" value="<%=resultSet.getString("toStation") %>"></td>
</tr>
<tr>
<td>Travel Date:</td>
<td><input type="text" name="ScheduleDate" value="<%=resultSet.getString("ScheduleDate") %>"></td>
</tr>
<tr>
<td>Travel Time:</td>
<td><input type="text" name="travelTime" value="<%=resultSet.getString("travelTime") %>"></td>
</tr>
<tr>
<td>Number of Stops:</td>
<td><input type="text" name="Stops" value="<%=resultSet.getString("Stops") %>"></td>
</tr>
<tr>
<td>Departure Time:</td>
<td><input type="text" name="DepartureTime" value="<%=resultSet.getString("DepartureTime") %>"></td>
</tr>
<tr>
<td>Arrival Time:</td>
<td><input type="text" name="ArrivalTime" value="<%=resultSet.getString("ArrivalTime") %>"></td>
</tr>

<tr>
<td>Class:</td>
<td><input type="text" name="Class" value="<%=resultSet.getString("Class") %>"></td>
</tr>
<tr>
<td>Passenger:</td>
<td><input type="text" name="Adults" value="<%=resultSet.getString("Adults") %>"></td>
</tr>
<tr>
<td>Reduced Fare Passenger:</td>
<td><input type="text" name="Special" value="<%=resultSet.getString("Special") %>"></td>
</tr>
<tr>
<td>Fare:</td>
<td><input type="text" name="Fare" value="<%=resultSet.getString("Fare") %>"></td>
</tr>
<tr>
	<td>TicketType:</td>
	        <td><select name="TicketType" size=1>
	        <option value="One Way">One Way</option>
			<option value="Round Trip">Round Trip</option>
			<option value="Weekly">Weekly</option>
			<option value="Monthly">Monthly</option>
			</select></td>
			</tr>
<tr>
<td></td>
<td><input type="submit" value="Update reservation"></td>
</tr>
</table>
</form>
<table>
<tr>
<td><a href=manageReservations.jsp><button>Back</button></a><td>
</tr>
</table>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>