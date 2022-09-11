package com.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbOperationDao {
	public static final String DRIVER = "org.postgresql.Driver";
	public static final String USER_NAME = "postgres";
	public static final String USER_PASSWORD = "Root@2022"; 
	public static final String URL = "jdbc:postgresql://localhost:5432/";
	public static Connection dbConnection=null;
	public static int globalId=0;
	public static int fetchId=0;
	public static boolean validate(String name,String pass) throws SQLException{  
		String databaseName="AdminDB";
		boolean status=false;
		try{  
			Class.forName(DRIVER);
			dbConnection = DriverManager.getConnection(URL+databaseName,USER_NAME,USER_PASSWORD);
			String query = "SELECT * FROM adminuser where name=? and password=?";
			PreparedStatement pst=dbConnection.prepareStatement(query);  
			pst.setString(1,name);  
			pst.setString(2,pass);       
			ResultSet rs=pst.executeQuery();  
			status=rs.next(); 
			pst.close();
			dbConnection.close();
		}
		catch(Exception e){
			System.out.println(e);
		}  
		return status;  
	}  
	public static void uploadUserInfo(String name,String email,String message) throws SQLException {
		String databaseName="ContactUs";
		String query = "INSERT INTO userdata(name,email,message) VALUES('"+name+"','"+email+"','"+message+"')";
		try{
			Class.forName(DRIVER);
			dbConnection = DriverManager.getConnection(URL+databaseName,USER_NAME,USER_PASSWORD);
			PreparedStatement pst = dbConnection.prepareStatement(query);
			pst.executeUpdate();
			pst.close();
			System.out.println("Data is successfully Uploaded in data base");			
		}
		catch (Exception e){
			System.out.print(e);
			e.getMessage();
			System.out.println("Error in data base connection");
		}
		
	}
	
	public static ResultSet fetchUserData() throws SQLException{
		String databaseName="ContactUs";
		String query;
		query = "SELECT * FROM userdata";
		
		ResultSet rs=null;
		try {
			Class.forName(DRIVER);
			dbConnection = DriverManager.getConnection(URL+databaseName,USER_NAME,USER_PASSWORD);
			Statement st = dbConnection.createStatement();
			rs=st.executeQuery(query);
			return rs;
		}catch(Exception e) {
			e.getMessage();
		}
		return rs;	
	}
	
	public static void activeArchive(int id,int activeArchive) {
		String databaseName="ContactUs";
		String query;
		query = "UPDATE userdata SET activeArchive='"+activeArchive+"' WHERE id='"+id+"'";
		try {
			Class.forName(DRIVER);
			dbConnection = DriverManager.getConnection(URL+databaseName,USER_NAME,USER_PASSWORD);
			PreparedStatement pst = dbConnection.prepareStatement(query);
			pst.executeUpdate();
		}catch(Exception e) {
			e.getMessage();
		}
	}
	
}
