package com.Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/archiveData")
public class archiveData  extends HttpServlet{
	public  void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int id=Integer.parseInt(req.getParameter("id"));
		String fromsubmit = req.getParameter("fromsubmit"); 
		if(fromsubmit.equals("Archive")) {
			DbOperationDao.activeArchive(id,0);
		}
		else {
			DbOperationDao.activeArchive(id,1);
		}
		RequestDispatcher RequetsDispatcherObj =req.getRequestDispatcher("/UserDataDisplay.jsp");
		RequetsDispatcherObj.forward(req, res);
	}
}
