<html>
<head>
<style>
body{
  background-color:lightblue;
}
.booking{
  border: 1px solid black;
    border-radius: 25px;
    background-color: lightpink;
    width: 30%;
    margin: auto;
    padding: 20px;
  box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
  }
</style>
</head>
<body>

<div class="container " style="display: flex; justify-content: space-around;align-items: flex-end;">
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

response.setHeader("Refresh", "300; URL=seturl.jsp?page=update.jsp");

%>

<%  String ema=session.getAttribute("email").toString();
  if(ema.equals("null")){

    session.setAttribute("urlname","update.jsp");
    session.setAttribute("urlname1","null");
    response.sendRedirect("welcome.html");
  }
%>
<%
  String email=session.getAttribute("email").toString();
%>
<%
 
  try{    
     Connection con=null;
     
        //out.write(email);
					out.write("</table>");
           Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
         Statement stmt=con.createStatement();
           PreparedStatement ps=con.prepareStatement("Select * from booking where email=?");
					ps.setString(1,email);
          int f=0;
					ResultSet owner_page_details = ps.executeQuery(); 

           while(owner_page_details.next()){
            if(owner_page_details.getString(10).equals(email)){
              f=1;
             out.print("<div>");
              out.println("<table  border=\"8px solid black;\" style=\"width:200px;height:55%;background-color:yellow;margin:auto;text-align:center;font-size:20px;margin-left: 50px;\" class=\"center\" >");   
                out.print("<tr style=\"text-align:center;\"><h1>Your Booking Rooms</h1></tr>");
               out.print("<tr><td><b>Name</b></td><td><b>Room_no</b></td><td><b>Type_of_room</b></td><td><b>Bed_Count</b></td><td><b>Floor</b></td><td><b>No of Days</b></td><td><b>Date Of Coming</b></td><td><b>Amount</b></td></tr>");
            
            while(owner_page_details.next()){
                out.print("<tr><td>"+owner_page_details.getString(8)+"</td><td>"+owner_page_details.getString(1)+"</td><td>"+owner_page_details.getString(2)+"</td><td>"+owner_page_details.getString(3)+
						    "</td><td>"+owner_page_details.getString(4)+"</td><td>"+owner_page_details.getString(5)+"</td><td>"+owner_page_details.getString(6)+"</td><td>"+owner_page_details.getString(7)+"</td></tr>");
                 out.println("<br>");      
            }
             out.println("</table><br>");
             out.print("</div>");
           }
           }
           if(f==0){
             out.print("<script>location=\"http://localhost:8080/hotel_management/home_page.jsp\";alert('Your Entered Email id is not correct');</script>");
           }
  }
  catch(Exception e){
     out.print("<script>location=\"http://localhost:8080/hotel_management/home_page.jsp\";alert('Your Entered Emails id is not correct');</script>");
                    
  }
%>
<%
  Connection con=null;
  try{
    Class.forName("org.postgresql.Driver");
    con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
    Statement stmt=con.createStatement();
    ResultSet owner_page_details = stmt.executeQuery("select * from hotel_rooms;"); 
    out.print("<div class=\"tab\">");
     out.println("<table  border=\"8px solid black;\" style=\"width:400px;height:55%;background-color:yellow;margin:auto;text-align:center;font-size:20px;margin-left: 50px;\" class=\"center\" >");

                out.print("<h1 style=\"text-align:center;\">Available Rooms</h1>");
               out.print("<tr><td><b>Room_no</b></td><td><b>Type_of_room</b></td><td><b>Bed_Count</b></td><td><b>Floor</b></td><td><b>Rate per Day</b></td><td><b>Availability</b></td></tr>");
                    
            while(owner_page_details.next()){
              if(owner_page_details.getString(6).equals("yes")){
                out.print("<tr><td>"+owner_page_details.getString(1)+"</td><td>"+owner_page_details.getString(2)+"</td><td>"+owner_page_details.getString(3)+
						    "</td><td>"+owner_page_details.getString(4)+"</td><td>"+owner_page_details.getString(5)+"</td><td>"+owner_page_details.getString(6)+"</td></tr>");
                 out.println("<br>");    
              }
           }
            out.println("</table><br>");
             out.print("</div>");
  }
  catch(Exception e){
    
  }
     %>
     
     </div>
     <br>
     <hr>
<div class="booking">

<h2>Update booking</h2>
 <form action="update">
 <label>Old Room no</label>
 <input type="text" name="old_room_no" style="height:30px;" size="50%" placeholder="Enter your old room number">
 <br><br>
 <label>Room no</label>
 <input type="text" name="room_no" style="height:30px;" size="50%" placeholder="Enter the room number">
 <br><br>
  <label>No of Days</label>
 <input type="text" name="days" size="40%" style="height:30px;" placeholder="Enter no of days you want">
 <br><br>
  <label>Date of coming</label>
 <input type="date" name="date" placeholder="Enter the date">
 <br><br>
    <input type="submit" style="padding:10px;" value="submit">
  </form>
    <button><a href="http://localhost:8080/hotel_management/home_page.jsp">back to home page</a></button>

</div>

</body>
</html>