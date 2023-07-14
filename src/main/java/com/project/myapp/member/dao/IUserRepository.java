package com.project.myapp.user.dao;

import java.util.List;

import com.project.myapp.user.model.User;

public interface IUserRepository {
	User getUserInformation();
	User getUserPassword(String id);
}
