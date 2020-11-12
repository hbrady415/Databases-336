<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%
String username = request.getParameter("username");
String questionID=request.getParameter("questionID");
String question=request.getParameter("question");
String answer=request.getParameter("answer");


if(username != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(username); //This is how to parse Strings to Integers
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Messaging set username=?,questionID=?,question=?,answer=? where questionID='"+ questionID +"'"; //You will need quotes here
ps = con.prepareStatement(sql);
ps.setString(1,username);
ps.setString(2, questionID);
ps.setString(3, question);
ps.setString(4, answer);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
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
<a href=answerIndex.jsp><button>Back to question list</button></a>