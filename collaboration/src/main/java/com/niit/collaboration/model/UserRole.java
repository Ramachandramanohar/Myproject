package com.niit.collaboration.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "UserRole")
@Component


public class UserRole {
	@Id
	@Column(name="User_id")
	private String User_id;
	private String Role_id;
	public String getRole_id() {
		return Role_id;
	}
	public void setRole_id(String role_id) {
		Role_id = role_id;
	}
	
	
}
