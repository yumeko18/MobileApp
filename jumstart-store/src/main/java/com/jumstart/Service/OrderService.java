package com.jumstart.Service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumstart.Entities.Cart;
import com.jumstart.Entities.Order;
import com.jumstart.Entities.Product;
import com.jumstart.Entities.User;
import com.jumstart.Repository.OrderRepository;



@Service
public class OrderService {
	
	@Autowired
	private OrderRepository orderRepository;
	

	public Order saveOrder(Order order) {

		return orderRepository.save(order);
	}

	public List<Order> getAllOrder() {
		
		return orderRepository.findAll();
	}
	
	public List<Order> findUserOrder(User user, Product product) {
		return orderRepository.findByUserAndProduct(user, product);
	}
	
	public Optional<Order> getOrderInfo(long bid){
		return orderRepository.findById(bid);
	}
	
	public List<Order> getUserOrders(User user){
		return orderRepository.findByUser(user);
	}
	
	
	public void deleteOrder(long bid) {
		orderRepository.deleteById(bid);
	}
	
	 public List<Order> getOrderItemsByUsername(String username) {
	        return orderRepository.findByUserUserName(username);
	    }
	 
		public void deleteOrderById(long id) {
			
			orderRepository.deleteById(id);
			
			
		}
		
		public Optional<Order> getOrderById(Long id) {
	        return orderRepository.findById(id);
	    }
	
	

}
