package com.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class archiveActiveData {
	public static final String DRIVER = "org.postgresql.Driver";
	public static final String USER_NAME = "postgres";
	public static final String USER_PASSWORD = "Root@2022"; 
	public static final String URL = "jdbc:postgresql://localhost:5432/";
	public static Connection dbConnection=null;
	public static int globalId=0;
	public static int fetchId=0;
	

	public static ResultSet fetchActiveData(int id) throws SQLException{
		String databaseName="ContactUs";
		String deleteQuery,fetchQuery;
		fetchQuery = "SELECT * FROM userdata";
		deleteQuery = "DELETE FROM userdata WHERE id='"+id+"'";
		ResultSet rs=null;
		try {
			Class.forName(DRIVER);
			dbConnection = DriverManager.getConnection(URL+databaseName,USER_NAME,USER_PASSWORD);
			
			PreparedStatement pst=dbConnection.prepareStatement(deleteQuery);
			pst.executeUpdate();
			pst.close();
			Statement st = dbConnection.createStatement();
			rs=st.executeQuery(fetchQuery);
			return rs;
		}catch(Exception e) {
			e.getMessage();
		}
		return rs;	
	}
	

}
