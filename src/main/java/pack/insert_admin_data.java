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
public class insert_admin_data {
    public void insert_new_a(int id,String name,String pass,String mid_name){
         try{
            db con = new db();
            Connection in=con.get_connection();            
            Statement st = in.createStatement();
            //String query="CREATE TABLE `demo`.`"+id+"`(`id_m` INT NOT NULL,`drug` VARCHAR(45) NOT NULL,`count` INT NOT NULL)";
            st.executeUpdate("insert into admin(id_a,username,password,mid_name) values('"+id+"','"+name+"','"+pass+"','"+mid_name+"')");
            //st.executeUpdate(query);
            //st.executeUpdate("insert into demo.`"+id+"`(id_m,drug,count) values('0','check','2')");
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