package com.jumstart.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jumstart.Entities.User;

public interface UserRepository extends JpaRepository<User, Long>{

	User findByUserName(String name);
	
	
}
