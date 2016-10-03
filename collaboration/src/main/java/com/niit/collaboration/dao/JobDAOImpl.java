package com.niit.collaboration.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.collaboration.model.Job;
import com.niit.collaboration.model.User;

@Repository("JobDAO")
public class JobDAOImpl implements JobDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public JobDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(User userDetails) {
		System.out.println("*******UserDAO   saveOrUpdate Db Operation invoked****** ");
		sessionFactory.getCurrentSession().saveOrUpdate(userDetails);
	}

	@Transactional
	public boolean isValidUser(String id1, String password) {
		System.out.println("********UserDAO    isValidUser Db Operation  invoked*******");
		int id = Integer.parseInt(id1);

		String hql = "from User where id=" + "  id " + " and " + " password =" + "'" + password + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		System.out.println("Query\t" + query);

		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) query.list();
		System.out.println(list.toString());

		if (list != null && !list.isEmpty()) {
			return true;
		}

		return false;
	}
	/*
	 * @Transactional public User get(String id) { System.out.println(
	 * "*******UserDAO    get Db Operation invoked******"); String hql =
	 * "from User where id="+"'" + id+"'"; Query query =
	 * sessionFactory.getCurrentSession().createQuery(hql);
	 * 
	 * @SuppressWarnings("unchecked") List<User> list = (List<User>)
	 * query.list();
	 * 
	 * if (list != null && !list.isEmpty()) { return list.get(0); }
	 * 
	 * return null;
	 * 
	 * }
	 */

	public User get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void saveOrUpdate(Job job) {
		// TODO Auto-generated method stub
		
	}

}

