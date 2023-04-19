<html>
<head>
<link rel="stylesheet" href="homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<style>
body{
  background-color:lightblue;
}
.booking{
  border:1px solid black;
  border-radius:25px;
  background-color:lightpink;
  width:30%;
  padding:20px;
  margin-top: 10%;
  box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
  }
  
</style>
</head>
<body>

<div class="container " style="display: flex;
    justify-content: space-around;">
<%-- <%@ Page errorPage="error_handle.jsp"%>  --%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager.*"%> 

<%

session.setMaxInactiveInterval(300);

long currentTime = System.currentTimeMillis();

session.setAttribute("creationTime", currentTime);

long expireTime = currentTime + (60 * 1000);

session.setAttribute("expireTime", expireTime);

response.setHeader("Refresh", "300; URL=seturl.jsp?page=room_book.jsp");
%>

<%
  Connection con=null;
  String ema=session.getAttribute("email").toString();
  if(ema.equals("null")){

    session.setAttribute("urlname","room_book.jsp");
    session.setAttribute("urlname1","null");
    response.sendRedirect("welcome.html");
  }

  try{
    Class.forName("org.postgresql.Driver");
    con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
    Statement stmt=con.createStatement();
    ResultSet owner_page_details = stmt.executeQuery("select * from hotel_rooms;"); 

    out.print("<div class=\"tab\">");

     out.println("<table  style=\"border:8px solid black;width:500px;height:65%;background-color:yellow;margin:auto;text-align:center;font-size:25px;\" class=\"center\" >");   
                out.print("<tr style=\"text-align:center;\"><h1>Available Rooms</h1></tr>");
               out.print("<tr  style=\"border:8px solid black;\"><td  style=\"border:8px solid black;\"><b>Room_no</b></td><td  style=\"border:8px solid black;\"><b>Type_of_room</b></td><td  style=\"border:8px solid black;\"><b>Bed_Count</b></td><td  style=\"border:8px solid black;\"><b>Floor</b></td><td  style=\"border:8px solid black;\"><b>Rate per Day</b></td><td  style=\"border:8px solid black;\"><b>Availability</b></td></tr>");
                    
            while(owner_page_details.next()){
              if(owner_page_details.getString(6).equals("yes")){
                out.print("<tr style=\"border:8px solid black;\"><td  style=\"border:8px solid black;\">"+owner_page_details.getString(1)+"</td><td  style=\"border:8px solid black;\">"+owner_page_details.getString(2)+"</td  style=\"border:8px solid black;\"><td  style=\"border:8px solid black;\">"+owner_page_details.getString(3)+
						    "</td><td  style=\"border:8px solid black;\">"+owner_page_details.getString(4)+"</td><td  style=\"border:8px solid black;\">"+owner_page_details.getString(5)+"</td><td  style=\"border:8px solid black;\">"+owner_page_details.getString(6)+"</td></tr>");
                 out.println("<br>");    
              }
           }
            out.println("</table><br>");
             out.print("</div>");
  }
  catch(Exception e){
    
  }
 %>
<div class="booking">
<h2>Room Booking</h2>
 <form action="booking">
 <label>Room no</label>
 <input type="text" name="room_no" style="height:30px;" size="50%" placeholder="Enter the room number">
 <br><br>
  <label>No of Days</label>
 <input type="text" name="days" size="50%" style="height:30px;" placeholder="Enter no of days you want">
 <br><br>
 <label>Name</label>
 <input type="text" name="name" placeholder="Enter your name">
 <br><br>
 <label>Email</label>
 <input type="text" name="email" placeholder="Enter your name">
 <br><br>
 <label>Date of coming</label>
 <input type="date" name="coming" placeholder="Enter the date">
 <br><br>
 <%-- <label>Date of Vacate</label>
 <input type="date" name="vacate" placeholder="Enter the date">
 <br><br> --%>
    <input type="submit" style="padding:10px;" value="submit">
  </form>
  <button><a href="http://localhost:8080/hotel_management/home_page.jsp">back to home page</a></button>

</div>
</div>
</body>
</html>