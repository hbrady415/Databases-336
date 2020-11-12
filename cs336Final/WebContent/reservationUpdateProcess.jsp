<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://cs336group21database.cacf6fuqa0qn.us-east-2.rds.amazonaws.com:3306/21schema";%>
<%!String user = "CS336Group21";%>
<%!String psw = "CS336Group21DatabaseUser";%>
<%

String CustomerRep = (String) session.getAttribute("username");
String reservationID=request.getParameter("reservationID");
String username=request.getParameter("username");
String TransitLine=request.getParameter("TransitLine");
String DepartingFrom=request.getParameter("DepartingFrom");
String ArrivingTo=request.getParameter("ArrivingTo");
String TrainNumber=request.getParameter("TrainNumber");
String fromStation=request.getParameter("fromStation");
String toStation=request.getParameter("toStation");
String ScheduleDate=request.getParameter("ScheduleDate");
String travelTime=request.getParameter("travelTime");
String Stops=request.getParameter("Stops");
String DepartureTime=request.getParameter("DepartureTime");
String ArrivalTime=request.getParameter("ArrivalTime");
String ticketClass=request.getParameter("Class");
String Adults=request.getParameter("Adults");
String Special=request.getParameter("Special");
String Fare=request.getParameter("Fare");


String TicketType=request.getParameter("TicketType");

int ticketTypeAssignment = 0;
int classCalculator = 0;
int bookingFee = 2; //This is how the company makes money
double discount = 0.5;

//Calculating Class Fee
if(ticketClass.equals("Business"))
	classCalculator = 2;
else if (ticketClass.equals("First"))
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




if(reservationID != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(username); //This is how to parse Strings to Integers
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Reservation set reservationID=?,username=?,TransitLine=?,DepartingFrom=?,ArrivingTo=?, TrainNumber=?, fromStation=?, toStation=?, ScheduleDate=?, travelTime=?, Stops=?, DepartureTime=?, ArrivalTime=?, Class=?, Adults=?, Special=?, Fare=?, TotalFare=?, CustomerRep=?, TicketType=?  where reservationID='"+ reservationID +"'"; //You will need quotes here

ps = con.prepareStatement(sql);
ps.setString(1,reservationID);
ps.setString(2, username);
ps.setString(3, TransitLine);
ps.setString(4, DepartingFrom);
ps.setString(5, ArrivingTo);
ps.setString(6,TrainNumber);
ps.setString(7, fromStation);
ps.setString(8, toStation);
ps.setString(9, ScheduleDate);
ps.setString(10, travelTime);
ps.setString(11,Stops);
ps.setString(12, DepartureTime);
ps.setString(13, ArrivalTime);
ps.setString(14, ticketClass);
ps.setString(15, Adults);
ps.setString(16,Special);
ps.setString(17,Fare);
ps.setString(18, TotalFare);
ps.setString(19, CustomerRep);
ps.setString(20, TicketType);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
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
<a href=manageReservations.jsp><button>Back</button></a>