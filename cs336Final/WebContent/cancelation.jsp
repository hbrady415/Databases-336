<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<body>
<p>Enter a reservation number</p>

	    <form action="checkCancelation.jsp" method="POST">
		<table>
			<tr>
				<td>Reservation ID</td>
				<td><input type=text name="reservationID"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>

<br>
<a href=userHomePage.jsp><button>Back to Home Page</button></a>
</body>
</html>