package com.gamecomparator.model;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.SecretKeySpec;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Unique;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.labs.repackaged.com.google.common.hash.HashFunction;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@PersistenceCapable
public class Costumer {
	
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
	
    @Persistent
    @Unique
    private String username;
	
    @Persistent
    private String email;

    @Persistent
    private String password;

	public Costumer(String username2, String email2, String password) {
		this.setName(username2);
		this.setEmail(email2);
		this.setPassword(password);
	}

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
	
	public void setPassword(String pass){
		//Codificamos el password y encriptamos
		this.password = pass;
		encrypt();
	}
	
	public boolean isPassword(String pass){
		return isEqualPassword(pass);
	}
	
	/**
	 * Funcion para encriptar las contraseñas
	 */
	private void encrypt(){
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(this.password.getBytes());
			this.password =  new String(messageDigest.digest());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * Funcion para comprobar las contraseñas son correctas
	 * @return true o false dependiendo de si las contraseñas son o no correctas
	 */
	private Boolean isEqualPassword(String value){
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(value.getBytes());
			value = new String (messageDigest.digest()); //Encriptamos
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Comprobamos que las contraseñas sean iguales
		if (value.equals(this.password))
			return true;
		else
			return false;
		
	}

}