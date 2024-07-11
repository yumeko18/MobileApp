package com.jumstart.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jumstart.Entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long>{
	
	 
//	 List<Product> findBySellerId(Long uid);
//	 
	 @Query(value = "SELECT c FROM Product c WHERE c.itemName LIKE '%' || :keyword || '%'"
				+ " OR c.price LIKE '%' || :keyword || '%'")
		public List<Product> search(@Param("keyword") String keyword);
	

}
