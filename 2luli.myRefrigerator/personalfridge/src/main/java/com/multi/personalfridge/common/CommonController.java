package com.multi.personalfridge.common;


import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.personalfridge.cart.CartService;
import com.multi.personalfridge.dto.CartDTO;
import com.multi.personalfridge.dto.CartProductDTO;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.recipe.RecipeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommonController {

	private final ProductService productService;
	private final RecipeService recipeService;
	private final CartService cartService;

	@Autowired
	public CommonController(ProductService productService, RecipeService recipeService, CartService cartService) {
	    this.productService = productService;
	    this.recipeService = recipeService;
	    this.cartService = cartService;
	}
	
	//메인 화면 데이터(레시피, 특가 상품)

	
	@GetMapping("/")
	public String getMainRecipe(Model model) {
	    List<RecipeDTO> recipe = recipeService.getAllrecipe();
	    List<ProductDTO> products = productService.getAllSepcialProduct();
	    //랜덤으로 섞는다
	    Collections.shuffle(products);
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

		return "recipe/recipeinformation";
	}
	

	// 장바구니
	@GetMapping("/mycart")
	public String cart(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    if (userId == null || userId.isEmpty()) {
	        return "error";
	    }
	    List<CartProductDTO> cartList = cartService.getCartProducts(userId);

	    Map<String, CartProductDTO> mergedCartMap = new HashMap<>();
	    for (CartProductDTO cart : cartList) {
	        String key = cart.getProduct_id() + "-" + cart.getSpecial_product(); // 제품 ID와 특별 제품 여부를 조합하여 고유한 키 생성
	        if (mergedCartMap.containsKey(key)) {
	            CartProductDTO existingCartProduct = mergedCartMap.get(key);
	            existingCartProduct.setProduct_quantity(existingCartProduct.getProduct_quantity() + cart.getProduct_quantity());
	        } else {
	            mergedCartMap.put(key, cart);
	        }
	    }
	    List<CartProductDTO> mergedCartList = new ArrayList<>(mergedCartMap.values());
	    System.out.println(mergedCartList);
	    model.addAttribute("mergedCartList", mergedCartList);

	    return "cart";
	}
	
	//레시피 리스트 페이지
	@GetMapping("/recipeshop")
	public String RecipeShop(@RequestParam(defaultValue ="1") int page,Model model) {
		int pageSize = 9;
		List<RecipeDTO> recipes = recipeService.getAllrecipe();
		List<RecipeDTO> recipelist = recipeService.getAllRecipePage(page, pageSize);
		int totalRecipe = recipes.size();
		int totalPages = (int) Math.ceil((double) totalRecipe / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalRecipe)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
		model.addAttribute("recipelist",recipelist);
		 model.addAttribute("pageInfo", pageRequestDTO);
		return "recipe/recipeshop";
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
