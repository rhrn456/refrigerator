package com.multi.personalfridge;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;


@MapperScan({"com.multi.personalfridge.user", 
			 "com.multi.personalfridge.admin", 
			 "com.multi.personalfridge.product", 
			 "com.multi.personalfridge.recipe",
			 "com.multi.personalfridge.review",
			 "com.multi.personalfridge.refrigerator",
			 "com.multi.personalfridge.board",
			 "com.multi.personalfridge.common"})
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class PersonalfridgeApplication {

	public static void main(String[] args) {
		SpringApplication.run(PersonalfridgeApplication.class, args);
	}


}
