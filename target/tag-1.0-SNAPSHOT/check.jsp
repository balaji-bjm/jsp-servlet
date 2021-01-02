<%-- 
    Document   : test
    Created on : May 24, 2020, 8:48:15 AM
    Author     : balaji
--%>

<%@page import="java.lang.*"%>
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
        <% 
            String name=request.getParameter("name");
            String pass=request.getParameter("pass");
            //check_user obj=new check_user();
            //obj.check(name,pass);
            //out.println("jk");
            
             try{
            db con = new db();
            Connection inn=con.get_connection();            
            Statement st = inn.createStatement();
            ResultSet rs_u=st.executeQuery("select * from user");
            boolean i=true;
            String id;
            while(rs_u.next()){
                if(name.equals(rs_u.getString(2))&&pass.equals(rs_u.getString(3)) )
                {
                    out.println(" welcome user "+name);
                    request.setAttribute("name_u", name);
                    response.sendRedirect("user_page.jsp?selectMed=0");
                    i=false;
                }
            }
            if(i){
             
                    ResultSet rs_a=st.executeQuery("select * from admin");
                    while(rs_a.next()){
                        if(name.equals(rs_a.getString(2))&&pass.equals(rs_a.getString(3)) ){
                            id=rs_a.getString(1);
                            //HttpServlet session = request.getSession();
                            session.setAttribute("name_a", name);
                            session.setAttribute("id_a", id);
                            response.sendRedirect("admin_page.jsp?sendOption=0");
                            i=false;
                        }
                    }
            }
            if(i){
                out.println("not an user ");
            }
           }catch(Exception e){
             out.println(" "+e);
         }
        %>
        </center>
    </body>
</html>
