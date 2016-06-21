package com.niit.ShopingCart.config;

import java.util.Locale.Category;
import java.util.Properties;

import javax.persistence.Basic;
import javax.sql.DataSource;

import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.boot.SessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.ShopingCart.dao.BasicDataSource;
import com.niit.controller.dao.CategoryDAO;

@Configuration
@ComponentScan("com.niit.shopingcart1")
@EnableTransactionManagement
public class ApplicationContextConfig {
	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/niitdb");
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		return (DataSource) dataSource;

	}

	private Properties getHibernaties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		return properties;

	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernaties());
		sessionBuilder.addAnnotatedClasses(Category.class);
		return sessionBuilder.buildSessionFactory();
	}
	@Autowired
	@Bean(name="transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager=new 	HibernateTransactionManager(sessionFactory);
		return transactionManager;
		
	}
	@Autowired
	@Bean(name="categoryDao")
	public CategoryDAO getCategorDao(SessionFactory sessionFactory){
		return new CategoryDAO();
	}
}
