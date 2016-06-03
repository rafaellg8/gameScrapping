package com.gamecomparator.model;

import java.util.List;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

import javax.jdo.annotations.ForeignKey;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import org.apache.tools.ant.taskdefs.Javac.ImplementationSpecificArgument;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable
public class Game implements Serializable{
	
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
	
    @Persistent
    private String name;
	
    @Persistent
    private String price;
	
    @Persistent
    private Date dateRelease;
    
    @Persistent
    private String image;
    
    @Persistent
    private String category;
    
    @Persistent
    private String costumer; //Usuario que pone los juegos como favoritos

    public String getCostumer() {
		return costumer;
	}

	public void setCostumer(String string) {
		this.costumer = string;
	}

	public Game(String titulo, String linkImagen, String price, String category) {
		this.name = titulo;
		this.image = linkImagen;
		this.price = price;
		this.category = category;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Rating> getRatings() {
		return ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	@Persistent
    private List<Rating> ratings = new ArrayList<Rating>(); //Lista de califiacones

	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Date getDateRelease() {
		return dateRelease;
	}

	public void setDateRelease(Date dateRelease) {
		this.dateRelease = dateRelease;
	}

	public List<Rating> getRating() {
		return ratings;
	}

	public void setRating(Rating rating) {
		this.ratings.add(rating);
	}
	
}