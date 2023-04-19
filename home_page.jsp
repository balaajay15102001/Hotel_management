<html>
<head>
    <title>Home page</title>
    <link rel="stylesheet" href="homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<body>
<%

session.setMaxInactiveInterval(300);

long currentTime = System.currentTimeMillis();

session.setAttribute("creationTime", currentTime);

long expireTime = currentTime + (60 * 1000);

session.setAttribute("expireTime", expireTime);

response.setHeader("Refresh", "300; URL=seturl.jsp?page=home_page.jsp");
%>


<% 
        String ema=session.getAttribute("email").toString();
        if(ema.equals("null")){
            response.sendRedirect("welcome.html");
        }

%>

<div class="nav">
    <div class="image">
        <img src="https://www.logodesign.net/logo/city-skyline-inside-the-dish-cover-895ld.png?size=2&industry=hotel" width="5%" height="5%" style="padding: 20px" >
        <div class="list">
            <ul>
                <li><a class="active" href="homepage.html">Home</a></li>
                <li><a href="room_book.jsp">Room_book</a></li>
                <li><a href="update.jsp">Your Reg/Update room</a></li>
                <%-- <li>
                    <div class="dropdown">
                        <a class="dropbtns">Your Reg/Update room</a>
                        <%-- <div class="dropdown-content">
                            <form action="update.jsp">
                            <input type="search" size="70px" placeholder="Enter your email for verification"  name="email">
                        </form> --%>

                        <%-- </div>
                    </div> 
                </li> --%> 
                <li><a href="#contact">Contact</a></li>
                <li>
                   <div class="dropdown">
                        <!-- <input type="search" size="70px" placeholder="Search here..."  for="search" name="search"> -->
                        <button class="dropbtn">Search</button>
                        <div class="dropdown-content">
                            <form action="search">
                                <label for="type">Type of Rooms</label>
                                <select name="type" id="type">
                                    <option value="standard">Standard</option>
                                    <option value="deluxe">Deluxe</option>
                                    <option value="family suite">Family suite</option>
                                </select>
                                <!-- <label for="bed">&nbsp;No.Of.Bed</label>
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
                                </select> -->
                                <br><br>
                                <input type="submit" value="submit">
                            </form>
                        </div>
                    </div>
                </li>
            </div>
            <li>
        <div class="down">
            <button class="btn"><i class="fa-solid fa-circle-user" style="font-size: 30px;padding:20px"></i></button>
            <div class="dropdown-content">
                <a href="logout.jsp">Log out</a>
            </div>
          </div>
        </div>
    </div>
</li>
</ul>
    <br>
</div>
<br>
<div class="image-wal">
    <img src="https://wallpaperaccess.com/full/2690782.jpg">
</div>
<hr>

<div id="contact">
    <h1 style="text-align: center">Contact us</h1>
    <table style="margin: auto;">
        <tr>
            <th >Hotels</th>
            <th>Quick Links</th>
            <th>Contact Us</th>
        </tr>
        <tr>
            <td>
                <a href="">Hotels in Manali</a><br>
                <a href="">Hotels in Chennai</a><br>
                <a href="">Hotels in Coimbatore</a><br>
                <a href="">Hotels in Hydrabad</a><br>
            </td>
            <td>
                Pet Shop<br>
                Shop Market<br>
                Animal items<br>
                Dressup for Dogs<br>
                Medicine<br>
            </td>
            <td>
                <p>  Address: No.57/1 Mangement road Tamil Nadu, India - 641021.</p>
                <p>Email:  Hotellogo@gmail.com</p>
                <p>Post your Details:  careers@dogstrust.in</p>
                <p> Help line:  +91 84484 48909</p>
            </td>
        </tr>
    </table>
</div>
<hr>
</body>
</html>