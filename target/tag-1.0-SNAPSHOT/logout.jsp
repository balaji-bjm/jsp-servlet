<%-- 
    Document   : logout
    Created on : Jun 2, 2020, 3:00:32 PM
    Author     : balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("name_a");
            session.removeAttribute("id_a");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
