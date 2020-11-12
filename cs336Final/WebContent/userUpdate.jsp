<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String username = request.getParameter("username");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/";
String database = "21schema";
String userid = "CS336Group21";
String password = "CS336Group21DatabaseUser";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Login where username='"+ username +"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h4>Customer information update form:</h4>

<form method="post" action="userUpdateProcess.jsp">
<table>
<tr>
<td>Username:</td>
<td><input type="text" name="username" value="<%=resultSet.getString("username") %>"></td>
<td><input type="hidden" name="username2" value="<%=resultSet.getString("username") %>"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="text" name="password" value="<%=resultSet.getString("password") %>"></td>
</tr>
<tr>
<td>First name:</td>
<td><input type="text" name="firstName" value="<%=resultSet.getString("firstName") %>"></td>
</tr>
<tr>
<td>Last name:</td>
<td><input type="text" name="lastName" value="<%=resultSet.getString("lastName") %>"></td>
</tr>
<tr>
<td>Address:</td>
<td><input type="text" name="Address" value="<%=resultSet.getString("Address") %>"></td>
</tr>
<tr>
<td>City name:</td>
<td><input type="text" name="City" value="<%=resultSet.getString("City") %>"></td>
</tr>
<tr>
<td>State:</td>
<td><input type="text" name="State" value="<%=resultSet.getString("State") %>"></td>
</tr>
<tr>
<td>Zipcode:</td>
<td><input type="text" name="Zipcode" value="<%=resultSet.getString("Zipcode") %>"></td>
</tr>
<tr>
<td>Phone Number:</td>
<td><input type="text" name="Telephone" value="<%=resultSet.getString("Telephone") %>"></td>
</tr>
<tr>
<td>Email Id:</td>
<td><input type="email" name="Email" value="<%=resultSet.getString("Email") %>"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Update"></td>
</tr>
</table>
</form>
<table>
			<tr>
			<td><a href=userIndex.jsp><button>Cancel</button></a><td>
			</tr>
			</table>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>