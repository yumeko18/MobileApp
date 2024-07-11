package com.jumstart.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumstart.Entities.Product;
import com.jumstart.Repository.ProductRepository;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	ProductRepository prodRepository;
	
	public Product save(Product product) {
		return prodRepository.save(product);
	}
	
	public List<Product> getAllProducts() {
		return prodRepository.findAll();
	}
	
	public Optional<Product> getProductInfo(long cid) {

		return prodRepository.findById(cid);
	}
	
//	public List<Product> findMealPosts(long uid){
//		return prodRepository.findBySellerId(uid);
//	}
	public void deleteMeal(long cid) {
		prodRepository.deleteById(cid);
	}
	public List<Product> search(String keyword) {
		return prodRepository.search(keyword);
		
	}
	
	

}
