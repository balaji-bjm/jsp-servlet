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
    </head>
    <body>
        
    <center>
        <h1>Register admin</h1>
        <form action="insert_admin.jsp"><table>
                <tr><td>user_name   </td><td><input type="text" name="name" autocomplete="off"/></td><br>
                <tr><td>password    </td><td><input type="password" name="pass" autocomplete="off"/></td><br>
                <tr><td>medical_name</td><td><input type="medical_name" name="mid_name" autocomplete="off"/></td></tr></table>
            <br><input type="submit" value="Sign up" />
        </form>
    </center>
    </body>
</html>
