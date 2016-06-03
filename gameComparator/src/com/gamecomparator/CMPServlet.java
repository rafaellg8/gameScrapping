package com.gamecomparator;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

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

import com.gamecomparator.model.Costumer;
import com.gamecomparator.model.CostumerDC;
import com.gamecomparator.model.Game;
import com.gamecomparator.model.GameDC;
import com.sun.corba.se.impl.protocol.giopmsgheaders.RequestMessage;

/**
 * 
 * @author Rafael Lachica Garrido
 *
 * Clase para obtener objetos de es.gamesdeal.com
 */

@SuppressWarnings("serial")
public class CMPServlet extends HttpServlet {
	
	/**
	 * Metodo para obtener el titulo
	 * @param elem Elemento DOM sobre el que se buscar
	 * @return titulo
	 */
	private String getTitle(Element elem){
		Elements title = elem.getElementsByClass("product-name");
        Elements aux = title.get(0).getElementsByTag("a");
        String titulo = aux.get(0).text();
		return titulo;
	}
	/**
	 * Obtiene el link absoluto de la imagen
	 * @param elem Elemento DOM sobre el que buscar
	 * @return String con el link
	 */
	private String getImage(Element elem){
		Elements img = elem.select("img.lazy");
		return img.attr("data-src").toString();
		
	}
	
	private String getPrice (Element elem){
		return elem.getElementsByClass("special-price").get(0).getElementsByClass("price").get(0).text();
	}
	
	/**
	 * Obtener los videojuegos mas vendidos
	 * @param document documento DOM de una URL
	 * @return Array de Games más vendidos de la web
	 */
	private ArrayList<Game> getSellers(Document document){
		
		//Creamos el ArrayList de juegos
		ArrayList<Game> games = new ArrayList<>();
		
		//Hacemos un select anidado
        //Equivalente a div.show-orders.jm-product-list.best_buy.clearfix

        Element masVendidos = document.select("div.jm-product-list").
        		select("div.best_buy").
        		select("div.clearfix").get(0);

        
        // Busca cada una de las entradas en la lista de ese elemento
        for (Element elem :  masVendidos.getElementsByTag("li")) {
            String titulo = getTitle(elem);
            String linkImagen = getImage(elem);
            String precio = getPrice(elem);
            String genero = "Más Vendidos";
//            String fecha = elem.getElementsByClass("fecha").text();
			
            Game g = new Game(titulo,linkImagen,precio,genero);
            
            games.add(g);
        }
        return games;

	}
	
	/**
	 * Metodo Get devuelve a la pagina games.jsp y en la respuesta genera como atributo la lista de objetos
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	
		ArrayList<Game> games = null;
		String urlPage = "http://es.gamesdeal.com/";  
        // Compruebo si me da un 200 al hacer la petición
        if (getStatusConnectionCode(urlPage) == 200) {
			
            // Obtengo el HTML de la web en un objeto Document2
            Document document = getHtmlDocument(urlPage);
            games = this.getSellers(document);
            	
        }else{
            System.out.println("El Status Code no es OK es: "+getStatusConnectionCode(urlPage));
            
        }
        //Pasamos el array de games por los atributos de la respuesta
        req.setAttribute("game",games);
        RequestDispatcher view = req.getRequestDispatcher("games.jsp");
    	// don't add your web-app name to the path
    	view.forward(req, resp);
    }
	
	/**
	 * Se llama a guardar juegos para el Usuario en el DataStore
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		//Recibimos el objeto array de games a través de la sesion
		HttpSession session = req.getSession();
		if (session.getAttribute("games")!=null){
		@SuppressWarnings("unchecked")
		Game game = (Game)session.getAttribute("games");
		
		//Añadir objetos al datastore
		
			Costumer aux = CostumerDC.getCostumer((String) req.getSession().getAttribute("user"));
			game.setCostumer(aux.getName());
			GameDC.add(game);
		
		}
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");  
		out.println("<script type=\"text/javascript\">");
		out.println("window.alert('Games added');");
		out.println("location='/games';");
		out.println("</script>");
		
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