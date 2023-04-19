<html>
<body>
<%
    String pagename=request.getParameter("page");
    session.setAttribute("urlname1",pagename);
    session.setAttribute("email","null");
    response.sendRedirect("adminlogin.jsp");
%>
</body>
</html>