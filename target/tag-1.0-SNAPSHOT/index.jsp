<%--
    Document   : index
    Created on : May 24, 2020, 6:52:02 AM
    Author     : balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="index_css.css">
    </head>
    <body>

    <center>
        <form class="box" action="check.jsp">
            <h1>Log in</h1>
            <input type="text" name="name" placeholder="Username" autocomplete="off"/>
            <input type="password" name="pass" placeholder="Password"/>
            <input type="submit" value="Log in" />
            <a href="signup_user/signup_user.jsp" color="green">Signup as User</a><br>
            <a href="signup_admin/signup_admin.jsp" color="green">Signup as Admin</a>
        </form>
    </center>
    </body>
</html>