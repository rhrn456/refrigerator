package com.multi.personalfridge;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan(basePackages= "com.multi.personalfridge.admin")
@MapperScan(basePackages = "com.multi.personalfridge.product")
@MapperScan(basePackages= "com.multi.personalfridge.common")
public class PersonalfridgeApplication {

	public static void main(String[] args) {
		SpringApplication.run(PersonalfridgeApplication.class, args);
	}


}
