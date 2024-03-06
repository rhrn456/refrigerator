package com.multi.personalfridge;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
@MapperScan(basePackages= "com.multi.personalfridge.admin")
@MapperScan(basePackages = "com.multi.personalfridge.product")
public class PersonalfridgeApplication {

	public static void main(String[] args) {
		SpringApplication.run(PersonalfridgeApplication.class, args);
	}


}
