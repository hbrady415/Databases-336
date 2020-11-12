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
	<form method="post" action="NewQuestion.jsp">
	<table>
			<tr>
				<td>Question</td>
				<td><input type="text" name="question"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
<br>		
		
<a href=checkAnswer.jsp><button>Cancel</button></a>
			
</body>
</html>