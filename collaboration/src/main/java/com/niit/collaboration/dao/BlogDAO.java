package com.niit.collaboration.dao;

import java.util.List;

import com.niit.collaboration.model.Blog;
import com.niit.collaboration.model.Bulletin;
import com.niit.collaboration.model.User;

public interface BlogDAO{

	public Blog get(String id);

	public void saveOrUpdate(Blog blog);

	public boolean isValidUser(String id, String password);

	public void delete(String id);

	public List<Blog> list();

}

