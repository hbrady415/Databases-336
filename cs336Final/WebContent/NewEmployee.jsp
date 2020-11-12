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

		
		String newFirstName = request.getParameter("FirstName");
		String newLastName = request.getParameter("LastName");
		String newSSN = request.getParameter("SSN");
		String newUsername = request.getParameter("username");
		String newPassword = request.getParameter("password");

		
		String insert = "INSERT INTO Employee(FirstName, LastName, SSN, username, password)"
				+ "VALUES (?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, newFirstName);
		ps.setString(2, newLastName);
		ps.setString(3, newSSN);
		ps.setString(4, newUsername);
		ps.setString(5, newPassword);
		ps.executeUpdate();
		con.close();
		out.print("You have succesfully registered a new employee!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error! Could not registered new employee.");
		
	}
%>
<br>
<br>
<a href=employeeIndex.jsp><button>Back to employee list</button></a>

</body>
</html>