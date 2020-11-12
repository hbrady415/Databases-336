<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make a Reservation</title>
</head>
<body>
	<%
	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema", "CS336Group21", "CS336Group21DatabaseUser");

		Statement stmt = con.createStatement();
		
		String newUserName = (String) session.getAttribute("username");
		String newStation = request.getParameter("Station");
		
		String insert = "INSERT INTO Reservation(Station, username)"
				+ "VALUES (?, ?)";

		
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, newStation);
		ps.setString(2, newUserName);
		ps.executeUpdate();
		out.print("Your Reservation has been created.");
		out.print("\n");
		int id=0;
		ResultSet rs=stmt.executeQuery("select * from Reservation");
		if(rs.last()){
		id=rs.getInt("reservationID");
		}
		out.println("Your reservation number is: "+id);
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error! Could not create reservation.");
		
	}
%>
<br>
<br>
<a href=userHomePage.jsp><button>Back</button></a>

</body>
</html>