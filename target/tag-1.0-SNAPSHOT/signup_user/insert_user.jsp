<%-- 
    Document   : test
    Created on : May 24, 2020, 8:48:15 AM
    Author     : balaji
--%>

<%@page import="java.sql.*"%>
<%@page import="pack.db"%>
<%@page import="pack.insert_user_data"%>
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
            ResultSet rs_u=st.executeQuery("select * from user");
            int id=1;
            while(rs_u.next()){
                ++id;
            }
            String name=request.getParameter("name");
            String pass=request.getParameter("pass");
            out.println(name);
            out.println("your id is "+id);
            insert_user_data obj=new insert_user_data();
            obj.insert_new_u(id,name,pass);
           
        %>
    </center>
     <script>
//Using setTimeout to execute a function after 5 seconds.
setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'http://:8081/tag/';
}, 5000);
</script>
    </body>
</html>
