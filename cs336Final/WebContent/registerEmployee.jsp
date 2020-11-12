<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration Page</title>
	</head>
<body>

<h4> Please fill up employee registration form</h4>
<br>
	<form method="post" action="NewEmployee.jsp">
	<table>
			<tr>
				<td>First name</td>
				<td><input type="text" name="FirstName"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="LastName"></td>
			</tr>
			<tr>
				<td>SSN</td>
				<td><input type="text" name="SSN"></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Register"></td>
			</tr>
		</table>
	</form>
<br>		
			<table>
			<tr>
			<td><a href=employeeIndex.jsp><button>Cancel</button></a><td>
			</tr>
			</table>
</body>
</html>