package com.niit.shoppingcart.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource({ "classpath:webSecurityConfig.xml" })
public class SecurityConfig {

	public SecurityConfig() {

		super();
		System.out.println("SecSecurityConfig");
	}

}
