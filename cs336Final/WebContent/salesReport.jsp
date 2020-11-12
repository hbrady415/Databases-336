<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%


String month = request.getParameter("month");
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

<h4>Sales report for the month of <%=request.getParameter("month") %></h4>

<table id="User" border="1">
<tr>
<td>Month</td>
<td>Reservations</td>
<td>Revenue $$</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql = "select monthname(ScheduleDate) as month, Count(reservationID), Sum(TotalFare) from Reservation group by month Having month='"+ month +"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("month") %></td>
<td><%=resultSet.getString("Count(reservationID)") %></td>
<td><%=resultSet.getString("Sum(TotalFare)") %></td>
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
<a href=managerPage.jsp><button>Back</button></a>

</body>
</html>