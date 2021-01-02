/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

/**
 *
 * @author balaji
 */
import pack.db.*;
import java.sql.*;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
public class check_user {
        public boolean check_user(String name){
            try {
                db con = new db();
                Connection in=con.get_connection();
                Statement st = in.createStatement();
                ResultSet rs_u=st.executeQuery("select * from user");
                boolean i=true;
                while(rs_u.next()){
                    if(name.equals(rs_u.getString(1)))
                        return false;
                    else
                        return true;
                }
            } catch (SQLException ex) {
                Logger.getLogger(check_user.class.getName()).log(Level.SEVERE, null, ex);
            }
            return true;
}
}

