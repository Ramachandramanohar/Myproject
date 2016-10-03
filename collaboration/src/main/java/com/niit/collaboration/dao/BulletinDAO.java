package com.niit.collaboration.dao;

import com.niit.collaboration.model.Bulletin;
import com.niit.collaboration.model.User;

public interface BulletinDAO{

	public User get(String id);

	public void saveOrUpdate(Bulletin bulletin);

	public boolean isValidUser(String id, String password);

}
