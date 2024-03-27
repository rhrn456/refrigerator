package com.multi.personalfridge.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	 @Override
	    public void addInterceptors(InterceptorRegistry registry) {
		 registry.addInterceptor(new UserInterceptor())
		 		.addPathPatterns("/mypage/**");
	        registry.addInterceptor(new AdminInterceptor())
	        		.addPathPatterns("/admin/**");
	    }
	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/admin/**")
	                .addResourceLocations("classpath:/static/admin/");
	    }

}
