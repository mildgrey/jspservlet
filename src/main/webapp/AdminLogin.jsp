<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="index.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Form</title>
<style>
	input[type=submit]{
	background-color:red;
	color:black;
	font-size:large;
	font-weight:bold;
	}
</style>
</head>
<body>
<div>
<h1>Admin Welcome</h1>
  <form action="AdminLogin">
    <label for="fname">Name</label>
    <input type="text" id="name" name="name" placeholder="Your name..">
    <label for="lname">Password</label>
    <input type="password" id="password" name="password" placeholder="Your password..">
    <input type="submit" value="Submit">
  </form>
</div>
</body>
</html>