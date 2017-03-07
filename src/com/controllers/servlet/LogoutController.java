package com.controllers.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout", urlPatterns = { "/Logout" })
public class LogoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter pwOut = response.getWriter(); 
		
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		pwOut.print("You have successfully logged out");
		response.setContentType("text/html");
		//request.getRequestDispatcher("/index.jsp").include(request, response);
		RequestDispatcher view = request.getRequestDispatcher("/index.jsp");		
		view.include(request, response);
		pwOut.close();
	}
}
