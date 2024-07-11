package com.jumstart.Entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class Cart {
	
	 @Id
	 @Column(name="cart_id")
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Long id;
	 
	 @Column(name="Item_name")
	 private String itemName;
	 
	 @Column(name="price")
	 private Integer price;
		
	 @Column(nullable = true, length = 64)
	 private String photos;

	 @Column(nullable = true, length = 64)
	 private String photoImagePath;
	
	 @CreatedDate
		private String cartDate;


		@PrePersist
		private void onCreate() {

			DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

			cartDate = dateOnly.format(new Date());

		}
		
		

	 @ManyToOne(cascade = { CascadeType.DETACH }) // Configure cascade type to DETACH
	 @JoinColumn(name = "product_id")
	 private Product products;
	 
	 
	 @ManyToOne(fetch = FetchType.EAGER)
	 @JoinColumn(name = "user_id")
	 private User user;


	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Cart(Long id, String itemName, Integer price, String photos, String photoImagePath, Product products,
			User user) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.price = price;
		this.photos = photos;
		this.photoImagePath = photoImagePath;
		this.products = products;
		this.user = user;
	}


	@Override
	public String toString() {
		return "Cart [id=" + id + ", itemName=" + itemName + ", price=" + price + ", photos=" + photos
				+ ", photoImagePath=" + photoImagePath + ", products=" + products + ", user=" + user + "]";
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public String getPhotos() {
		return photos;
	}


	public void setPhotos(String photos) {
		this.photos = photos;
	}


	public String getPhotoImagePath() {
		return photoImagePath;
	}


	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}


	public Product getProducts() {
		return products;
	}


	public void setProducts(Product products) {
		this.products = products;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getCartDate() {
		return cartDate;
	}


	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	 

}
