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

<h3> Please fill up registration form</h3>
<br>
	<form method="post" action="NewUser.jsp">
	<table>
			<tr>
				<td>User Name</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName"></td>
			</tr>
			<tr>
				<td> Last Name</td>
				<td><input type="text" name="lastName"></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="Address"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="City"></td>
			</tr>
			<tr>
				<td>State</td>
				<td><input type="text" name="State"></td>
			</tr>
			<tr>
				<td>Zip Code</td>
				<td><input type="text" name="Zipcode"></td>
			</tr>
			<tr>
				<td>Telephone</td>
				<td><input type="text" name="Telephone"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="Email"></td>
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
			<td><a href=login.jsp><button>Cancel</button></a><td>
			</tr>
			</table>
</body>
</html>