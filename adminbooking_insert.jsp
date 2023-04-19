<html>
<body>
 <%@page import="java.io.*"%>
          <%@page import="java.sql.*"%>
          <%@page import="java.sql.DriverManager.*"%> 
          <%

session.setMaxInactiveInterval(10);

long currentTime = System.currentTimeMillis();

session.setAttribute("creationTime", currentTime);

long expireTime = currentTime + (60 * 1000);

session.setAttribute("expireTime", expireTime);

response.setHeader("Refresh", "10; URL=setadminurl.jsp?page=adminbooking_insert.jsp");
%>
          <% 
           String ema=session.getAttribute("email").toString();
  if(ema.equals("null")){
    session.setAttribute("urlname1","adminbooking_insert.jsp");
    session.setAttribute("urlname","null");
    response.sendRedirect("welcome.html");
  }
%>
<%
        try{ 
         
          Connection con=null;
           String room_no=request.getParameter("room_no");
          String type=request.getParameter("type");
          String bed=request.getParameter("bed");
          String floor=request.getParameter("floor");
          String rate=request.getParameter("rate");
          String avail=request.getParameter("avail");
          Class.forName("org.postgresql.Driver");
          int f=0;
          con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
          Statement stmt=con.createStatement();
          ResultSet owner_page_details = stmt.executeQuery("select * from hotel_rooms;"); 
         out.print("<tr><td><b>Room_no</b></td><td><b>Type_of_room</b></td><td><b>Bed_Count</b></td><td><b>Floor</b></td><td><b>Rate per Day</b></td><td><b>Availability</b></td></tr>");
         if(room_no !="null"){           
            while(owner_page_details.next()){
              if(owner_page_details.getString(1)!=room_no){
                   stmt.execute("insert into hotel_rooms values('"+room_no+"','"+type+"','"+bed+"','"+floor+"','"+rate+"','"+avail+"');");
                   f=1;
                   out.print("<script>location='http://localhost:8080/hotel_management/adminbook.jsp';alert('successfully inserted');</script>");    
              }
         
         
        // out.print("WEl done");
        // out.print("<script>document.getElementById(\"id\").innerHTML=\"successfully Inserted\";</script>"); 
        }
        //if(f==0){
          //    out.print("<script>location='http://localhost:8080/hotel_management/adminbook.jsp';alert('Your Room number is already exists')</script>");
        //}
        }
        }
        catch(Exception e){
         out.print("<script>location='http://localhost:8080/hotel_management/adminbook.jsp';alert('Your Room number is already exists')</script>");
         out.print(e); 
        
        }
    
%>
</body>
</html>