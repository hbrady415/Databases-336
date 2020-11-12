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

		String newUserName = (String) session.getAttribute("username");
		//String newUserName = request.getParameter("username");
		String newQuestion = request.getParameter("question");
		
		String insert = "INSERT INTO Messaging(username, question)"
				+ "VALUES (?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, newUserName);
		ps.setString(2, newQuestion);
		ps.executeUpdate();
		con.close();
		out.print("Your question has been succesfully submitted. A customer representative will get back to you shortly!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error! We were not able to submit your question. Please try again.");
		
	}
%>
<br>
<a href=checkAnswer.jsp><button>Back</button></a>

</body>
</html>