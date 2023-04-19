<html>
<body>
<%-- <%@ Page errorPage="error_handle.jsp"%>  --%>
<%
  String name = request.getParameter("first_name").toLowerCase();
  String email=request.getParameter("email");
  String password=request.getParameter("password");
%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager.*"%>
<%
  Connection con=null;
  try{
    Class.forName("org.postgresql.Driver");
    con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
    Statement stmt=con.createStatement();
    stmt.execute("insert into hotel_user_login values('"+name+"','"+email+"','"+password+"');");
    out.print("<script>alert('This summited')</script>");
   response.sendRedirect("http://localhost:8080/hotel_management/login.jsp");
    
  }
  catch(Exception e){
    out.print("<script>alert('This email is already exists')</script>");
    response.sendRedirect("http://localhost:8080/hotel_management/login_pages.jsp");
  }
%>
</body>
</html>