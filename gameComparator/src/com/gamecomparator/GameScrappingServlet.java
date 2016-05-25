package com.gamecomparator;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class GameScrappingServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		        // we do not set content type, headers, cookies etc.
		        // resp.setContentType("text/html"); // while redirecting as
		        // it would most likely result in an IllegalStateException

		        // "/" is relative to the context root (your web-app name)
		        RequestDispatcher view = req.getRequestDispatcher("index.html");
		        // don't add your web-app name to the path

		        view.forward(req, resp);   
	}
}
