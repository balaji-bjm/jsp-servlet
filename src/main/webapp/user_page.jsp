<%-- 
    Document   : user_page
    Created on : May 31, 2020, 8:21:28 AM
    Author     : balaji
--%>

<%@page import="java.sql.*"%>
<%@page import="pack.db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="user_page_css.css">
    </head>
    <body><center style="margin-top: 10%">
        <%
            db obj = new db();
            Connection con = obj.get_connection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from admin");
        %>
        <h3>select Medical</h3>
        <form action="user_page.jsp" method="get">
            <select name="selectMed">
                <%
                    while(rs.next())
                    {
                        int temp = Integer.parseInt(rs.getString(1));
                        if(temp>=1)
                        {
                            %>
                            <option value=<%=rs.getString(1)%>><%=rs.getString(4)%></option>
                            <%
                        }
                    }
                %>
            </select></br>
            <input type="submit" value="Submit"/>
        </form>
        </center>
            <div class="table" style="margin-right:30%; margin-top:-7% ">
        <%
            int medical_No=Integer.parseInt(request.getParameter("selectMed"));
            if(medical_No>0)
            {
                ResultSet rs2 = st.executeQuery("select * from medicine where id_a='"+medical_No+"'");
                %>
                    <table align="center" cellpadding="5" cellspacing="" border="1">
                        <tr bgcolor="#ffffb3">
                            <td>Drug Name</td>
                            <td>Count</td></b>
                        </tr>
                <%
                while(rs2.next())    
                {
                    %>
                        <tr>
                            <td><%=rs2.getString(3)%></td>
                            <td><%=rs2.getString(4)%></td>
                        </tr>
                    <%
                }
            }
        %></table></div>
    </body>
</html>
