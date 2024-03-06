package com.multi.personalfridge.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.multi.personalfridge.dto.UserDTO;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
//		@GetMapping("/")
//		public String getAlluser(Model model) {
//			List<UserDTO> users = service.getAlluser();
//			System.out.println(users);
//			model.addAttribute("users",users);
//			return "index";
//		}
		
		@GetMapping("/shop")
		public String shop() {

			return "shop";
		}
		
		@GetMapping("/shop-detail")
		public String shopdetail() {

			return "shop-detail";
		}
		
		@GetMapping("/contact")
		public String contact() {

			return "contact";
		}
		@GetMapping("/cart")
		public String cart() {

			return "cart";
		}
}
