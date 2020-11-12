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

<h4>Delete a whole train schedule:</h4>
<form method="get" action="deleteSchedule.jsp">
	<table>
	<tr>
	<td>Transit Line:</td>
	        <td><select name="TransitLine" size=1>
	        <option value="North East Corridor">North East Corridor</option>
	        <option value="North Jersey Coast">North Jersey Coast</option>
	        <option value="Main Line">Main Line</option></select></td>
			</tr>
			
	<tr>
	<td>Origin:</td>
	        <td><select name="Origin" size=1> 
	    	<option disabled> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Hoboken">Hoboken</option></select></td>
			</tr>
	<tr>
	<td>Date of Travel:</td>
	        <td><select name="ScheduleDate" size=1>
			<option value="2020-05-01">2020-05-01</option>
			<option value="2020-05-02">2020-05-02</option>
			<option value="2020-05-03">2020-05-03</option>
			<option value="2020-05-04">2020-05-04</option>
			</select></td>
			</tr>	

				
	<tr>
			<td></td>
			<td><input type="submit" value="Update"></td>
			</tr>
	</table>
	</form>

<br>
<h4>Train schedule status updates: </h4>

	<form method="get" action="alertUpdateCheck.jsp">
	<table>
	<tr>
	<td>Transit Line:</td>
	        <td><select name="TransitLine" size=1>
	        <option value="North East Corridor">North East Corridor</option>
	        <option value="North Jersey Coast">North Jersey Coast</option>
	        <option value="Main Line">Main Line</option></select></td>
			</tr>
			
	<tr>
	<td>Origin:</td>
	        <td><select name="Origin" size=1>
	        <option disabled> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Hoboken">Hoboken</option></select></td>
			</tr>
			
	
	<tr>
	<td>Date of Travel:</td>
	        <td><select name="ScheduleDate" size=1>
			<option value="2020-05-01">2020-05-01</option>
			<option value="2020-05-02">2020-05-02</option>
			<option value="2020-05-03">2020-05-03</option>
			<option value="2020-05-04">2020-05-04</option>
			</select></td>
			</tr>	
	<tr>
			<td></td>
			<td><input type="submit" value="Check"></td>
			</tr>
	</table>
	</form>

<br>
<table>
<tr>
<td><a href=CustomerRepPage.jsp><button>Back</button></a><td>
</tr>
</table>
</body>
</html>