<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%

//String username = (String) session.getAttribute("username");


String username = (String) session.getAttribute("username");
String TransitLine = request.getParameter("TransitLine");
String DepartingFrom=request.getParameter("DepartingFrom");
String ArrivingTo=request.getParameter("ArrivingTo");
String TrainNumber=request.getParameter("TrainNumber");
String fromStation=request.getParameter("fromStation");
String toStation = request.getParameter("toStation");
String ScheduleDate=request.getParameter("ScheduleDate");
String travelTime=request.getParameter("travelTime");
String Stops=request.getParameter("Stops");
String DepartureTime=request.getParameter("DepartureTime");
String ArrivalTime=request.getParameter("ArrivalTime");
String Class2=request.getParameter("Class");
String Adults=request.getParameter("Adults");
String Special=request.getParameter("Special");
String Fare=request.getParameter("Fare");


String TicketType=request.getParameter("TicketType");

int ticketTypeAssignment = 0;
int classCalculator = 0;
int bookingFee = 2; //This is how the company makes money
double discount = 0.5;

//Calculating Class Fee
if(Class2.equals("Business"))
	classCalculator = 2;
else if (Class2.equals("First"))
	classCalculator = 3;

else classCalculator = 0;

//Calculating ticket type fee
if(TicketType.equals("One Way"))
	ticketTypeAssignment = 1;
else if (TicketType.equals("Round Trip"))
	ticketTypeAssignment = 2;
else if (TicketType.equals("Weekly"))
	ticketTypeAssignment = 7;
else if (TicketType.equals("Monthly"))
	ticketTypeAssignment = 30;
else classCalculator = 0;

double totalFareCalculator = (((Integer.parseInt(Special) * (Integer.parseInt(Fare)) * (discount) * (ticketTypeAssignment)) + 
							
                             (Integer.parseInt(Special) * classCalculator)) + 

							 ((Integer.parseInt(Adults) * (Integer.parseInt(Fare)) * ticketTypeAssignment) + (Integer.parseInt(Adults) * classCalculator)) + bookingFee );


String TotalFare = Double.toString(totalFareCalculator);



if(TransitLine != null)
{
Connection con = null;

PreparedStatement ps = null;
//int personID = Integer.parseInt(username); //This is how to parse Strings to Integers
try
{
Class.forName(driverName);

con = DriverManager.getConnection(url,user,psw);

String sql="INSERT INTO Reservation(username, TransitLine, DepartingFrom, ArrivingTo, TrainNumber, fromStation, toStation, ScheduleDate, travelTime, Stops, DepartureTime, ArrivalTime, Class, Adults, Special, Fare, TotalFare, TicketType)"
		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
ps = con.prepareStatement(sql);

ps.setString(1,username);
ps.setString(2, TransitLine);
ps.setString(3, DepartingFrom);
ps.setString(4, ArrivingTo);
ps.setString(5, TrainNumber);
ps.setString(6,fromStation);
ps.setString(7, toStation);
ps.setString(8, ScheduleDate);
ps.setString(9, travelTime);
ps.setString(10, Stops);
ps.setString(11, DepartureTime);
ps.setString(12, ArrivalTime);
ps.setString(13, Class2);
ps.setString(14, Adults);
ps.setString(15, Special);
ps.setString(16, Fare);
ps.setString(17, TotalFare);
ps.setString(18, TicketType);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Reservation created successfully!");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>

<td><a href=trainSchedule.jsp><button>Back to Schedule Page</button></a><td>