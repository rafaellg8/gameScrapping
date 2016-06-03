package com.gamecomparator;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecomparator.model.Costumer;
import com.gamecomparator.model.CostumerDC;

@SuppressWarnings("serial")
public class UsersServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// we do not set content type, headers, cookies etc.
		// resp.setContentType("text/html"); // while redirecting as
		// it would most likely result in an IllegalStateException

		// "/" is relative to the context root (your web-app name)
		RequestDispatcher view = req.getRequestDispatcher("index.jsp");
		// don't add your web-app name to the path

		view.forward(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		if (req.getParameter("check") != null){ // Si esta el checkbox es de la parte del registro
			Register(req, resp); // Redirecciono al registro
		}

		// Si existe el usuario lo logeamos sino contraseña incorrecta
		Costumer login = CostumerDC.getCostumer(req.getParameter("username"));
		if (login != null) {
			//Solo registro no se introduce el email
			if (login.isPassword(req.getParameter("password")) && req.getParameter("email")==null) { // Si
																	// coinciden
																	// contraseñas
																	// logueamos
				HttpSession session = req.getSession(true);
				session.setAttribute("user", login.getName());
				resp.sendRedirect("home.jsp");
			} else {
				// resp.sendError(0, "Contrase�a incorrecta o usuario no
				// registrado");
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");
				out.println("window.alert('User or password incorrect');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}
		} else {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");
			out.println("window.alert('No registered user');");
			out.println("location='index.jsp';");
			out.println("</script>");
		}
	}

	public void Register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Costumer costumer = new Costumer(req.getParameter("username"), req.getParameter("email"),
				req.getParameter("password"));
		//Compbrobamos que el usario no esta en la base de datos
		if (CostumerDC.getCostumer(req.getParameter("username"))==null){
			// A�adimos el usuario al datastore
		CostumerDC.add(costumer);
		req.setAttribute("session", "open");
		// Abrimos la sesion al usuario
		// doPost(req,resp);
		resp.sendRedirect("index.jsp");
		}
		else{
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");
			out.println("window.alert('Use a different username please');");
			out.println("location='index.jsp';");
			out.println("</script>");
			resp.reset();
		}
	}
}