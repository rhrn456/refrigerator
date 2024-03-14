package com.multi.personalfridge.common;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.personalfridge.dto.PageRequestDTO;
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
	
	//메인 화면 데이터(레시피, 특가 상품)

	@GetMapping("/")
	public String getMainRecipe(Model model) {
		List<RecipeDTO> recipe = recipeService.getAllrecipe();
		List<ProductDTO> products = productService.getAllSepcialProduct();
		model.addAttribute("products",products);
		model.addAttribute("recipe", recipe);
		return "index";
	}
	
	//회사 정보
	@GetMapping("/contact")
	public String contact() {

		return "contact";
	}
	

	// 장바구니
	@GetMapping("/cart")
	public String cart() {

		return "cart";
	}
	

	//레시비 목록
	@GetMapping("/recipeshop")
	public String recipeshop() {
		
		return "recipeshop";
	}
	
	//일반 상품 목록
	@GetMapping("/productshop")
	public String productshop(@RequestParam(defaultValue ="1") int page,Model model) {
		int pageSize = 9;
		List<ProductDTO> productsList = productService.getAllProduct();
	    List<ProductDTO> products = productService.getAllProductPage(page, pageSize);
	    int totalProducts = productsList.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalProducts)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	    model.addAttribute("products", products);
	    model.addAttribute("pageInfo", pageRequestDTO);
		return "productshop";
	}
	
	//특가 상품 목록
	@GetMapping("/specialproductshop")
	public String specialproductshop(@RequestParam(defaultValue ="1") int page,Model model) {
		int pageSize = 9;
		List<ProductDTO> productsList = productService.getAllSepcialProduct();
	    List<ProductDTO> products = productService.getAllSepcialProductPage(page, pageSize);
	    int totalProducts = productsList.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalProducts)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	    model.addAttribute("products", products);
	    model.addAttribute("pageInfo", pageRequestDTO);
	    return "specialproductshop";
	}
	
}
