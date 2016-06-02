package com.gamecomparator;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;


//import javax.servlet.RequestDispatcher;
//import javax.servlet.http.*;
//import com.ECS.client.jax.*;

import org.jsoup.Connection.Response;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
@SuppressWarnings("serial")
public class CMPServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	
    
		String urlPage = "https://www.game.es/videojuegos/juegos-pc-digital";  
    	System.out.println("HOLA");
        // Compruebo si me da un 200 al hacer la petición
        if (getStatusConnectionCode(urlPage) == 200) {
			
            // Obtengo el HTML de la web en un objeto Document2
            Document document = getHtmlDocument(urlPage);
			
            // Busco todas las historias de meneame que estan dentro de: 
            Elements entradas = document.select("col-sm-3 result-modul-grid");
			
            // Paseo cada una de las entradas
            for (Element elem : entradas) {
                String titulo = elem.getElementsByClass("tit-result").text();
                String genero = elem.getElementsByClass("type-result").toString();
//                String fecha = elem.getElementsByClass("fecha").text();
				
                System.out.println(titulo+"\n"+genero+"\n"+"\n");
				
            }
	
        }else{
            System.out.println("El Status Code no es OK es: "+getStatusConnectionCode(urlPage));
            
        }
        RequestDispatcher view = req.getRequestDispatcher("index.jsp");
    	// don't add your web-app name to the path

    	view.forward(req, resp);
    }
    


/**
 * Con esta método compruebo el Status code de la respuesta que recibo al hacer la petición
 * EJM:
 * 		200 OK			300 Multiple Choices
 * 		301 Moved Permanently	305 Use Proxy
 * 		400 Bad Request		403 Forbidden
 * 		404 Not Found		500 Internal Server Error
 * 		502 Bad Gateway		503 Service Unavailable
 * @param url
 * @return Status Code
 */
public static int getStatusConnectionCode(String url) {
	
    Response response = null;
	
    try {
        response = Jsoup.connect(url).userAgent("Mozilla/5.0").timeout(100000).ignoreHttpErrors(true).execute();
    } catch (IOException ex) {
        System.out.println("Excepción al obtener el Status Code: " + ex.getMessage());
    }
    return response.statusCode();
}


/**
 * Con este método devuelvo un objeto de la clase Document con el contenido del
 * HTML de la web que me permitirá parsearlo con los métodos de la librelia JSoup
 * @param url
 * @return Documento con el HTML
 */
public static Document getHtmlDocument(String url) {

    Document doc = null;

    try {
        doc = Jsoup.connect(url).userAgent("Mozilla/5.0").timeout(100000).get();
    } catch (IOException ex) {
        System.out.println("Excepción al obtener el HTML de la página" + ex.getMessage());
    }

    return doc;

}
}