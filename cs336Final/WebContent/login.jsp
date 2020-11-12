<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Form</title>
</head>
<body>
<h2>User Login Page</h2>

	    <form action="checkUserDetails.jsp" method="POST">
		<table>
			<tr>
				<td>User Name</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>

<br>
Don't have an account yet? <a href=register.jsp><button>Sign Up</button></a>
<br>
<br>
			<table>
			<tr>
			<td></td>
			<td><a href=index.jsp><button>Cancel</button></a><td>
			</tr>
			</table>
</body>
</html>