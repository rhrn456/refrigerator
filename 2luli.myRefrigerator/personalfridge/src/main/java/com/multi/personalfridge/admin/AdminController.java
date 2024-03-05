package com.multi.personalfridge.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
		@GetMapping("/")
		public String getAlluser(Model model) {
			List<AdminDTO> users = service.getAlluser();
			System.out.println(users);
			model.addAttribute("users",users);
			return "main";
			//테스트용 변경점
			//테스트용 변경점 test2
		}
	
}
