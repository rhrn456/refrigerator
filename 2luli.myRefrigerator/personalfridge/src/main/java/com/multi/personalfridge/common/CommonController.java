package com.multi.personalfridge.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.recipe.RecipeService;

@Controller
public class CommonController {

	private final ProductService productService;
	private final RecipeService recipeService;

	@Autowired
	public CommonController(ProductService productService, RecipeService recipeService) {
	    this.productService = productService;
	    this.recipeService = recipeService;
	}
	
	
	
	@GetMapping("/")
	public String getMainRecipe(Model model) {
		List<RecipeDTO> recipe = recipeService.getAllrecipe();
		List<ProductDTO> products = productService.getAllSepcialProduct();
		model.addAttribute("products",products);
		model.addAttribute("recipe", recipe);
		return "index";
	}
	
	@GetMapping("/contact")
	public String contact() {

		return "contact";
	}
	@GetMapping("/cart")
	public String cart() {

		return "shop-detail";
	}
	@GetMapping("/recipeshop")
	public String recipeshop() {
		
		return "recipeshop";
	}
	@GetMapping("/productshop")
	public String productshop() {
		
		return "productshop";
	}
	
	@GetMapping("/specialproductshop")
	public String specialproductshop(Model model) {
		List<ProductDTO> products = productService.getAllSepcialProduct();
		model.addAttribute("products",products);
		return "specialproductshop";
	}
}
