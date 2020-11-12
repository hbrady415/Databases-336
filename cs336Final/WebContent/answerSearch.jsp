<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/";
String database = "21schema";
String userid = "CS336Group21";
String password = "CS336Group21DatabaseUser";

String username =request.getParameter("username");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<h1>Search Data</h1>
<table border="1">
<tr>
<td>Username</td>
<td>First name</td>
<td>Last name</td>
<td>City name</td>
<td>Email</td>
<td>Update</td>
<td>Delete</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Login where username='"+ username +"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("firstName") %></td>
<td><%=resultSet.getString("lastName") %></td>
<td><%=resultSet.getString("City") %></td>
<td><%=resultSet.getString("Email") %></td>
<td><a href="userUpdate.jsp?username=<%=resultSet.getString("username")%>">update</a></td>
<td><a href="userDelete.jsp?username=<%=resultSet.getString("username")%>">delete</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>