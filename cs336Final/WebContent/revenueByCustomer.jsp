<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

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
  width: 50%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 10px;
}

#User {
  border-collapse: collapse;
  width: 50%;
  border: 1px solid #ddd;
  font-size: 18px;
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

<h4>Revenue report per Customer:</h4>

<table id="User" border="1">
<tr>
<td>Customer Name</td>
<td>Revenue $$</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql = "select If(l.firstName IS NULL, r.username, concat(l.firstName,' ', l.lastName)) as CustomerName, Sum(TotalFare) as Revenue from Reservation r left outer join Login l on r.username = l.username Group By r.username order by Revenue desc";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("CustomerName") %></td>
<td><%=resultSet.getString("Revenue") %></td>
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