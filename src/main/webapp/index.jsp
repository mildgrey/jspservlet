<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    DbOperationDao.uploadUserInfo(name, email, message);
%>
<jsp:include page="/AdminLogin.jsp"></jsp:include>
</body>
</html>