package com.multi.personalfridge.common;


import java.util.ArrayList;
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

	    // 0부터 8까지의 상품 데이터만 선택하여 새로운 리스트에 추가
	    List<ProductDTO> selectedProducts = new ArrayList<>();
	    int maxIndex = Math.min(8, products.size() - 1); // 8과 상품 수 중 작은 값 선택
	    for (int i = 0; i <= maxIndex; i++) {
	        selectedProducts.add(products.get(i));
	    }

	    model.addAttribute("products", selectedProducts);
	    model.addAttribute("recipe", recipe);
	    return "index";
	}
	
	//회사 정보
	@GetMapping("/contact")
	public String contact() {

		return "redirect:/login/getGoogleAuthUrl";
	}
	

	// 장바구니
	@GetMapping("/cart")
	public String cart() {

		return "cart";
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
