<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%
String TransitLine = request.getParameter("TransitLine");
String Station=request.getParameter("Station");
String Origin=request.getParameter("Origin");
String Destination=request.getParameter("Destination");
String Train=request.getParameter("Train");
String TravelTime=request.getParameter("TravelTime");
String Stops=request.getParameter("Stops");
String ScheduleDate=request.getParameter("ScheduleDate");
String DepartureTime=request.getParameter("DepartureTime");
String ArrivalTime=request.getParameter("ArrivalTime");
String Fare=request.getParameter("Fare");
String AvailableSeats=request.getParameter("AvailableSeats");
String Status=request.getParameter("Status");


if(Status != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(username); //This is how to parse Strings to Integers
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);

String sql="Insert into TrainScheduleData (TransitLine, Station, Origin, Destination, Train, TravelTime, Stops, ScheduleDate, DepartureTime, ArrivalTime, Fare, AvailableSeats, Status) values (?,?,?,?,?,?,?,?,?,?,?,?,?)"; 

ps = con.prepareStatement(sql);
ps.setString(1, TransitLine);
ps.setString(2, Station);
ps.setString(3, Origin);
ps.setString(4, Destination);
ps.setString(5, Train);
ps.setString(6, TravelTime);
ps.setString(7, Stops);
ps.setString(8, ScheduleDate);
ps.setString(9, DepartureTime);
ps.setString(10, ArrivalTime);
ps.setString(11, Fare);
ps.setString(12, AvailableSeats);
ps.setString(13, Status);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("New Route Schedule has been added succesfully! ");
}
else
{
out.print("Could not update the status of this route. Please try again.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<a href=addTrainSchedule.jsp><button>Back</button></a>