package com.controllers.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.util.UserDao;
import com.model.dao.LoginModel;

@WebServlet(name = "Register", urlPatterns = { "/Register" })
public class RegisterController extends HttpServlet{	
	private static final long serialVersionUID = 1L;	
	private static String ADMINPG= "/admin.jsp";
	//private static String WELCMPG= "/welcome.jsp";	
	private UserDao dao;	

	public RegisterController() {
		super();
		dao = new UserDao();
		
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		LoginModel user = new LoginModel();		
		PrintWriter pwOut= response.getWriter();
		String un=request.getParameter("username");		
		String pw =request.getParameter("psword");
		String email=request.getParameter("email");
		String userID = request.getParameter("userid");		
		user.setUsername(un);			
		user.setPsword(pw);
		user.setEmail(email);
		
		if(userID==null||userID.isEmpty())
		{
			dao.createUser(user);				
			pwOut.print("Registration Successful! Please Login.");
			response.setContentType("text/html");
			RequestDispatcher view = request.getRequestDispatcher("/index.jsp");		
			view.include(request, response);
		}
		else
		{
			user.setUserID(Integer.parseInt(userID));			
			dao.editAccount(user);
			request.setAttribute("users",dao.listUsers());
			RequestDispatcher view = request.getRequestDispatcher(ADMINPG);		
			view.forward(request, response);
		}				
			
	}

}
