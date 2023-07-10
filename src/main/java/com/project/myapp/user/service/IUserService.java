package com.project.myapp.user.service;

import java.util.List;

import com.project.myapp.user.model.User;

public interface IUserService {
	User getUserInformation();
	User getUserPassword(String id);
	
}
