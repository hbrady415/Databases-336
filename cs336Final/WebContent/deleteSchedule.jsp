<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String TransitLine = request.getParameter("TransitLine");
String Origin=request.getParameter("Origin");
String ScheduleDate=request.getParameter("ScheduleDate");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema", "CS336Group21", "CS336Group21DatabaseUser");
Statement st=conn.createStatement();
int i=st.executeUpdate("Delete from TrainScheduleData where TransitLine='"+ TransitLine +"' and Origin='"+ Origin +"'  and ScheduleDate='"+ ScheduleDate +"'");

out.println("Train Schedule Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<a href=searchTrainSchedule.jsp><button>Back</button></a>