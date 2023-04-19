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
    response.setHeader("Refresh", "300; URL=setadminurl.jsp?page=hotel_options.jsp");
%>
<%  String ema=session.getAttribute("email").toString();
  if(ema.equals("null")){
    session.setAttribute("urlname1","hotel_options.jsp");
       session.setAttribute("urlname1","null");
    response.sendRedirect("welcome.html");
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
                out.print("<tr><td>"+owner_page_details.getString(1)+"</td><td>"+owner_page_details.getString(2)+"</td><td>"+owner_page_details.getString(3)+
						    "</td><td>"+owner_page_details.getString(4)+"</td><td>"+owner_page_details.getString(5)+"</td><td>"+owner_page_details.getString(6)+"</td></tr>");
                 out.println("<br>");    
           }
            out.println("</table><br>");
             out.print("</div>");
  }
  catch(Exception e){
    
  }
 %>
     <br>
     <hr>
<div class="booking">

<h2>Update booking</h2>
 <form class="design">
 <label>Add New Guest</label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
 <button  style="background-color:green;"><a href="login_pages.jsp">Sign-in</a></button>
 <br><br>
 <label>Update Guest</label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
 <button  style="background-color:green;"><a href="update.jsp">Update</a></button>
 <br><br>
 <label>Update Guest</label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
 <button style="background-color:green;"><a href="login_pages.jsp">Delete</a></button>
 <br><br>
  </form>
    <button><a href="http://localhost:8080/hotel_management/home_page.jsp">back to home page</a></button>

</div>
</div>

</body>
</html>