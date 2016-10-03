package com.niit.collaboration.dao;

import com.niit.collaboration.model.Chat;
import com.niit.collaboration.model.User;

public interface ChatDAO{

	public User get(String id);

	public void saveOrUpdate(Chat chat);

	public boolean isValidUser(String id, String password);

}
