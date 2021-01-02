/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class db {
        public static void main(String[] args) {
	db obj_DB_Connection=new db();
	obj_DB_Connection.get_connection();
}
public Connection get_connection(){
	Connection con=null;
        String uname="root";
        String pword="root";
        String url="jdbc:mysql://localhost:3306/demo";
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url,uname, pword);
	} catch (Exception e) {
		System.out.println(e);
	}
		return con;
	}

    PreparedStatement PreparedStatement(String query) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
 
    }
    