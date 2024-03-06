package com.multi.personalfridge.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.multi.personalfridge.dto.ProductDTO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
		@GetMapping("/")
		public String getAlluser(Model model) {
			List<ProductDTO> products = productService.getAllSepcialProduct();
			System.out.println(products);
			model.addAttribute("products",products);
			return "index";
		}
}