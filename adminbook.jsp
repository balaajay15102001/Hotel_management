<html>
<head>
<style>
.booking{
  border:1px solid black;
  border-radius:25px;
  background-color:lightpink;
  width:30%;
  padding:20px;
  margin:auto;
  }
</style>
</head>
<body>
<%-- <%@ Page errorPage="error_handle.jsp"%>  --%>
 <%

    session.setMaxInactiveInterval(300);

    long currentTime = System.currentTimeMillis();

    session.setAttribute("creationTime", currentTime);

    long expireTime = currentTime + (60 * 1000);

    session.setAttribute("expireTime", expireTime);

    response.setHeader("Refresh", "300; URL=setadminurl.jsp?page=adminbook.jsp");
%>
<%  
String ema=session.getAttribute("email").toString();
  if(ema.equals("null")){
    session.setAttribute("urlname1","adminbook.jsp");
    session.setAttribute("urlname","null");
    response.sendRedirect("welcome.html");
  }
%>
<div class="booking">
<h2>Add New Room </h2>


 <form action="adminbooking_insert.jsp">
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
 <input type="text" name="rate" style="height:30px;" size="50%" placeholder="Enter the rate of the room">
 <br><br>
 <label>Availability</label>
 <input type="text" name="avail" style="height:30px;" size="50%" placeholder="Enter the availability of the room">
 <br><br>
    <input type="submit" style="padding:10px;" value="submit">
  </form>
  <br>
    <button><a href="http://localhost:8080/hotel_management/admin_homepage.jsp">back to home page</a></button>
</div>
<div id="id">

</div>
<div id="checkjsp">
         
</div>
</body>
</html>