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

String FirstName =request.getParameter("FirstName");
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
<td>First name</td>
<td>Last name</td>
<td>SSN</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Employee where FirstName='"+ FirstName +"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("FirstName") %></td>
<td><%=resultSet.getString("LastNameName") %></td>
<td><%=resultSet.getString("SSN") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
<td><a href="employeeUpdate.jsp?username=<%=resultSet.getString("FirstName")%>">update</a></td>
<td><a href="employeeDelete.jsp?username=<%=resultSet.getString("FirstName")%>">delete</a></td>
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