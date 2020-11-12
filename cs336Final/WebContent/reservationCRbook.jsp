<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

//String newUserName = (String) session.getAttribute("username");

String Origin = request.getParameter("Origin");
String fromStation = request.getParameter("fromStation");
String toStation = request.getParameter("toStation");
String ScheduleDate = request.getParameter("ScheduleDate");

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

String sql = "SELECT t1.TransitLine, t1.Origin, t1.Destination, t1.Train, t1.Station, "

			+ "t2.Station, t1.ScheduleDate, (t1.TravelTime - t2.TravelTime), (t1.Stops - t2.Stops), "
			
			+ "t1.DepartureTime, t2.ArrivalTime, (t1.Fare - t2.Fare) "
			
			+ "FROM TrainScheduleData t1 INNER JOIN TrainScheduleData t2 ON t1.ScheduleDate = t2.ScheduleDate"
		
			+ " and t1.Train = t2.Train and t1.Origin = t2.Origin and t1.Destination = t2.Destination "
			
			+ "WHERE t1.Origin ='"+ Origin +"' and t1.Station='"+ fromStation +"' and t2.Station='"+ toStation +"' "
			
			+ " and t1.ScheduleDate='"+ ScheduleDate +"'";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h4>Make a reservation for a customer</h4>

<form method="post" action="reservationCRbookUpdate.jsp">
<table>
<tr>
<td>Passenger:</td>
<td><input type="text" name="passanger"></td>
</tr>
<tr>
<td>Transit Line:</td>
<td><input type="text" name="TransitLine" value="<%=resultSet.getString("t1.TransitLine") %>" readonly></td>
</tr>
<tr>
<td>Departing From:</td>
<td><input type="text" name="DepartingFrom" value="<%=resultSet.getString("t1.Origin") %>" readonly></td>
</tr>
<tr>
<td>Arriving To:</td>
<td><input type="text" name="ArrivingTo" value="<%=resultSet.getString("t1.Destination") %>" readonly></td>
</tr>
<tr>
<td>Train Number:</td>
<td><input type="text" name="TrainNumber" value="<%=resultSet.getString("t1.Train") %>" readonly></td>
</tr>
<tr>
<td>From Station:</td>
<td><input type="text" name="fromStation" value="<%=resultSet.getString("t1.Station") %>" readonly></td>
</tr>
<tr>
<td>To Station:</td>
<td><input type="text" name="toStation" value="<%=resultSet.getString("t2.Station") %>" readonly></td>
</tr>
<tr>
<td>Travel Date:</td>
<td><input type="text" name="ScheduleDate" value="<%=resultSet.getString("t1.ScheduleDate") %>" readonly></td>
</tr>
<tr>
<td>Travel Time:</td>
<td><input type="text" name="travelTime" value="<%=resultSet.getString("(t1.TravelTime - t2.TravelTime)") %>" readonly></td>
</tr>
<tr>
<td>Number of Stops:</td>
<td><input type="text" name="Stops" value="<%=resultSet.getString("(t1.Stops - t2.Stops)") %>" readonly></td>
</tr>
<tr>
<td>Departure Time:</td>
<td><input type="text" name="DepartureTime" value="<%=resultSet.getString("t1.DepartureTime") %>" readonly></td>
</tr>
<tr>
<td>Arrival Time:</td>
<td><input type="text" name="ArrivalTime" value="<%=resultSet.getString("t2.ArrivalTime") %>" readonly></td>
</tr>

<tr>
	<td>Class:</td>
	        <td><select name="Class" size=1>
	        <option value="Economy">Economy</option>
			<option value="Business">Business</option>
			<option value="First">First</option>
			</select></td>
			</tr>	
			
<tr>
	<td>Adults:</td>
	        <td><select name="Adults" size=1>
	        <option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			</select></td>
			</tr>	
<tr>
	<td>Children/Seniors/Disabled:</td>
	        <td><select name="Special" size=1>
	        <option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			</select></td>
			</tr>	
			
<tr>
<td>Fare:</td>
<td><input type="text" name="Fare" value="<%=resultSet.getString("(t1.Fare - t2.Fare)") %>" readonly></td>
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
<td><input type="submit" value="Make reservation"></td>
</tr>
</table>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<a href=reservationCR.jsp><button>Back</button></a>
</body>
</html>