<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%
String TransitLine = request.getParameter("TransitLine");
String Origin=request.getParameter("Origin");
String Station=request.getParameter("Station");
String Stops=request.getParameter("Stops");
String ScheduleDate=request.getParameter("ScheduleDate");
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
String sql="Update TrainScheduleData set Status=? where TransitLine='"+ TransitLine +"' and Origin='"+ Origin +"' and Station='"+ Station +"' and Stops='"+ Stops +"' and ScheduleDate='"+ ScheduleDate +"'"; 
ps = con.prepareStatement(sql);
ps.setString(1, Status);
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
<a href=sendAlert.jsp><button>Back</button></a>