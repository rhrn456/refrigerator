package com.multi.personalfridge.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@GetMapping("/admin")
	public String goAdmin() {
		return "admin/adminpage";
	}
	
	@GetMapping("/insertRecipe")
	public String insertRecipe() {
		return "admin/insertrecipe";
	}
	
	@GetMapping("/insertProduct")
	public String insertProduct() {
		return "admin/isnertproduct";
	}
	
	@GetMapping("/insertSpecialProduct")
	public String insertSpecialProduct() {
		return "admin/insertspecialproduct";
	}
}
