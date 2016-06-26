package com.niit.shopingcart.test;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shopingcart.dao.UserDAO;
import com.niit.shopingcart.model.Category;
import com.niit.shopingcart.model.User;

public class Test {

	static AnnotationConfigApplicationContext context;

	public Test() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.shopingcart");
		context.refresh();
	}

	public static void createUser(User user) {

		UserDAO userDAO = (UserDAO) context.getBean("userDAO");
		userDAO.saveOrUpdate(user);

	}

	public static void main(String[] args) {

		Test t = new Test();

		// 1:CREATE USER

		User user = (User) context.getBean("user");
		user.setId("MANOHAR");
		user.setPassword("MANOHAR");
		Test.createUser(user);

		// 2:ISVALID USER
		/*
		 * UserDAO userDAO = (UserDAO) context.getBean("userDAO");
		 * 
		 * boolean flag = userDAO.isValidUser("niit", "niit"); if (flag) {
		 * 
		 * System.out.println("Valid User!!"); }
		 * 
		 * else {
		 * 
		 * System.out.println("Not a Valid user!!"); }
		 * 
		 */

		// 3:GET USER
		// UserDAO userDAO = (UserDAO) context.getBean("userDAO");
		// User u=userDAO.get("NIIT");
		// System.out.println(u.toString());

		// 4:DELETE USER
		/*
		 * UserDAO userDAO = (UserDAO) context.getBean("userDAO");
		 * userDAO.delete("MANOHAR");
		 */
	}

	private static void display(List<Category> list) {
		for (Category c : list) {
			System.out.print(c.getId() + ":" + c.getName() + ":" + c.getDescription());
		}

	}

}
