<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%

String FirstName2=request.getParameter("FirstName2");
String FirstName=request.getParameter("FirstName");
String LastName=request.getParameter("LastName");
String SSN=request.getParameter("SSN");
String username=request.getParameter("username");
String password=request.getParameter("password");


if(FirstName != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(username); //This is how to parse Strings to Integers
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Employee set FirstName=?, LastName=?, SSN=?, username=?, password=?  where FirstName='"+ FirstName2 +"'"; //You will need quotes here
ps = con.prepareStatement(sql);
ps.setString(1,FirstName);
ps.setString(2, LastName);
ps.setString(3, SSN);
ps.setString(4, username);
ps.setString(5, password);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Employee information updated sucessfully!");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<a href=employeeIndex.jsp><button>Back to employee list</button></a>