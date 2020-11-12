<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema","CS336Group21", "CS336Group21DatabaseUser");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Login where username='" + username + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("username", username); 
        out.println("welcome " + username);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("userHomePage.jsp");
    } else {
        out.println("Invalid user or password <a href=login.jsp><button>Try again</button></a> or <a href=register.jsp><button>Sing Up</button></a>");
    }
%>