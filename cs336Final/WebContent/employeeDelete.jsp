<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String FirstName=request.getParameter("FirstName");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema", "CS336Group21", "CS336Group21DatabaseUser");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM Employee WHERE FirstName='"+ FirstName +"'");
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<br>
<br>
<a href=employeeIndex.jsp><button>Back to user list</button></a>