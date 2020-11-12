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
<p>*** An alert will be sent to all customers whose routes are affected by these updates ***</p>


<h4>Update a whole route</h4>
<form method="get" action="allRouteCancelation.jsp">
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
	<td>To Status:</td>
	        <td><select name="Status" size=1>
			<option value="On Time">On Time</option>
			<option value="Delayed">Delayed</option>
			<option value="Canceled">Canceled</option>
			</select></td>
			</tr>	
				
	<tr>
			<td></td>
			<td><input type="submit" value="Update"></td>
			</tr>
	</table>
	</form>
	

<h4>Update status for Downtown routes</h4>

	<form method="get" action="alertUpdate.jsp">
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
			<option value="New York Penn">New York Penn</option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="New York Penn">New York Penn</option>
			<option disabled> -- Main Line -- </option>
			<option value="Hoboken">Hoboken</option></select></td>
			</tr>
			
	<tr>
	<td>For Station:</td>
	        <td><select name="Station" size=1>
	        <option disabled> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="Hamilton">Hamilton</option>
			<option value="Princeton Junction">Princeton Junction</option>
			<option value="Jersey Avenue">Jersey Avenue</option>
			<option value="New Brunswick">New Brunswick</option>
			<option value="Edison">Edison</option>
			<option value="Metuchen">Metuchen</option>
			<option value="Rahway">Rahway</option>
			<option value="Linden">Linden</option>
			<option value="Elizabeth">Elizabeth</option>
			<option value="North Elizabeth">North Elizabeth</option>
			<option value="Newark Intl. Airport">Newark Intl. Airport</option>
			<option value="Newark Penn Station">Newark Penn Station</option>
			<option value="Secaucus Junction">Secaucus Junction</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="Bay Head ">Bay Head</option>
			<option value="Point Pleasant Beach">Point Pleasant Beach</option>
			<option value="Manasquan">Manasquan</option>
			<option value="Spring Lake">Spring Lake</option>
			<option value="Belmar">Belmar</option>
			<option value="Bradley Beach">Bradley Beach</option>
			<option value="Asbury Park">Asbury Park</option>
			<option value="Allenhurst">Allenhurst</option>
			<option value="Elberon">Elberon</option>
			<option value="Long Branch">Long Branch</option>
			<option value="Monmouth Park">Monmouth Park</option>
			<option value="Little Silver">Little Silver</option>
			<option value="Red Bank">Red Bank</option>
			<option value="Middletown">Middletown</option>
			<option value="Hazlet">Hazlet</option>
			<option value="Aberdeen-Matawan">Aberdeen-Matawan</option>
			<option value="South Amboy">South Amboy</option>
			<option value="Perth Amboy">Perth Amboy</option>
			<option value="Woodbridge">Woodbridge</option>
			<option value="Avenel">Avenel</option>
			<option value="Rahway">Rahway</option>
			<option value="Linden">Linden</option>
			<option value="Elizabeth">Elizabeth</option>
			<option value="North Elizabeth">North Elizabeth</option>
			<option value="Newark Int'l Airport">Newark Int'l Airport</option>
			<option value="Newark Penn Station">Newark Penn Station</option>
			<option value="Secaucus Junction">Secaucus Junction</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Mahwah">Mahwah</option>
			<option value="Route 17">Route 17</option>
			<option value="Ramsey">Ramsey</option>
			<option value="Allendale">Allendale</option>
			<option value="Waldwick">Waldwick</option>
			<option value="Ho-Ho-Kus">Ho-Ho-Kus</option>
			<option value="Ridgewood">Ridgewood</option>
			<option value="Glen Rock - Main Line">Glen Rock - Main Line</option>
			<option value="Hawthorne">Hawthorne</option>
			<option value="Paterson">Paterson</option>
			<option value="Clifton">Clifton</option>
			<option value="Passaic">Passaic</option>
			<option value="Orange">Orange</option>
			<option value="Delawanna">Delawanna</option>
			<option value="Lyndhurst">Lyndhurst</option>
			<option value="Kingsland">Kingsland</option>
			<option value="Secaucus Junction">Secaucus Junction</option>
			<option value="Hoboken">Hoboken</option>
			</select></td>
			</tr>
	
	<tr>
	<td>For Stop:</td>
	         <td><select name="Stops" size=1>
	         
	         
			<option disabled> -- North East Corridor -- </option>
			<option value="0">Trenton</option>
			<option value="1">Hamilton</option>
			<option value="2">Princeton Junction</option>
			<option value="3">Jersey Avenue</option>
			<option value="4">New Brunswick</option>
			<option value="5">Edison</option>
			<option value="6">Metuchen</option>
			<option value="7">MetroPark</option>
			<option value="8">Rahway</option>
			<option value="9">Linden</option>
			<option value="10">Elizabeth</option>
			<option value="11">North Elizabeth</option>
			<option value="12">Newark Intl. Airport</option>
			<option value="13">Newark Penn Station</option>
			<option value="14">Secaucus Junction</option>
			<option value="15">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="0 ">Bay Head</option>
			<option value="1">Point Pleasant Beach</option>
			<option value="2">Manasquan</option>
			<option value="3">Spring Lake</option>
			<option value="4">Belmar</option>
			<option value="5">Bradley Beach</option>
			<option value="6">Asbury Park</option>
			<option value="7">Allenhurst</option>
			<option value="8">Elberon</option>
			<option value="9">Long Branch</option>
			<option value="10">Monmouth Park</option>
			<option value="11">Little Silver</option>
			<option value="12">Red Bank</option>
			<option value="13">Middletown</option>
			<option value="14">Hazlet</option>
			<option value="15">Aberdeen-Matawan</option>
			<option value="16">South Amboy</option>
			<option value="17">Perth Amboy</option>
			<option value="18">Woodbridge</option>
			<option value="19">Avenel</option>
			<option value="20">Rahway</option>
			<option value="21">Linden</option>
			<option value="22">Elizabeth</option>
			<option value="23">North Elizabeth</option>
			<option value="24">Newark Int'l Airport</option>
			<option value="25">Newark Penn Station</option>
			<option value="26">Secaucus Junction</option>
			<option value="27">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- Main Line -- </option>
			<option value="0">Suffern</option>
			<option value="1">Mahwah</option>
			<option value="2">Route 17</option>
			<option value="3">Ramsey</option>
			<option value="4">Allendale</option>
			<option value="5">Waldwick</option>
			<option value="6">Ho-Ho-Kus</option>
			<option value="7">Ridgewood</option>
			<option value="8">Glen Rock - Main Line</option>
			<option value="9">Hawthorne</option>
			<option value="10">Paterson</option>
			<option value="11">Clifton</option>
			<option value="12">Passaic</option>
			<option value="13">Delawanna</option>
			<option value="14">Lyndhurst</option>
			<option value="15">Kingsland</option>
			<option value="16">Secaucus Junction</option>
			<option value="17">Hoboken</option>
			</select></td>
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
	<td>To Status:</td>
	        <td><select name="Status" size=1>
			<option value="On Time">On Time</option>
			<option value="Delayed">Delayed</option>
			<option value="Canceled">Canceled</option>
			</select></td>
			</tr>	
				
	<tr>
			<td></td>
			<td><input type="submit" value="Update"></td>
			</tr>
	</table>
	</form>



