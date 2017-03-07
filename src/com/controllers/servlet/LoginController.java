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

import com.dao.util.UserDao;
import com.model.dao.LoginModel;

@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static String EDITPG= "/edit.jsp";
	private static String ADMINPG= "/admin.jsp";
	private static String WELCMPG= "/welcome.jsp";
	//private static String REGISTPG= "/registration.jsp";
	private UserDao dao;	
	
	public LoginController()
	{
		super();
		dao = new UserDao();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		String redirectPage="/index.jsp";
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("remove"))
		{
			int userid = Integer.parseInt(request.getParameter("userid"));
			dao.deleteAccount(userid);
			redirectPage= ADMINPG;
			request.setAttribute("users", dao.listUsers());
		}
		
		else if(action.equalsIgnoreCase("listUsers"))
		{
			redirectPage= ADMINPG;
			request.setAttribute("users", dao.listUsers());
		}
		
		else if(action.equalsIgnoreCase("edit"))
		{
			redirectPage= EDITPG;
			int userid = Integer.parseInt(request.getParameter("userid"));
			LoginModel user = dao.getUserByID(userid);
			request.setAttribute("user", user);
		}
		
//		else if(action.equalsIgnoreCase("register"))
//		{
//			redirectPage= REGISTPG;
//		}
		
		RequestDispatcher view = request.getRequestDispatcher(redirectPage);
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter pwOut = response.getWriter(); 
				
		String em=request.getParameter("email");
		String pw =request.getParameter("psword");
		
		
	
		if(dao.validateLogin(em, pw))
		{
			LoginModel user= dao.userSession(em);
			HttpSession session = request.getSession();
	        session.setAttribute("username", user.getUsername());
	        session.setAttribute("email", em);
			RequestDispatcher view = request.getRequestDispatcher(WELCMPG);		
			view.forward(request, response);
			
		}
		else
		{
			pwOut.print("<p style=\"color:red\">Incorrect Username or Password!</p>");
			RequestDispatcher view = request.getRequestDispatcher("/index.jsp");		
			view.include(request, response);
		
		}
	
		pwOut.close();
		
	}
}
