package com.jumstart.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jumstart.Entities.Order;
import com.jumstart.Entities.Product;
import com.jumstart.Entities.User;



@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	
	List<Order> findByUserAndProduct(User user, Product product);
	
	List<Order> findByUser(User user);

	List<Order> findByUserUserName(String username);

}
