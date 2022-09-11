<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@page import = "com.Login.DbOperationDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Data Display</title>
<style>
table, th, td {
  border: 1px solid black;
}</style>
</head>
<body>
<h1>User Data Display Here : </h1>
<%ResultSet rsUser=null,rsArchive=null; %>
 
<%rsUser=DbOperationDao.fetchUserData();%>
 
  <table>
  <tr>
    <th colspan="2">ID</th>
    <th colspan="2">Name</th>
    <th colspan="2">Email</th>
    <th colspan="2">Message</th>
    <th colspan="2">Button</th>
  </tr>
  
  <%while(rsUser.next()){ %>
  
  <% int id=rsUser.getInt(4); 
     int activeArchive=rsUser.getInt(5);
  	 String name=rsUser.getString(1);
  	 String email=rsUser.getString(2);
  	 String message=rsUser.getString(3);
  	 %>
  	<%if(activeArchive==1){ %> 
  	<tr>
    <td class="tdata" colspan="2"><%= id %></td>
    <td class="tdata" colspan="2"><%= name %></td>
    <td class="tdata" colspan="2"><%= email %></td>
    <td class="tdata" colspan="2"><%= message %></td>
    <td class="tdata" colspan="2"> <form name="frm" action="archiveData">
    		<input type="hidden" value=<%=id%> name="id" >
    		<input type="submit" value=<%="Archive"%> name="fromsubmit">
    		
    		</form> </td>
    </tr>
   <%} else {%>
   <tr>
    <td class="tdata" colspan="2"><%= id %></td>
    <td class="tdata" colspan="2"><%= name %></td>
    <td class="tdata" colspan="2"><%= email %></td>
    <td class="tdata" colspan="2"><%= message %></td>
    <td class="tdata" colspan="2"> <form name="frm" action="archiveData">
    		<input type="hidden" value=<%=id%> name="id" >
    		<input type="hidden" value=<%=activeArchive%> name="activeArchive" >
    		<input type="submit" value=<%="Active"%> name="fromsubmit">
    		
    		</form> </td>
    </tr>
   <%} %>
   <%}%>
</table>
 
</body>
</html>