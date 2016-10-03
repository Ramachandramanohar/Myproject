package com.niit.collaboration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "userdetail")
@Component
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private String id;

	private String password;

	private String username;
	
	private String email;
	private String mobile;

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String get() {
		return mobile;
	}

	public void setmobile(String mobile) {
		this.mobile = mobile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id2) {
		this.id = id2;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + this.getId() + ", password=" + password + ", username=" + username + ",  email=" + email + ", mobile=" + mobile+ "]";
	}

	/*
	 * @Column(name = "admin") private boolean isAdmin;
	 */

}
