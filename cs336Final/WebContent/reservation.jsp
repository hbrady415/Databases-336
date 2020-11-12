<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Reservation Page</title>
	</head>
<body>

<h3> Reserve a ticket</h3>
<br>
	<form method="post" action="NewReservation.jsp">
	<table>
			<tr>
				<td>Station</td>
				<td><input type="text" name="Station"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
<br>

<br>
	<form method="get" action="reservationQuery.jsp">
		<select name="TransitLine" size=1>
			<option value="North East Corridor">North East Corridor</option>
			<option value="North Jersey Coast">North Jersey Coast</option>
			<option value="Pascack Valley">Pascack Valley</option>
			<option value="Bergen County">Bergen County</option>
			<option value="Montclair-Boonton">Montclair-Boonton</option>
			<option value="Morristown">Morristown</option>
			<option value="Raritan Valley">Raritan Valley</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>
<br>
<button onclick="goBack()">Go Back</button>
<script>
function goBack() {
  window.history.back();
}
</script>

</body>
</html>