package com.capgemini.bankapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "helloWorld", loadOnStartup = 1, urlPatterns = {"/hello","/helloWorld","/login"})
public class HelloWorldController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HelloWorldController() {
	//System.out.println("Object is Created");

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("Hello world");//This will print hello world on server console.

		PrintWriter out = response.getWriter();
		out.println("Hello World!!!!");
		
		out.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		if(username.equals("root") && password.equals("root@123")) {
			out.println("<h2>Login Successfull. WELCOME!!!!!"  +username + "</h2>");
		}else
			out.println("<h2>Inavalid username or Password</h2>");
		
		
	}
	

}
