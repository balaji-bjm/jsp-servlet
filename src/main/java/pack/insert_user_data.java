/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;


import pack.db.*;
import java.sql.*;
import java.sql.Connection;
/**
 *
 * @author balaji
 */
public class insert_user_data {
    public void insert_new_u(int id,String name,String pass){
         try{
            db con = new db();
            Connection in=con.get_connection();            
            Statement st = in.createStatement();
            st.executeUpdate("insert into user(id_u,username,password) values('"+id+"','"+name+"','"+pass+"')");
         }catch(Exception e){             System.out.println(e);
         }
     }
        
    
}
/*PreparedStatement ps=null;
         try {
         String query="insert into user(username,password) values(?,?)";
         ps.setString(1,name);
         ps.setString(2,pass);
         ps=in.prepareStatement(query);
         } catch (Exception e) {
             System.out.println(e); 
         }*/