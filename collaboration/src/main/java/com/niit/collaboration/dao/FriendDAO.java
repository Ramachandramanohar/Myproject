package com.niit.collaboration.dao;

import com.niit.collaboration.model.Friend;
import com.niit.collaboration.model.User;

public interface FriendDAO{

	public User get(String id);

	public void saveOrUpdate(Friend friend);

	public boolean isValidUser(String id, String password);

}