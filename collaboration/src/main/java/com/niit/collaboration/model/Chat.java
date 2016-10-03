package com.niit.collaboration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Chat")
@Component

public class Chat {
	@Id
	@Column(name="User_id")
	private String User_id;
	private String Friend_id;
	private String message;
	public String getUser_id() {
		return User_id;
	}
	public void setUser_id(String user_id) {
		User_id = user_id;
	}
	public String getFriend_id() {
		return Friend_id;
	}
	public void setFriend_id(String friend_id) {
		Friend_id = friend_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	

	
}
