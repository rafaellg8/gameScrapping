package com.gamecomparator;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.gamecomparator.model.CostumerDC;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
public class GameScrappingServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		        // we do not set content type, headers, cookies etc.
		        // resp.setContentType("text/html"); // while redirecting as
		        // it would most likely result in an IllegalStateException

		        // "/" is relative to the context root (your web-app name)
		        RequestDispatcher view = req.getRequestDispatcher("index.jsp");
		        // don't add your web-app name to the path

		        view.forward(req, resp);   
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
		      throws IOException {
		    System.out.println("Login");
		    User user = (User) req.getAttribute("user");
		    if (user == null) {
		      UserService userService = UserServiceFactory.getUserService();
		      user = userService.getCurrentUser();
		    }

		    CostumerDC.add(user.getNickname(),user.getEmail());
		    
		    resp.sendRedirect("index.jsp");
		  }

		  private String checkNull(String s) {
		    if (s == null) {
		      return "";
		    }
		    return s;
		  }
}
