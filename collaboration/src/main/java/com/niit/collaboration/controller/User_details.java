package com.niit.collaboration.controller;


	

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.http.HttpStatus;
	import org.springframework.http.MediaType;
	import org.springframework.http.ResponseEntity;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RestController;

	import com.niit.collaboration.dao.UserDAO;
	import com.niit.collaboration.model.User;
import com.niit.collaboration.model.UserDetails;

	@RestController
	public class User_details {
		@Autowired
		UserDAO userDAO;
		@RequestMapping(value="/users/{id}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<User> getUser(@PathVariable("id") String id){
			UserDetails user= userDAO.get(id);
			if (user==null){
				
				return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
			}
			
			return new ResponseEntity<User>(HttpStatus.OK);
		
		}
	}



