<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.ArrayList,java.util.List"%>
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
<h1>Active User Data Display Here : </h1>
<%ResultSet rs=null; 
 rs=DbOperationDao.fetchUserData();	
 int id,activeArchive;
 String name,email,message;
%>
 <table>
  <tr>
    <th colspan="2">ID</th>
    <th colspan="2">Name</th>
    <th colspan="2">Email</th>
    <th colspan="2">Message</th>
    <th colspan="2">Button</th>
  </tr>  
  <%while(rs.next()){ %>
  <%  id=rs.getInt(4); 
      activeArchive=rs.getInt(5);
  	  name=rs.getString(1);
  	  email=rs.getString(2);
  	  message=rs.getString(3);
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
   <%}%>
  	<%} %>
  	</table>
<br/>  	
<br/>
<% rs=DbOperationDao.fetchUserData();%>
 <h1>Archive User Data Display Here : </h1>
  <table>
  <tr>
    <th colspan="2">ID</th>
    <th colspan="2">Name</th>
    <th colspan="2">Email</th>
    <th colspan="2">Message</th>
    <th colspan="2">Button</th>
  </tr>
  <%while(rs.next()){ %>
  <%  id=rs.getInt(4); 
      activeArchive=rs.getInt(5);
  	  name=rs.getString(1);
  	  email=rs.getString(2);
  	  message=rs.getString(3);
  %>
  	<%if(activeArchive==0){ %> 
  	<tr>
    <td class="tdata" colspan="2"><%= id %></td>
    <td class="tdata" colspan="2"><%= name %></td>
    <td class="tdata" colspan="2"><%= email %></td>
    <td class="tdata" colspan="2"><%= message %></td>
    <td class="tdata" colspan="2"> 
    	<form name="frm" action="archiveData">
    		<input type="hidden" value=<%=id%> name="id" >
    		<input type="submit" value=<%="Active"%> name="fromsubmit">
    	</form> 
    </td>
    </tr>  
   <%}%>
  	<%} %>
  </table>	
</body>
</html>