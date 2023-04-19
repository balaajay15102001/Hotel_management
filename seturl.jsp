<html>
<body>
    <%
        String pagename=request.getParameter("page");
        session.setAttribute("urlname",pagename);
        session.setAttribute("email","null");
        response.sendRedirect("login.jsp");
    %>
</body>
</html>