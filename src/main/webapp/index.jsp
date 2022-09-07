<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.SQLException" %>
<%@page import = "java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Data into Database</title>
</head>
<body>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String message=request.getParameter("message");
	
	String driverName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost:5432/";
	String dbName = "ContactUs";
	String user = "postgres";
	String password = "Root@2022";
	
	try{
		Class.forName(driverName);
	}catch(Exception e){
		System.out.println("Wrong in driver:");
		e.getMessage();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
%>
<%= name %>
<%
	String query = "INSERT INTO userdata(name,email,message) VALUES('"+name+"','"+email+"','"+message+"')";

	try{
		Connection con = DriverManager.getConnection(url+dbName,user,password);
		Statement st = con.createStatement();
		st.executeUpdate(query);
		
	}catch (SQLException e){
		System.out.print(e);
		e.getMessage();
	}
%>

</body>
</html>