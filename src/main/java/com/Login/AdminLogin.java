package com.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AdminLogin")
public class AdminLogin  extends HttpServlet {
	
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		PrintWriter out = res.getWriter();
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		try {
			if(DbOperationDao.validate(name, password)){
				RequestDispatcher requestDispatcherObj = req.getRequestDispatcher("UserDataDisplay.jsp");
				requestDispatcherObj.forward(req, res);
			}
			else {
				out.print("Admin username or password incorrect...");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.close();
	}
}
