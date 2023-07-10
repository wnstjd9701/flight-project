package com.project.myapp.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.user.dao.IUserRepository;
import com.project.myapp.user.model.User;

@Service
public class UserService implements IUserService {
	
	@Autowired
	IUserRepository userRepository;
	
	@Override
	public User getUserInformation() {
		return userRepository.getUserInformation(); 
	}

	@Override
	public User getUserPassword(String id) {
		return userRepository.getUserPassword(id);
	}

}
