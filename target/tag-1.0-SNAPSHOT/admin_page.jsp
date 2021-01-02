<%-- 
    Document   : admin_page
    Created on : May 26, 2020, 9:45:44 AM
    Author     : balaji
--%>

<%@page import="java.sql.*"%>
<%@page import="pack.db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <script src="sweetalert2/dist/sweetalert2.min.js"></script>
        <script src="admin_page_js.js"></script>
        <link rel="stylesheet" href="sweetalert2/dist/sweetalert2.min.css">
        <link rel="stylesheet" type="text/css" href="admin_page_css.css">
    </head>
    <body>
        <h1 align="center" color="black">Admin</h1>
        <center></br>
        <form class="form" action="admin_page.jsp" method="get">
            <div class="select-box">
            <label for="select-box1" class="label select-box1">
                <span class="label-desc">Choose your option</span> </label>
            <select name="sendOption" id="select-box1" class="select">
                <option value="1">Add Medicine</option>
                <option value="2">Update Medicine</option>
                <option value="3">Delete Medicine</option>
            </select></br></br></br></br>
            </div>
            <input type="text" name="med_name" placeholder="Medicine name" autocomplete="off"/><br>
            <input type="text" name="count" placeholder="Count" autocomplete="off"/><br>
            <input type="submit" value="Submit" />
        </form>
        </center>
        <form action="logout.jsp" method="get" x>
            <input type="submit" value="Logout"/>
        </form>
        <%
            if((String)session.getAttribute("name_a")==null)
                response.sendRedirect("index.jsp");
        %>
        <%
           String a= (String)session.getAttribute("id_a");
           String b= (String)session.getAttribute("name_a");
           //out.println(a);
           //out.println(b);
        %>
          <table align="center" cellpadding="5" cellspacing="" border="1">
        <tr bgcolor="#ffffb3">
            <td>Drug Name</td>
            <td>Count</td></b>
        </tr>
        <%
            db obj = new db();
            Connection con = obj.get_connection();
            Statement st = con.createStatement();
            String admin_id = (String)session.getAttribute("id_a");
            ResultSet rstable = st.executeQuery("select * from medicine where id_a='"+admin_id+"'");
            //ResultSet rs1 = st.executeQuery("select * from medicine");
            //out.println(rs.next());
            while(rstable.next())    
            {
                //if(rs.getString("id_m").equals(0))
                //{
                //out.println("ji");
                %>
                     <tr>
                        <td><%=rstable.getString(3)%></td>
                        <td><%=rstable.getString(4)%></td>
                    </tr>
                <%
                //}
            }
        %>
        </table>
        <%
            int ch;
            ch=Integer.parseInt(request.getParameter("sendOption"));
            if(ch>0)
            {
            //db obj = new db();
            //Connection con = obj.get_connection();
            //Statement st = con.createStatement();
            //String admin_id = (String)session.getAttribute("id_a");
            ResultSet rs = st.executeQuery("select * from medicine where id_a='"+admin_id+"'");
            Statement st_2 = con.createStatement();
            ResultSet setSq = st_2.executeQuery("select * from medicine");
            int rowCheck=0;
            //String sq_no=null;
            int sq_no=1;
            String med_name = (String)request.getParameter("med_name");
            int count = Integer.parseInt(request.getParameter("count"));
            boolean drug_check=false;
            switch(ch)
            {
                case 1:
                    while(setSq.next())
                    {
                        sq_no=Integer.parseInt(setSq.getString(1));
                    }
                    ++sq_no;
                    setSq.close();
                    while(rs.next())
                    {
                        if(rs.getString(3).equals(med_name))
                        {
                            drug_check=true;
                            //response.sendRedirect("admin_page.jsp");
                        }
                    }
                    if(drug_check)
                    {
                        %>
                            <script>
                                    
                                    sweetalertclick();
                                    function sweetalertclick(){
                                    Swal.fire(
                                        'Oops...',
                                        'Medicine is already available, You just update !!',
                                        'error'
                                      )
                                    }
                                    setTimeout(function () {
                                //Redirect with JavaScript
                                    window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                                    //alert("drug is already available,Just update !");
                                    //window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                            </script>
                        <%
                    }
                    else
                    {
                       // out.println(sq_no+" "+admin_id+" "+med_name+" "+count);
                        st.executeUpdate("insert into medicine(sq_no,id_a,drug,count) values('"+sq_no+"','"+admin_id+"','"+med_name+"','"+count+"')");
                        //out.println("Medicine Successfully added"); 
                        //response.sendRedirect("admin_page.jsp?sendOption=0");
                        %>
                            <script>
                                sweetalertclick();
                                function sweetalertclick(){
                                    Swal.fire(
                                        'Great !!',
                                        'Medicine Successfuly Added!',
                                        'success'
                                      )
                                setTimeout(function () {
                                //Redirect with JavaScript
                                    window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                                }
                            </script>
                        <%
                        
                    } 
                    break;
                case 2:
                    boolean checkMed = false;
                    while(rs.next())
                    {
                        rowCheck++;
                        if(rs.getString(3).equals(med_name))
                            checkMed = true;
                    }
                    if(rowCheck>=1 && checkMed)
                    {
                        st.executeUpdate("update medicine SET count='"+count+"' WHERE drug='"+med_name+"'&& id_a='"+admin_id+"'");
                        //out.println("Medicine Successfully update");
                        %>
                            <script>
                                
                                setTimeout(function () {
                                //Redirect with JavaScript
                                window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                                sweetalertclick();
                                function sweetalertclick(){
                                    Swal.fire(
                                        'Great !!',
                                        'Medicine Successfuly Updated!',
                                        'success'
                                      )
                                }
                            </script>
                        <%
                    }
                    else
                    {
                        %>
                            <script>
                                sweetalertclick();
                                    function sweetalertclick(){
                                    Swal.fire(
                                        'Oops...',
                                        'Medicine not match, Check your table',
                                        'error'
                                      )
                                    }
                                    setTimeout(function () {
                                //Redirect with JavaScript
                                    window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                                //alert("You have no Rows to update,check your table on admin page");
                                //window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                            </script>
                        <%
                    }
                    break;
                case 3:
                    checkMed = false;
                    while(rs.next())
                    {
                        rowCheck++;
                        if(rs.getString(3).equals(med_name)&&Integer.parseInt(rs.getString(4))==count)
                            checkMed = true;
                    }
                    if(rowCheck>=1 && checkMed)
                    {
                        int resultId=0;
                        ResultSet s =st.executeQuery("select sq_no from medicine where drug='"+med_name+"' && id_a='"+admin_id+"'");
                        s.next();
                        resultId=Integer.parseInt(s.getString(1));
                        out.println(resultId);
                        out.println(admin_id);
                        s.close();
                        st.close();
                        Statement st2 = con.createStatement();
                        
                        st2.executeUpdate("delete from medicine where sq_no="+resultId+"");
                        //out.println("Medicine Successfully delete");
                        %>
                            <script>
                                sweetalertclick();
                                function sweetalertclick(){
                                    Swal.fire(
                                        'Great !!',
                                        'Medicine Successfuly Deleted!',
                                        'success'
                                      )
                                }
                                setTimeout(function () {
                                //Redirect with JavaScript
                                window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                            </script>
                        <%
                    }
                    else
                    {
                        boolean notFound = true;
                        ResultSet rs_d = st.executeQuery("select * from medicine where id_a='"+admin_id+"'");
                        while(rs_d.next())
                        {
                            if(rs_d.getString(3).equals(med_name))
                            {
                                notFound = false;
                                %>
                                    <script>
                                    sweetalertclick();
                                    function sweetalertclick(){
                                    Swal.fire(
                                        'Oops...',
                                        'Medicine name and count mismatch, Please check the count of medicine !',
                                        'error'
                                      )
                                    }
                                    setTimeout(function () {
                                //Redirect with JavaScript
                                window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                                        //alert("drug name and count mismatch,pleas check the count of drug !");
                                        //window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                    </script>   
                                <%
                            }
                        }
                        if(notFound){
                        %>
                            <script>
                                sweetalertclick();
                                function sweetalertclick(){
                                Swal.fire(
                                    'Oops...',
                                    'Medicine not found !',
                                    'error'
                                   )
                                }
                                setTimeout(function () {
                                //Redirect with JavaScript
                                window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                                }, 3000);
                                    //alert("drug not found !");
                                    //window.location.href= 'http://192.168.43.39:8080/tag/admin_page.jsp?sendOption=0';
                            </script>
                        <%
                        }
                    }
                    break;
            }
}
        %>
    </body>
</html>
