package com.jumstart.Entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name="order_table")
public class Order {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	 @Column(name="user_name")
	private String userName;
	 
	 @Column(name="order_name")
	private String orderName;
	 
	 @Column(name="order_price")
	private Integer orderPrice;
	 
	 @Column(name="order_address")
	private String address;
	 
	 @Column(name="order_status")
	 private String orderStatus;
	 
	 @Column(name="deliveryDate")
	 private String deliveryDate;
	 
	 @Column(nullable = true, length = 64)
	  private String photos;

	   @Column(nullable = true, length = 64)
	   private String photoImagePath;
	   
	   
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

	public void setProduct(Product product) {
		this.product = product;
	}
	@CreatedDate
	private String orderDate;


	@PrePersist
	private void onCreate() {

		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		orderDate = dateOnly.format(new Date());

	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	   private String currency = "USD";
	    private String method = "Paypal";
	    private String intent = "sale";
	    private String description = "Payment";
	
	
	

	public String getDeliveryDate() {
			return deliveryDate;
		}

		public void setDeliveryDate(String deliveryDate) {
			this.deliveryDate = deliveryDate;
		}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Long id, String userName, String orderName, Integer orderPrice, String address, String orderStatus,
			String orderDate, Product product, User user) {
		super();
		this.id = id;
		this.userName = userName;
		this.orderName = orderName;
		this.orderPrice = orderPrice;
		this.address = address;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.product = product;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public Integer getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Product getProduct() {
		return product;
	}

	public void setMeal(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", userName=" + userName + ", orderName=" + orderName + ", orderPrice=" + orderPrice
				+ ", address=" + address + ", orderStatus=" + orderStatus + ", orderDate=" + orderDate + ", product="
				+ product + ", user=" + user + "]";
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getIntent() {
		return intent;
	}

	public void setIntent(String intent) {
		this.intent = intent;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	
}
