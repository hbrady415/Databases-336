<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%
String TransitLine = request.getParameter("TransitLine");
String TransitLine2 = request.getParameter("TransitLine2");
String Station=request.getParameter("Station");
String Station2=request.getParameter("Station2");
String Origin=request.getParameter("Origin");
String Origin2=request.getParameter("Origin2");
String Destination=request.getParameter("Destination");
String Train=request.getParameter("Train");
String TravelTime=request.getParameter("TravelTime");
String Stops=request.getParameter("Stops");
String Stops2=request.getParameter("Stops2");
String ScheduleDate=request.getParameter("ScheduleDate");
String ScheduleDate2=request.getParameter("ScheduleDate2");
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
String sql="Update TrainScheduleData set TransitLine=?, Station=?, Origin=?, Destination=?, Train=?, TravelTime=?, Stops=?, ScheduleDate=?, DepartureTime=?, ArrivalTime=?, Fare=?, AvailableSeats=?, Status=? where TransitLine='"+ TransitLine2 +"' and Origin='"+ Origin2 +"' and Station='"+ Station2 +"' and Stops='"+ Stops2 +"' and ScheduleDate='"+ ScheduleDate2 +"'"; 
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
out.print("Route Status has been updated successfully! ");
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
<a href=updateTrainSchedule.jsp><button>Back</button></a>