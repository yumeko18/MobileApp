package com.jumstart.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jumstart.Entities.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {

	List<Cart> findByUserUserName(String username);
	

}
