package com.niit.collaboration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.collaboration.dao.UserDAO;
import com.niit.collaboration.model.User;
import com.niit.collaboration.model.UserDetails;

@Controller
public class UserController {

	@Autowired
	UserDAO userDAO;
	@Autowired
	UserDetails userDetails;

	@RequestMapping("/register")
	public ModelAndView registerUser(@ModelAttribute User user) {
		userDAO.saveOrUpdate(user);
		System.out.println("save or  update  controller");
		return new ModelAndView("/login");
	}

}
