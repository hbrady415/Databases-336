<%
    if ((session.getAttribute("username") == null)) {
%>
You are not logged in<br/>
<a href="customerRepLogin.jsp">Please Login</a>
<%}
    else {
%>
<%=session.getAttribute("username")%> is currently in session 
<br>
<br>
<h4>Customer information and reservation management: </h4>
<form method="get" action="customerList.jsp">
	<table>
	<tr>
	<td>Transit Line:</td>
	        <td><select name="TransitLine" size=1>
			<option value="North East Corridor">North East Corridor</option>
			<option value="North Jersey Coast">North Jersey Coast</option>
			<option value="Main Line">Main Line</option>
			<option value="Raritan Valley">Raritan Valley</option>
			<option value="Morristown Line">Morristown Line</option>
			<option value="Montclair Boonton">Montclair Boonton</option></select></td>
			</tr>
			<tr>
				<td>Train Number</td>
				<td><input type="text" name="TrainNumber"></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Get List"></td>
			</tr>
	</table>
	</form>

<br>
<a href=answerIndex.jsp><button>Answer questions</button></a>
<br>
<a href=manageReservations.jsp><button>Reservations</button></a>
<br>
<br>

<br>
<h4>Work with Trains Schedules</h4>
<table>
<tr>
<td><a href=trainScheduleCR.jsp><button>Train Schedules</button></a><td>
</tr>
<tr>
<td><a href=sendAlert.jsp><button>Send Alerts</button></a><td>
</tr>
<tr>
<td><a href=searchTrainSchedule.jsp><button>Delete Train Schedules</button></a><td>
</tr>
<tr>
<td><a href=addTrainSchedule.jsp><button>Add Train Schedules</button></a><td>
</tr>
<tr>
<td><a href=updateTrainSchedule.jsp><button>Update Train Schedules</button></a><td>
</tr>
</table>



<br>
<br>
<table>
<tr>
<td><a href=logoutCustomerRep.jsp><button>Log out</button></a></td>
</tr>
</table>

<%
    }
%>