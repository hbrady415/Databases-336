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

<h4>Train schedules by specific origin and destination</h4>

	<form method="get" action="trainScheduleQuery.jsp">
	<table>
	<tr>
	<td>Origin:</td>
	        <td><select name="Origin" size=1>
	        <option> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="New York Penn">New York Penn</option>
			<option>                 </option>
			<option> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
			<option value="New York Penn">New York Penn</option>
			<option>                 </option>
			<option> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Hoboken">Hoboken</option></select></td>
			</tr>
	<tr>
	<td>From Station:</td>
	        <td><select name="fromStation" size=1>
	        <option> -- North East Corridor -- </option>
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
			<option>                 </option>
			<option> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
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
			<option>                 </option>
			<option> -- Main Line -- </option>
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
	<td>To Station:</td>
	         <td><select name="toStation" size=1>
	         
	         
			<option> -- North East Corridor -- </option>
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
			<option>                 </option>
			<option> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
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
			<option>                 </option>
			<option> -- Main Line -- </option>
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
			<td></td>
			<td><input type="submit" value="Submit"></td>
			</tr>
	</table>
	</form>


<br>

<h4>Train schedules by origin, destination, and date of travel</h4>

	<form method="get" action="trainScheduleQuery2.jsp">
	<table>
	<tr>
	<td>Origin:</td>
	        <td><select name="Origin" size=1>
			<option> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="New York Penn">New York Penn</option>
			<option>                 </option>
			<option> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
			<option value="New York Penn">New York Penn</option>
			<option>                 </option>
			<option> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Hoboken">Hoboken</option></select></td>
			</tr>
	
	<tr>
	<td>Destination:</td>
	        <td><select name="Destination" size=1>
			<option> -- North East Corridor -- </option>
			<option value="Trenton">Trenton</option>
			<option value="New York Penn">New York Penn</option>
			<option>                 </option>
			<option> -- North Jersey Coast Line -- </option>
			<option value="Bay Head">Bay Head</option>
			<option value="New York Penn">New York Penn</option>
			<option>                 </option>
			<option> -- Main Line -- </option>
			<option value="Suffern">Suffern</option>
			<option value="Hoboken">Hoboken</option></select></td>
			</tr>

			
	<tr>
	<td>Date of Travel:</td>
	        <td><select name="ScheduleDate" size=1>
			<option value="2020-04-27">2020-04-27</option>
			<option value="2020-04-28">2020-04-28</option>
			<option value="2020-04-29">2020-04-29</option>
			<option value="2020-04-30">2020-04-30</option>
			<option value="2020-05-01">2020-05-01</option>
			<option value="2020-05-02">2020-05-02</option>
			<option value="2020-05-03">2020-05-03</option>
			<option value="2020-05-04">2020-05-04</option>
			</select></td>
			</tr>	
	<tr>
			<td></td>
			<td><input type="submit" value="Submit"></td>
			</tr>
	</table>
	</form>
	
<br>
<br>
<table>
<tr>
<td><a href=userHomePage.jsp><button>Back</button></a><td>
</tr>
</table>

</body>
</html>