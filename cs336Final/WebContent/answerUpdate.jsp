<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String questionID = request.getParameter("questionID");
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
String sql ="select * from Messaging where questionID='"+ questionID +"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){ // We need to modify this line to not print all the questions out..
%>
<!DOCTYPE html>
<html>
<body>
<h4>Answer customer questions:</h4>

<form method="post" action="answerUpdateProcess.jsp">
<table>
<tr>
<td>User Name:</td>
<td><input type="text" name="username" value="<%=resultSet.getString("username") %>"readonly></td>
</tr>
<tr>
<td>Question ID:</td>
<td><input type="text" name="questionID" value="<%=resultSet.getString("questionID") %>"readonly></td>
</tr>
<tr>
<td>Question:</td>
<td><input type="text" name="question" value="<%=resultSet.getString("question") %>"readonly></td>
</tr>
<tr>
<td>Answer:</td>
<td><input type="text" name="answer" value="<%=resultSet.getString("answer") %>"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Update"></td>
</tr>
</table>
</form>
<table>
			<tr>
			<td><a href=answerIndex.jsp><button>Cancel</button></a><td>
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