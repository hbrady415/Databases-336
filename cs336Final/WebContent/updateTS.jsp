<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String TransitLine = request.getParameter("TransitLine");
String Origin=request.getParameter("Origin");
String Station=request.getParameter("Station");
String Stops=request.getParameter("Stops");
String ScheduleDate=request.getParameter("ScheduleDate");


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
String sql ="SELECT TransitLine, Station, Origin, Destination, Train, TravelTime,  AvailableSeats, Stops, "

			+ "ScheduleDate, "
			
			+ "DepartureTime, ArrivalTime, Fare, Status "
			
			+ "FROM TrainScheduleData "
			
  			+ "WHERE TransitLine ='"+ TransitLine +"' and Origin='"+ Origin +"' and Station='"+ Station +"' and Stops='"+ Stops +"' and ScheduleDate='"+ ScheduleDate +"' ";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h4>Train Schedule Route Update form</h4>

<form method="post" action="updateTSProcess.jsp">
<table>
<tr>
<td>Transit Line:</td>
<td><input type="text" name="TransitLine" value="<%=resultSet.getString("TransitLine") %>"></td>
<td><input type="hidden" name="TransitLine2" value="<%=resultSet.getString("TransitLine") %>"></td>
</tr>
<tr>
<td>Station:</td>
<td><input type="text" name="Station" value="<%=resultSet.getString("Station") %>"></td>
<td><input type="hidden" name="Station2" value="<%=resultSet.getString("Station") %>"></td>
</tr>
<tr>
<td>Origin:</td>
<td><input type="text" name="Origin" value="<%=resultSet.getString("Origin") %>"></td>
<td><input type="hidden" name="Origin2" value="<%=resultSet.getString("Origin") %>"></td>
</tr>
<tr>
<td>Destination:</td>
<td><input type="text" name="Destination" value="<%=resultSet.getString("Destination") %>"></td>
</tr>
<tr>
<td>Train:</td>
<td><input type="text" name="Train" value="<%=resultSet.getString("Train") %>"></td>
</tr>
<tr>
<td>Travel Time:</td>
<td><input type="text" name="TravelTime" value="<%=resultSet.getString("TravelTime") %>"></td>
</tr>
<tr>
<td>Stops:</td>
<td><input type="text" name="Stops" value="<%=resultSet.getString("Stops") %>"></td>
<td><input type="hidden" name="Stops2" value="<%=resultSet.getString("Stops") %>"></td>
</tr>
<tr>
<td>Travel Date:</td>
<td><input type="text" name="ScheduleDate" value="<%=resultSet.getString("ScheduleDate") %>"></td>
<td><input type="hidden" name="ScheduleDate2" value="<%=resultSet.getString("ScheduleDate") %>"></td>
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
<td>Fare:</td>
<td><input type="text" name="Fare" value="<%=resultSet.getString("Fare") %>"></td>
</tr>
<tr>
<td>Available Seats:</td>
<td><input type="text" name="AvailableSeats" value="<%=resultSet.getString("AvailableSeats") %>"></td>
</tr>
<tr>
<td>Status:</td>
<td><input type="text" name="Status" value="<%=resultSet.getString("Status") %>"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Update reservation"></td>
</tr>
</table>
</form>
<table>
<tr>
<td><a href=updateTrainSchedule.jsp><button>Back</button></a><td>
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