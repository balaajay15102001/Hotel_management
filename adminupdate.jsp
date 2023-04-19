<html>
<head>
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

    response.setHeader("Refresh", "300; URL=setadminurl.jsp?page=adminupdate.jsp");
%>
<%  String ema=session.getAttribute("email").toString();
  if(ema.equals("null")){
    session.setAttribute("urlname1","adminupdate.jsp");
    response.sendRedirect("welcome.html");
  }
%>
<%
 
  try{    
     Connection con=null;
				String name = request.getParameter("name");
					//out.write("</table>");
           Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
         Statement stmt=con.createStatement();
					ResultSet owner_page_details = stmt.executeQuery("Select * from hotel_rooms;"); 

                    out.print("<div class=\"tab\">");

                     out.println("<table  border=\"8px solid black;\" style=\"width:500px;height:65%;background-color:yellow;margin:auto;text-align:center;font-size:25px;\" class=\"center\" >");   
                    out.print("<tr style=\"text-align:center;\"><h1>List of Rooms</h1></tr>");
                     out.print("<tr><td><b>Room_no</b></td><td><b>Type_of_room</b></td><td><b>Bed_Count</b></td><td><b>Floor</b></td><td><b>Rate</b></td><td><b>Availability</b></td></tr>");
                    
                    while(owner_page_details.next()){
                        out.print("<tr><td>"+owner_page_details.getString(1)+"</td><td>"+owner_page_details.getString(2)+"</td><td> "+owner_page_details.getString(3)+
						    "</td><td>"+owner_page_details.getString(4)+"</td><td>"+owner_page_details.getString(5)+"</td><td>"+owner_page_details.getString(6)+"</td></tr>");
                 out.println("<br>");  					    
            }
             out.println("</table><br><hr>");
             out.print("</div>");
  }
  catch(Exception e){
    
  }
%>
<div class="booking">
<h1 style="text-align:center;">Admin Room Updating</h1>
 <form action="adminupdate">
  <label>Old Room no</label>
 <input type="text" name="old_room_no" style="height:30px;" size="40%" placeholder="Enter your old room number">
 <br><br>
 <label>Room no</label>
 <input type="text" name="room_no" style="height:30px;" size="50%" placeholder="Enter the room number">
 <br><br>
  <label for="type">Type of Rooms</label>
  <select name="type" id="type">
    <option value="standard">Standard</option>
    <option value="deluxe">Deluxe</option>
    <option value="family suite">Family suite</option>
  </select>
  <label for="bed">&nbsp;No.Of.Bed</label>
    <select name="bed" id="type">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
  <label for="floor">Floor No</label>
    <select name="floor" id="type">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
  <br><br>
 <label>Rate of the room</label>
 <input type="text" name="rate" style="height:30px;" size="40%" placeholder="Enter the rate of the room">
 <br><br>
 <label>Availability</label>
 <input type="text" name="avail" style="height:30px;" size="50%" placeholder="Enter the availability of the room">
 <br><br>
    <input type="submit" style="padding:10px;" value="submit">
  </form>
   <button><a href='http://localhost:8080/hotel_management/admin_homepage.jsp'><h3>go to home age</h3></a></button>
				
</div>
</div>
</body>
</html>