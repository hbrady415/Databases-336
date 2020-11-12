<%
    if ((session.getAttribute("username") == null)) {
%>
You are not logged in<br/>

<a href="managerLogin.jsp">Please Login</a>

<%}
    else {
%>
Welcome <%=session.getAttribute("username")%>! <a href=logoutAdmin.jsp><button>Log out</button></a>

<br>
<h4>Customer and Employee information: </h4>
<a href=bestCustomer.jsp><button>Best Customer</button></a>
<a href=userIndex.jsp><button>Manage Customers</button></a>
<a href=employeeIndex.jsp><button>Manage Employees</button></a>
<br>
<br>
<br>

<h4>Sales report by month</h4>

<form method="get" action="salesReport.jsp">
	<table>
	<tr>
	<td>Month:</td>
	        <td><select name="month" size=1>
			<option value="April">April</option>
			<option value="May">May</option></select></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Get Report"></td>
			</tr>
	</table>
	</form>
<br>

<h4>Reservations by Transit Line and Train Number</h4>

<form method="get" action="transitLine.jsp">
	<table>
	<tr>
	<td>Transit Line:</td>
	        <td><select name="TransitLine" size=1>
			<option value="North East Corridor">North East Corridor</option>
			<option value="North Jersey Coast">North Jersey Coast</option>
			<option value="Main Line">Main Line</option></select></td>
			</tr>
			<tr>
				<td>Train Number</td>
				<td><input type="text" name="TrainNumber"></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Get Report"></td>
			</tr>
	</table>
	</form>
<br>

<h4>Reservations by Customer Name</h4>

<form method="get" action="customerReport.jsp">
	<table>
	<tr>
		<td>First Name</td>
		<td><input type="text" name="firstName"></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" name="lastName"></td>
	</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Get Report"></td>
			</tr>
	</table>
	</form>
	
<br>


<h4>Revenue reports: </h4>
<a href=revenueByTransitLine.jsp><button>Revenue by Transit Line</button></a>
<a href=bestTransitLines.jsp><button>Top 5 Most Active Transit Lines</button></a>
<a href=revenueByDestinationCity.jsp><button>Revenue by Destination City</button></a>
<a href=revenueByCustomer.jsp><button>Revenue By Customer</button></a>


<%
    }
%>