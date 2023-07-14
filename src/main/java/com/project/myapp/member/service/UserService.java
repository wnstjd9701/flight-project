package com.project.myapp.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.user.dao.IUserRepository;
import com.project.myapp.user.model.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {
	
	private final IUserRepository userRepository;
	
	@Override
	public User getUserInformation() {
		return userRepository.getUserInformation(); 
	}

	@Override
	public User getUserPassword(String id) {
		return userRepository.getUserPassword(id);
	}

}
