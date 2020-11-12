<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%
String username = request.getParameter("username");
String username2 = request.getParameter("username2");
String password = request.getParameter("password");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String Address = request.getParameter("Address");
String City=request.getParameter("City");
String State = request.getParameter("State");
String Zipcode = request.getParameter("Zipcode");
String Telephone = request.getParameter("Telephone");
String Email=request.getParameter("Email");

if(username != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(username); //This is how to parse Strings to Integers
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Login set username=?, password=?,firstName=?,lastName=?, Address=?, City=?, State=?, Zipcode=?, Telephone=?, Email=? where username='"+ username2 +"'"; //You will need quotes here
ps = con.prepareStatement(sql);
ps.setString(1, username);
ps.setString(2, password);
ps.setString(3, firstName);
ps.setString(4, lastName);
ps.setString(5, Address);
ps.setString(6, City);
ps.setString(7, State);
ps.setString(8, Zipcode);
ps.setString(9, Telephone);
ps.setString(10, Email);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Customer information updated successfully!");
}
else
{
out.print("There is a problem in updating this user.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<a href=userIndex.jsp><button>Back</button></a>