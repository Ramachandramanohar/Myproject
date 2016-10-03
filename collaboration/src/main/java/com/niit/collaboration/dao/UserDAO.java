package com.niit.collaboration.dao;

import com.niit.collaboration.model.User;
import com.niit.collaboration.model.UserDetails;

public interface UserDAO {

	public UserDetails get(String id);

	public void saveOrUpdate(User user);

	public boolean isValidUser(String id, String password);
}