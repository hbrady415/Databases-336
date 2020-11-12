<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login Page</title>
</head>
<body>
	<%
	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema", "CS336Group21", "CS336Group21DatabaseUser");
		Statement stmt = con.createStatement();
		String username = (String) session.getAttribute("username");
		String reservation = request.getParameter("reservationID");
		
		String cancel = "DELETE FROM Reservation WHERE reservationID = ? and username='"+ username +"'";		
		
		PreparedStatement ps = con.prepareStatement(cancel);
		ps.setString(1, reservation);
		int i = ps.executeUpdate();
		if(i > 0)
		{%>
		<%
		out.print("Record Deleted Successfully");
		%>
		<% 
		}
		else
		{%>
		<%
		out.println("There is a problem in Deleting reservation number: " + reservation + " for user: " + username);
		%>
		<br>
		<br>
		<% 
		out.print("Make sure that you are entering the correct reservation number.");
		} %>
		<%
		
		con.close();
		//out.print("You have succesfully canceled reservation number: " + reservation);
		
	} catch (Exception ex) {
		String reservation = request.getParameter("reservationID");
		out.print(ex);
		out.print("Error, we were not able to cancel reservation number: " + reservation);
		
	}
%>
<br>
<br>
<a href=cancelation.jsp><button>Back</button></a>

</body>
</html>