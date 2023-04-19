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
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager.*"%> 
<%
  Connection con=null;
 
  try{
    String email=request.getParameter("email");
    String pass=request.getParameter("password");
    Class.forName("org.postgresql.Driver");
    con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/practice","postgres","bala");
    Statement stmt=con.createStatement();
    ResultSet owner_page_details = stmt.executeQuery("select * from adminlogin;"); 
        int f=0;
            while(owner_page_details.next()){
                out.print(owner_page_details.getString(2));
                out.print("<br>");
                out.print(email+" "+pass);
                out.print("<br>");
                if(owner_page_details.getString(2).equals(email) && owner_page_details.getString(3).equals(pass)){

                    session.setAttribute("email",email);

                    String url=session.getAttribute("urlname1").toString();
                    if(url.equals("null")){
                      response.sendRedirect("http://localhost:8080/hotel_management/admin_homepage.jsp");
                      f=1;
                    }
                    else{
                    response.sendRedirect(url);
                  }

                } 
            }
            if(f==0){
                 
                    response.sendRedirect("http://localhost:8080/hotel_management/adminlogin.jsp");
               
            }
  }
  catch(Exception e){
    
  }
%>
</body>
</html>