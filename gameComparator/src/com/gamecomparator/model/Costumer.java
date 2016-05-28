package com.gamecomparator.model;

/**
 * @author Rafael Lachica Garrido
 * Clase Modelo Cliente
 */
import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class Costumer {
	
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
	
    @Persistent
    private String username;
	
    @Persistent
    private String email;
	

	public Costumer(String username2, String email2) {
		this.setName(username2);
		this.setEmail(email2);	}

	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

	public String getName() {
		return username;
	}

	public void setName(String name) {
		this.username = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}