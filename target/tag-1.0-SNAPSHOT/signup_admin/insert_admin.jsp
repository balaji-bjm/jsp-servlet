<%-- 
    Document   : test
    Created on : May 24, 2020, 8:48:15 AM
    Author     : balaji
--%>

<%@page import="java.sql.*"%>
<%@page import="pack.db"%>
<%@page import="pack.insert_admin_data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title>
    </head>
    <body><center>
        <h1>Hello </h1>
        <% 
            db con = new db();
            Connection in=con.get_connection();            
            Statement st = in.createStatement();
            ResultSet rs_a=st.executeQuery("select * from admin");
            int id=1;
            while(rs_a.next()){
                ++id;
            }
            String name=request.getParameter("name");
            String pass=request.getParameter("pass");
            String mid_name=request.getParameter("mid_name");
            out.println(name);
            out.println("user id is "+id);
            insert_admin_data obj=new insert_admin_data();
            obj.insert_new_a(id,name,pass,mid_name);
        %>
        <script>
//Using setTimeout to execute a function after 5 seconds.
setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'http://192.168.43.39:8080/tag/';
}, 5000);
</script>
    </center>
    </body>
</html>
