package com.gamecomparator;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.gamecomparator.model.Costumer;
import com.gamecomparator.model.CostumerDC;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import javax.servlet.http.HttpSession;


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
		    //Logueo 
		    if (req.getAttribute("login").equals(true)){		      
		    	  //Traemos la query y comprobamos el usuario
		      	  Costumer result = CostumerDC.getCostumer(req.getParameter("username")); //Query para el usuario
		      	  if (result.isPassword(req.getParameter("password"))) {//Comprobamos contraseña
		      		//Si es correcta abrimos la sesion
		      		  req.setAttribute("user",result); //Abrimos la sesion con el objeto
		      	  }
		    }
		    //Si el usuario no se logueo es que quiere registrarse
		    else{
		    Costumer costumer = new Costumer(req.getParameter("username"),
					req.getParameter("email"),
					req.getParameter("password"));
		    //Aañadimos el usuario al datastore
			CostumerDC.add(costumer);	
		    
			req.setAttribute("user", req.getParameter("username")); //Creamos variable en sesion del usuario
		    }
		    resp.sendRedirect("index.jsp");
		  }

		  private String checkNull(String s) {
		    if (s == null) {
		      return "";
		    }
		    return s;
		  }
}
