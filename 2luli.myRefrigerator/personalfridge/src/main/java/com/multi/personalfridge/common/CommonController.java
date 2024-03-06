package com.multi.personalfridge.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.product.ProductService;

@Controller
public class CommonController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/contact")
	public String contact() {

		return "contact";
	}
	@GetMapping("/cart")
	public String cart() {

		return "cart";
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
