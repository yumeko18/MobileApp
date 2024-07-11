package com.jumstart.Entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class Product {
	
	  @Id
	  @Column(name="product_id")
	  @GeneratedValue(strategy= GenerationType.IDENTITY)
	  private Long id;
	  
	  
	  @Column(name="Item_Name")
	  private String itemName;
	  
	  @Column(name="price")
	  private Integer price;
	  
	  @Column(name="category")
	  private String category;
	  
	  @Column(name="madeIn")
	  private String madeIn;
	  
	  @Column(name="description")
	  private String description;
	  
	  @Column(name="stock")
	  private String stock;
	  
	  
	  @Column(nullable = true, length = 64)
	  private String photos;

	   @Column(nullable = true, length = 64)
	   private String photoImagePath;
	   
	   
	  @CreatedDate
	  private String postDate;

	  @PrePersist
	  private void onCreate() {

		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		postDate = dateOnly.format(new Date());

	}
	  private Long sellerId;
	  
		@Column(name="sell_Status")
		private String sellStatus;
		
		

		@Override
		public String toString() {
			return "Product [id=" + id + ", itemName=" + itemName + ", price=" + price + ", category=" + category
					+ ", madeIn=" + madeIn + ", description=" + description + ", stock=" + stock + ", photos=" + photos
					+ ", photoImagePath=" + photoImagePath + ", postDate=" + postDate + ", sellerId=" + sellerId
					+ ", sellStatus=" + sellStatus + "]";
		}

		public Product(Long id, String itemName, Integer price, String category, String madeIn, String description,
				String stock, String photos, String photoImagePath, String postDate, Long sellerId, String sellStatus) {
			super();
			this.id = id;
			this.itemName = itemName;
			this.price = price;
			this.category = category;
			this.madeIn = madeIn;
			this.description = description;
			this.stock = stock;
			this.photos = photos;
			this.photoImagePath = photoImagePath;
			this.postDate = postDate;
			this.sellerId = sellerId;
			this.sellStatus = sellStatus;
		}

		public Product() {
			super();
			// TODO Auto-generated constructor stub
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

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getMadeIn() {
			return madeIn;
		}

		public void setMadeIn(String madeIn) {
			this.madeIn = madeIn;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getStock() {
			return stock;
		}

		public void setStock(String stock) {
			this.stock = stock;
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

		public String getPostDate() {
			return postDate;
		}

		public void setPostDate(String postDate) {
			this.postDate = postDate;
		}

		public Long getSellerId() {
			return sellerId;
		}

		public void setSellerId(Long sellerId) {
			this.sellerId = sellerId;
		}

		public String getSellStatus() {
			return sellStatus;
		}

		public void setSellStatus(String sellStatus) {
			this.sellStatus = sellStatus;
		}

	
	  
	  	

}
