package com.gamecomparator.model;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.gamecomparator.PMF;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
/**
 * 
 * @author Rafael Lachica Garrido Clase auxiliar que añade un usuario al
 *         DataStore
 */
public class CostumerDC {
	public static void add(String username, String email, String password) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Costumer costumer = new Costumer(username, email,password);
			Key key = KeyFactory.createKey(Costumer.class.getSimpleName(), email + " " + username);
			costumer.setKey(key);
			costumer.toString();
			pm.makePersistent(costumer);
		} catch (Exception e) {
			System.out.println("Error al añadir usuario");
			System.err.println(e.getStackTrace());
		} finally {
			pm.close();
		}

	}

	public static void add(Costumer costumer) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Key key = KeyFactory.createKey(Costumer.class.getSimpleName(), costumer.getEmail()+ " "+ costumer.getName());
			costumer.setKey(key);
			pm.makePersistent(costumer);
		} catch (Exception e) {
			System.out.println("Error al añadir usuario");
			System.err.println(e.getStackTrace());
		} finally {
			pm.close();
		}

	}

	// public List<Costumer> getTodos(String username) {
	// EntityManager em = EMFService.get().createEntityManager();
	// Query q = em
	// .createQuery("select t from Todo t where t.author = :userId");
	// q.setParameter("userId", userId);
	// List<Todo> todos = q.getResultList();
	// return todos;
	// }

	/**
	 * Query que trae el objeto Costumer del datastore
	 * 
	 * @param username
	 *            nombre del usuario
	 * @return Costumer
	 */
	public static Costumer getCostumer(String usernameParam) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Costumer.class); //Declaramos la query
		q.setFilter("username == usernameParam");
		q.declareParameters("String usernameParam"); //Declaramos parametros
		q.setUnique(true); //trae solo un objeto
		Costumer result = null;
		
			result = (Costumer)q.execute(usernameParam); //nos trae de resultado el usuario
		
			q.closeAll();		
		return result;
	}
}
