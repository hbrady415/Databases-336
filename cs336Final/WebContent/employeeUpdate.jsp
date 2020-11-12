<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String FirstName = request.getParameter("FirstName");
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
String sql ="select * from Employee where FirstName='"+ FirstName +"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h4>Employee information update form:</h4>

<form method="post" action="employeeUpdateProcess.jsp">
<table>
<tr>
<td>First Name:</td>
<td><input type="text" name="FirstName" value="<%=resultSet.getString("FirstName") %>"></td>
<td><input type="hidden" name="FirstName2" value="<%=resultSet.getString("FirstName") %>"></td>
</tr>
<tr>
<td>Last name:</td>
<td><input type="text" name="LastName" value="<%=resultSet.getString("LastName") %>"></td>
</tr>
<tr>
<td>SSN:</td>
<td><input type="text" name="SSN" value="<%=resultSet.getString("SSN") %>"></td>
</tr>
<tr>
<td>Username:</td>
<td><input type="text" name="username" value="<%=resultSet.getString("username") %>"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="text" name="password" value="<%=resultSet.getString("password") %>"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Update"></td>
</tr>
</table>
</form>
<table>
<tr>
<td></td>
<td><a href=employeeIndex.jsp><button>Cancel</button></a></td>
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