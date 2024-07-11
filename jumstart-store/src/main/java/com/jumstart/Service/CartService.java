package com.jumstart.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumstart.Entities.Cart;
import com.jumstart.Entities.Product;
import com.jumstart.Repository.CartRepository;
import com.jumstart.Repository.OrderRepository;

@Service
@Transactional
public class CartService {
	
	@Autowired
	CartRepository cartRepo;
	

	
	
	public Cart save(Cart cart) {
		return cartRepo.save(cart);
	}
	

	 public List<Cart> getCartItemsByUsername(String username) {
	        return cartRepo.findByUserUserName(username);
	    }
	 
	


	public void deleteCartById(long id) {
		
		cartRepo.deleteById(id);
		
		
	}
	
//	public Optional<Cart> getCartbyId(long cid) {
//
//		return cartRepo.findById(cid);
//	}
	
	 public Optional<Cart> getCartById(Long id) {
	        return cartRepo.findById(id);
	    }
}
