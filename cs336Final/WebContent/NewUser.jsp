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

		String newUserName = request.getParameter("username");
		String newPassword = request.getParameter("password");
		String newFirstName = request.getParameter("firstName");
		String newLastName = request.getParameter("lastName");
		String newAddress = request.getParameter("Address");
		String newCity = request.getParameter("City");
		String newState = request.getParameter("State");
		String newZipcode = request.getParameter("Zipcode");
		String newTelephone = request.getParameter("Telephone");
		String newEmail = request.getParameter("Email");
		
		String insert = "INSERT INTO Login(username, password, firstName, lastName, Address, City, State, Zipcode, Telephone, Email)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, newUserName);
		ps.setString(2, newPassword);
		ps.setString(3, newFirstName);
		ps.setString(4, newLastName);
		ps.setString(5, newAddress);
		ps.setString(6, newCity);
		ps.setString(7, newState);
		ps.setString(8, newZipcode);
		ps.setString(9, newTelephone);
		ps.setString(10, newEmail);
		ps.executeUpdate();
		con.close();
		out.print("You have succesfully registered!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error! Could not registered user.");
		
	}
%>
<br>
<a href=userHomePage.jsp><button>Back to Home Page</button></a>

</body>
</html>