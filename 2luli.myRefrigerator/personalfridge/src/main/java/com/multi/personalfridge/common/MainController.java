package com.multi.personalfridge.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.multi.personalfridge.dto.RecipeDTO;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	@GetMapping("/")
	public String getMainRecipe(Model model) {
		List<RecipeDTO> recipe = service.getMainRecipe();
		model.addAttribute("recipe", recipe);
		return "index";
	}
	
}
