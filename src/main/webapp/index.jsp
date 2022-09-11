<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.SQLException" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import="com.Login.DbOperationDao"%>
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
%>

<%
    DbOperationDao.uploadUserInfo(name, email, message);
%>



</body>
</html>