package com.jumstart.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jumstart.Entities.Cart;
import com.jumstart.Entities.Order;
import com.jumstart.Entities.Product;
import com.jumstart.Entities.User;
import com.jumstart.Service.CartService;
import com.jumstart.Service.OrderService;
import com.jumstart.Service.ProductService;
import com.jumstart.Service.UserService;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService prodService;
	
	@Autowired
	private OrderService orderService;
	
	@PostMapping("/product_detail/{cid}/addToCart")
	public String addToCart(@PathVariable long cid,Model model,Cart cart,Principal principal) {
		
		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		
		Optional<Product> product_info = prodService.getProductInfo(cid);
		System.out.println(product_info);
		
		Product productdata =product_info.get();
		
		cart.setUser(user);
		cart.setProducts(productdata);
		cart.setItemName(productdata.getItemName());
		cart.setPrice(productdata.getPrice());
		cart.setPhotoImagePath(productdata.getPhotoImagePath());
		cart.setPhotos(productdata.getPhotos());
		
		cartService.save(cart);
		
		  System.out.println("ADDED TO CART ---------------------------: " + cart);
		
		return "redirect:/product_detail?cid=" + cid;
	}
	
//	@GetMapping("delete_cart")
//    public String deleteCartProduct(@RequestParam long id) {
//
//    	
//    	cartService.deleteCartById(id);
//    	
//    	
//		  System.out.println("Successfully Deleted---------------------------: " + id);
//    	
//    	return "profile";
//    }
	@GetMapping("delete_cart")
	public String deleteCartProduct(@RequestParam long id) {
	    Optional<Cart> cartOptional = cartService.getCartById(id);
	    
	    if (cartOptional.isPresent()) {
	        Cart cart = cartOptional.get();
	        cartService.deleteCartById(id);
	        System.out.println("Successfully Deleted: " + id);
	    } else {
	        System.out.println("Cart with ID " + id + " does not exist.");
	    }
	    
	    return "redirect:/cart";
	}
	@GetMapping("delete_order")
	public String deleteOrderProduct(@RequestParam long id) {
	    Optional<Order> orderOptional = orderService.getOrderById(id);
	    
	    if (orderOptional.isPresent()) {
	        Order order = orderOptional.get();
	        orderService.deleteOrderById(id);
	        System.out.println("Successfully Deleted: " + id);
	    } else {
	        System.out.println("Order with ID " + id + " does not exist.");
	    }
	    
	    return "redirect:/profile";
	}
	
	@PostMapping("ordering-cart")
	public String productOrder(@ModelAttribute("order") Order order,
			@RequestParam(value = "cid", required = false) long id, Principal principal, 
			Model model, @RequestParam("orderAddress") String address) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		

		// get Meal
		Optional<Cart> cart_info = cartService.getCartById(id);
		System.out.println(cart_info);

		Cart cartdata = cart_info.get();


		order.setUser(user);
		order.setUserName(user.getUserName());
		order.setOrderName(cartdata.getItemName());
		order.setOrderStatus(cartdata.getProducts().getSellStatus());
		order.setOrderPrice(cartdata.getPrice());
//		order.getOrderPrice(productdata.getPrice());
		order.setPhotoImagePath(cartdata.getPhotoImagePath());
		order.setPhotos(cartdata.getPhotos());
		order.setAddress(address);
		order.setProduct(cartdata.getProducts());
		
		orderService.saveOrder(order);
		
		
		
		List<Order> orders = new ArrayList<Order>();

		orders.add(order);	
		
	    model.addAttribute("orders", orders);
		


		// before saving, check if user has placed a bidding before to add booking date
//		List<Order> userOrder = orderService.findUserOrder(user, productdata);
//		System.out.println(userOrder);
//
//		if (userOrder.size() > 0) {
//
//			long bookId = userOrder.stream().findAny().get().getId();
//			Optional<Order> book_info = orderService.getOrderInfo(bookId);
//			System.out.println(book_info);
//
//			Order bookdata = book_info.get();
//			
//			bookdata.setAddress(address);
//
//			orderService.saveOrder(bookdata);
//		} else {
//			
//			orderService.saveOrder(order);
//		}

		// show car data

//		List<Product> product = new ArrayList<Product>();
//
//		product.add(productdata);
//
//		model.addAttribute("product", product);

		// show bidding data
//		Predicate<Order> byProduct = uproduct -> uproduct.getProduct().equals(productdata);

//		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
//		System.out.println(bdata);
//
//		model.addAttribute("bid", bdata);
//
//		if (bdata.size() > 0) {
//			double highest = bdata.get(0).getBidderPrice();
//			System.out.println(highest);
//			model.addAttribute("highest", highest);
//		}
//		
//		Set<CarBidding> highBid = new HashSet<CarBidding>();
//		highBid.add(bdata.get(0));
//		
//		//cardata.getBiddings().clear();
//		cardata.setBiddings(highBid);
//		carService.save(cardata);
//		System.out.println(cardata.getBiddings());
		

		return "PaypalPayment";
	}
}