<h4>Update status for Uptown routes</h4>

	<form method="get" action="alertUpdate.jsp">
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
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
			<option disabled> -- Main Line -- </option>
			<option value="Suffern">Suffern</option></select></td>
			</tr>
			

	<tr>
	<td>For Station:</td>
	        <td><select name="Station" size=1>
	        <option disabled> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="Hamilton">Hamilton</option>
			<option value="Princeton Junction">Princeton Junction</option>
			<option value="Jersey Avenue">Jersey Avenue</option>
			<option value="New Brunswick">New Brunswick</option>
			<option value="Edison">Edison</option>
			<option value="Metuchen">Metuchen</option>
			<option value="Rahway">Rahway</option>
			<option value="Linden">Linden</option>
			<option value="Elizabeth">Elizabeth</option>
			<option value="North Elizabeth">North Elizabeth</option>
			<option value="Newark Intl. Airport">Newark Intl. Airport</option>
			<option value="Newark Penn Station">Newark Penn Station</option>
			<option value="Secaucus Junction">Secaucus Junction</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="Bay Head ">Bay Head</option>
			<option value="Point Pleasant Beach">Point Pleasant Beach</option>
			<option value="Manasquan">Manasquan</option>
			<option value="Spring Lake">Spring Lake</option>
			<option value="Belmar">Belmar</option>
			<option value="Bradley Beach">Bradley Beach</option>
			<option value="Asbury Park">Asbury Park</option>
			<option value="Allenhurst">Allenhurst</option>
			<option value="Elberon">Elberon</option>
			<option value="Long Branch">Long Branch</option>
			<option value="Monmouth Park">Monmouth Park</option>
			<option value="Little Silver">Little Silver</option>
			<option value="Red Bank">Red Bank</option>
			<option value="Middletown">Middletown</option>
			<option value="Hazlet">Hazlet</option>
			<option value="Aberdeen-Matawan">Aberdeen-Matawan</option>
			<option value="South Amboy">South Amboy</option>
			<option value="Perth Amboy">Perth Amboy</option>
			<option value="Woodbridge">Woodbridge</option>
			<option value="Avenel">Avenel</option>
			<option value="Rahway">Rahway</option>
			<option value="Linden">Linden</option>
			<option value="Elizabeth">Elizabeth</option>
			<option value="North Elizabeth">North Elizabeth</option>
			<option value="Newark Int'l Airport">Newark Int'l Airport</option>
			<option value="Newark Penn Station">Newark Penn Station</option>
			<option value="Secaucus Junction">Secaucus Junction</option>
			<option value="New York Penn">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Mahwah">Mahwah</option>
			<option value="Route 17">Route 17</option>
			<option value="Ramsey">Ramsey</option>
			<option value="Allendale">Allendale</option>
			<option value="Waldwick">Waldwick</option>
			<option value="Ho-Ho-Kus">Ho-Ho-Kus</option>
			<option value="Ridgewood">Ridgewood</option>
			<option value="Glen Rock - Main Line">Glen Rock - Main Line</option>
			<option value="Hawthorne">Hawthorne</option>
			<option value="Paterson">Paterson</option>
			<option value="Clifton">Clifton</option>
			<option value="Passaic">Passaic</option>
			<option value="Orange">Orange</option>
			<option value="Delawanna">Delawanna</option>
			<option value="Lyndhurst">Lyndhurst</option>
			<option value="Kingsland">Kingsland</option>
			<option value="Secaucus Junction">Secaucus Junction</option>
			<option value="Hoboken">Hoboken</option>
			</select></td>
			</tr>
	
	<tr>
	<td>For Stop:</td>
	         <td><select name="Stops" size=1>
	         
	         
			<option disabled> -- North East Corridor -- </option>
			<option value="15">Trenton</option>
			<option value="14">Hamilton</option>
			<option value="13">Princeton Junction</option>
			<option value="12">Jersey Avenue</option>
			<option value="11">New Brunswick</option>
			<option value="10">Edison</option>
			<option value="9">Metuchen</option>
			<option value="8">MetroPark</option>
			<option value="7">Rahway</option>
			<option value="6">Linden</option>
			<option value="5">Elizabeth</option>
			<option value="4">North Elizabeth</option>
			<option value="3">Newark Intl. Airport</option>
			<option value="3">Newark Penn Station</option>
			<option value="1">Secaucus Junction</option>
			<option value="0">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- North Jersey Coast Line -- </option>
			<option value="27 ">Bay Head</option>
			<option value="26">Point Pleasant Beach</option>
			<option value="25">Manasquan</option>
			<option value="24">Spring Lake</option>
			<option value="23">Belmar</option>
			<option value="22">Bradley Beach</option>
			<option value="21">Asbury Park</option>
			<option value="20">Allenhurst</option>
			<option value="19">Elberon</option>
			<option value="18">Long Branch</option>
			<option value="17">Monmouth Park</option>
			<option value="16">Little Silver</option>
			<option value="15">Red Bank</option>
			<option value="14">Middletown</option>
			<option value="13">Hazlet</option>
			<option value="12">Aberdeen-Matawan</option>
			<option value="11">South Amboy</option>
			<option value="10">Perth Amboy</option>
			<option value="9">Woodbridge</option>
			<option value="8">Avenel</option>
			<option value="7">Rahway</option>
			<option value="6">Linden</option>
			<option value="5">Elizabeth</option>
			<option value="4">North Elizabeth</option>
			<option value="3">Newark Int'l Airport</option>
			<option value="2">Newark Penn Station</option>
			<option value="1">Secaucus Junction</option>
			<option value="0">New York Penn</option>
			<option disabled>                 </option>
			<option disabled> -- Main Line -- </option>
			<option value="17">Suffern</option>
			<option value="16">Mahwah</option>
			<option value="15">Route 17</option>
			<option value="14">Ramsey</option>
			<option value="13">Allendale</option>
			<option value="12">Waldwick</option>
			<option value="11">Ho-Ho-Kus</option>
			<option value="10">Ridgewood</option>
			<option value="9">Glen Rock - Main Line</option>
			<option value="8">Hawthorne</option>
			<option value="7">Paterson</option>
			<option value="6">Clifton</option>
			<option value="5">Passaic</option>
			<option value="4">Delawanna</option>
			<option value="2">Lyndhurst</option>
			<option value="2">Kingsland</option>
			<option value="1">Secaucus Junction</option>
			<option value="0">Hoboken</option>
			</select></td>
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
	<td>To Status:</td>
	        <td><select name="Status" size=1>
			<option value="On Time">On Time</option>
			<option value="Delayed">Delayed</option>
			<option value="Canceled">Canceled</option>
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
<br>
<table>
<tr>
<td><a href=CustomerRepPage.jsp><button>Back</button></a><td>
</tr>
</table>

</body>
</html>