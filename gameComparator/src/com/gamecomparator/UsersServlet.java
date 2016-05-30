package com.gamecomparator;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.gamecomparator.model.Costumer;
import com.gamecomparator.model.CostumerDC;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import javax.servlet.http.HttpSession;

import org.apache.geronimo.mail.util.SessionUtil;


@SuppressWarnings("serial")
public class UsersServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		        // we do not set content type, headers, cookies etc.
		        // resp.setContentType("text/html"); // while redirecting as
		        // it would most likely result in an IllegalStateException

		        // "/" is relative to the context root (your web-app name)
		        RequestDispatcher view = req.getRequestDispatcher("login.jsp");
		        // don't add your web-app name to the path

		        view.forward(req, resp);   
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
		      throws IOException {
		    System.out.println("Login o registro de usuarios");
		    //Si existe el usuario lo logeamos sino contraseña incorrecta
		    Costumer login = CostumerDC.getCostumer(req.getParameter("username"));
		    if (login.isPassword(req.getParameter("password"))){ //Si coinciden contraseñas logueamos
		    	HttpSession session = req.getSession(true);
		    	
		    	session.setAttribute("user", login.getName());
		    }
		    else{
		    	resp.sendRedirect("index.jsp");
		    }
		    //Si el usuario no se logueo es que quiere registrarse
//		    else{
//		    Costumer costumer = new Costumer(req.getParameter("username"),
//					req.getParameter("email"),
//					req.getParameter("password"));
//		    //Aañadimos el usuario al datastore
//			CostumerDC.add(costumer);	
//		    
//			req.setAttribute("user", req.getParameter("username")); //Creamos variable en sesion del usuario
//		    }
		    resp.sendRedirect("index.jsp");
		  }

		  private String checkNull(String s) {
		    if (s == null) {
		      return "";
		    }
		    return s;
		  }
}
