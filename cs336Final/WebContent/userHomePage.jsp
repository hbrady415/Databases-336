<%
    if ((session.getAttribute("username") == null)) {
%>
You are not logged in<br/>

<a href="login.jsp">Please Login</a>

<%}
    else {
%>
Welcome <%=session.getAttribute("username")%>! 
<br>
<br>
How can we asisst you today? 
<br>
<br>



<a href=myAlerts.jsp><button>My Alerts</button></a>
<br>
<a href=checkAnswer.jsp><button>My Messages</button></a>
<br>
<a href=myReservations.jsp><button>Check my reservations</button></a>
<br>
<a href=trainSchedule.jsp><button>Check Train Schedules and make reservations</button></a>
<br>
<br>

<a href=logout.jsp><button>Log out</button></a>

<%
    }
%>