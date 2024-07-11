package com.jumstart.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumstart.Entities.Order;
import com.jumstart.Entities.Product;

import com.jumstart.Entities.User;

import com.jumstart.Service.OrderService;
import com.jumstart.Service.ProductService;
import com.jumstart.Service.UserService;

@Controller
public class ProductController {
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService prodService;
	

	
	@Autowired
	private OrderService orderService;
	

	
	
	@GetMapping("/")
	public String handleRootRequest(Model model) {
		return "redirect:products";
	}
	
	@GetMapping("products")
	public ModelAndView viewProducts(@ModelAttribute("product") Product product) {

		List<Product> products = prodService.getAllProducts();
		System.out.println(products);

		return new ModelAndView("viewProducts", "products", products);
	}
	
	@GetMapping("Product_detail")
	public String viewMealDetail(@RequestParam long cid, Model model) {

		Optional<Product> product_info = prodService.getProductInfo(cid);
		System.out.println(product_info);

		Product productdata = product_info.get();

		List<Product> product = new ArrayList<Product>();

		product.add(productdata);

		model.addAttribute("product", product);

		return "ProductDetail";
	}
	
	@PostMapping("product_post")
	public String saveMeal(@ModelAttribute("product") Product product, RedirectAttributes ra,
			@RequestParam("fileImage") MultipartFile multipartFile, Principal principal) throws IOException {

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

		product.setPhotos(fileName);

		Product savedProduct = prodService.save(product);

		String uploadDir = "./src/main/resources/static/images/car-photo/" + savedProduct.getId();

		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);

		}

		product.setPhotoImagePath("/images/car-photo/" + savedProduct.getId() + "/" + savedProduct.getPhotos());

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);


		prodService.save(product);

		ra.addFlashAttribute("success_post", "Post has been saved successfully");

		return "redirect:products";
	}
	
	@GetMapping("all_product")
	public ModelAndView showAllCar(@ModelAttribute("product") Product product) {
		
		List<Product> products = prodService.getAllProducts();
		System.out.println(products);
		
		return new ModelAndView ("allProduct", "products", products);
	}
	
	@PostMapping("edit_product")
	public String editMeal(@ModelAttribute("product") Product product, 
			@RequestParam long cid) {
		
		Optional<Product> product_info = prodService.getProductInfo(cid);
    	System.out.println(product_info);
    	
    	Product edit_product = product_info.get();
    	edit_product.setItemName(product.getItemName());
    	edit_product.setDescription(product.getDescription());
    	edit_product.setPrice(product.getPrice());
    	edit_product.setPhotos(product.getPhotos());
    	edit_product.setPhotoImagePath(product.getPhotoImagePath());
    	edit_product.setSellerId(product.getSellerId());
    	edit_product.setSellStatus(product.getSellStatus());
    	
    	prodService.save(edit_product);
		
		return "redirect:all_product";
	}
	@PostMapping("edit_stock")
	public String editStock(@ModelAttribute("product") Product product, 
			@RequestParam long cid) {
		
		Optional<Product> product_info = prodService.getProductInfo(cid);
    	System.out.println(product_info);
    	
    	Product edit_stock = product_info.get();
    	edit_stock.setStock(product.getStock());
    	
    	
    	prodService.save(edit_stock);
		
		return "redirect:all_product";
	}
	
	@GetMapping("delete_meal")
	public String deletePostCar(@RequestParam long cid) {
		
		prodService.deleteMeal(cid);
		
		return "redirect:all_product";
		
	}
	@GetMapping("product_detail")
	public String viewProductDetail(@RequestParam long cid, Model model) {

		Optional<Product> product_info = prodService.getProductInfo(cid);
		System.out.println(product_info);

		Product productdata = product_info.get();

		List<Product> product = new ArrayList<Product>();

		product.add(productdata);

		model.addAttribute("product", product);
		

		return "ProductDetail";
	}
	
	@PostMapping("/product_detail/{cid}/comment")
    public String addComment(@PathVariable Long cid, @RequestParam("text") String text,  Principal principal) {
		
		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		
		Optional<Product> product_info = prodService.getProductInfo(cid);
		
		 if (!product_info.isPresent()) {
		        // Handle the case where the product with the given cid is not found
		        return "redirect:/product"; // Or any appropriate redirect
		    }
		
		
		System.out.println(product_info);
		
		Product productdata = product_info.get();

      

        
       
        
        System.out.println("CID---------------------------: " + cid);
    
        
        return "redirect:/product_detail?cid=" + cid;
    }
	
	
	
	@PostMapping("/product_detail/{cid}/comment/{commentId}/reply")
	public String addReply(@PathVariable Long cid, @PathVariable Long commentId, @RequestParam("text") String text,Principal principal) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
				
	    Optional<Product> productInfo = prodService.getProductInfo(cid);
	    Product productData = productInfo.orElseThrow(); // Handle the case where threadInfo is not present

	    return "redirect:/product_detail?cid=" + cid;
	}
	@PostMapping("ordering")
	public String productOrder(@ModelAttribute("order") Order order,
			@RequestParam(value = "cid", required = false) long id, Principal principal, 
			Model model, @RequestParam("orderAddress") String address) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		// get Meal
		Optional<Product> product_info = prodService.getProductInfo(id);
		System.out.println(product_info);

		Product productdata = product_info.get();


		order.setUser(user);
		order.setUserName(user.getUserName());
		order.setOrderName(productdata.getItemName());
		order.setOrderStatus(productdata.getSellStatus());
		order.setOrderPrice(productdata.getPrice());
//		order.getOrderPrice(productdata.getPrice());
		order.setPhotoImagePath(productdata.getPhotoImagePath());
		order.setPhotos(productdata.getPhotos());
		order.setAddress(address);
		order.setProduct(productdata);
		
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
	
	@GetMapping("all_orders")
	public ModelAndView showAllCar(@ModelAttribute("order") Order order) {
		
	List<Order> orders = orderService.getAllOrder();
		System.out.println(orders);
	
	return new ModelAndView ("allOrder", "orders", orders);

	}
	
	@PostMapping("order_status")
	public String setCarBookingStatus(@RequestParam long bid,
			@ModelAttribute("order") Order order) {
		
		Optional<Order> order_info = orderService.getOrderInfo(bid);
		Order order_booking = order_info.get();
		System.out.println(order_booking);
		
		order_booking.setOrderStatus(order.getOrderStatus());

		orderService.saveOrder(order_booking);
		
		return "redirect:all_orders";
	}
	
	@PostMapping("order_date")
	public String setOrderBookingStatus(@RequestParam long bid,
			@ModelAttribute("order") Order order) {
		
		Optional<Order> order_info = orderService.getOrderInfo(bid);
		Order order_booking = order_info.get();
		System.out.println(order_booking);
		
		
		order_booking.setDeliveryDate(order.getDeliveryDate());

		orderService.saveOrder(order_booking);
		
		return "redirect:all_orders";
	}
	
	@GetMapping("search")
	public ModelAndView searchCars(@RequestParam String keyword, Model model) {
		
		List<Product> searchProduct = prodService.search(keyword);
		System.out.println(searchProduct);
		
		model.addAttribute("keyword", keyword);
		
		return new ModelAndView ("searchResults", "searchProduct", searchProduct);
	}

}
