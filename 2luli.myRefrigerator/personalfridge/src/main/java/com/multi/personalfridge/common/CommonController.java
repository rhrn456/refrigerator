package com.multi.personalfridge.common;


import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.cart.CartService;
import com.multi.personalfridge.dto.CartDTO;
import com.multi.personalfridge.dto.CartProductDTO;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.dto.UserLikeDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.recipe.RecipeProductService;
import com.multi.personalfridge.recipe.RecipeService;
import com.multi.personalfridge.refrigerator.RefrigeratorService;
import com.multi.personalfridge.user.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommonController {

	private final ProductService productService;
	private final RecipeService recipeService;
	private final CartService cartService;
	private final UserService userService;
	private final RefrigeratorService refrigeratorService;
	private final RecipeProductService recipeProductService;

	@Autowired
	public CommonController(ProductService productService, 
							RecipeService recipeService, 
							CartService cartService,
							UserService userService,
							RefrigeratorService refrigeratorService,
							RecipeProductService recipeProductService) {
	    this.productService = productService;
	    this.recipeService = recipeService;
	    this.cartService = cartService;
	    this.userService = userService;
	    this.refrigeratorService = refrigeratorService;
	    this.recipeProductService = recipeProductService;
	}
	
	//메인 화면 데이터(레시피, 특가 상품)

	
	@GetMapping("/")
	public String getMainRecipe(Model model, HttpServletRequest request) {
	    List<RecipeDTO> recipe = recipeService.getPopularRecipe();
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
	    
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    
    	String str = "";
    	Double carbs = 0.0;
    	Double fat = 0.0;  
    	List<RecipeDTO> allRecipeList = recipeService.getAllrecipe();
    	List<RecipeDTO> dietRecipeList = new ArrayList<RecipeDTO>();
    	UserDTO user = userService.getUserById(userId);
    	
    	for (RecipeDTO recipeDTO : allRecipeList) {
    		str = recipeDTO.getNutrition_facts();
    		
    		 // 탄수화물의 숫자 추출
            String carbsPattern = "탄수화물 : (\\d+(\\.\\d+)?)";
            Pattern pattern = Pattern.compile(carbsPattern);
            Matcher matcher = pattern.matcher(str);
            if (matcher.find()) {
            	carbs = Double.parseDouble(matcher.group(1));
            }
            
            // 지방 숫자 추출
            String fatPattern = "지방 : (\\d+(\\.\\d+)?)";
            pattern = Pattern.compile(fatPattern);
            matcher = pattern.matcher(str);
            if (matcher.find()) {
            	fat = Double.parseDouble(matcher.group(1));
            }
            
            double diet =  (carbs*4) + (fat*9);
            
            //설정 다이어트에 따른 레시피 구분
            if (user.getDiet() != null) {
                switch (user.getDiet()) {
    			case "verySlim": {
    				if (diet <= 100) {
    					dietRecipeList.add(recipeDTO);
    				}
    				break;
    			}
    			case "slim": {
    				if (diet > 100 & diet <= 150 ) {
    					dietRecipeList.add(recipeDTO);
    				}
    				break;
    			}
    			case "maintain": {
    				if (diet > 150 & diet <= 200 ) {
    					//없음
    				}
    				break;
    			}
    			case "gain": {
    				if (diet > 200 & diet <= 250 ) {
    					dietRecipeList.add(recipeDTO);
    				}
    				break;
    			}
    			case "veryGain": {
    				if (diet > 250) {
    					dietRecipeList.add(recipeDTO);
    				}
    				break;
    			}
    			default:
    				dietRecipeList.add(recipeDTO);
    			}
			}            

		}
    	model.addAttribute("dietRecipeList", dietRecipeList);
		
	    if (userId != null) {
		    //유저아이디와 맞는 냉장고의 아이디를 불러옴
		    Integer refrigeratorId = refrigeratorService.getRefrigeratorId(userId);
			
			if (refrigeratorId != null) {				
				//냉장고 아이디와 맞는 냉장고의 재료를 리스트로 불러옴
				List<RefrigeratorProdcutDTO> refrigeratorProductList = refrigeratorService.getRefrigeratorProduct(refrigeratorId);
				//냉장고 속 제품과 맞는 재료들 불러옴
				ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
				ArrayList<Integer> idList = new ArrayList<Integer>();
				for (int i = 0; i < refrigeratorProductList.size(); i++) {
					productList.addAll(productService.getProductsBykeyword("", refrigeratorProductList.get(i).getProduct_name()));			
				}
				
				//중복제거
				for (int i = productList.size() - 1; i >= 0 ; i--) {
					for (Integer integer : idList) {
						if (productList.get(i).getProduct_id().equals(integer)) {
							productList.remove(i);
							if (i > 0) {
								i--;
							}
						}
					}
					idList.add(productList.get(i).getProduct_id());			
				}
				idList.clear();
				
				//불러온 재료가 들어간 레시피의 id를 불러옴
				ArrayList<Integer> recipeIdList = new ArrayList<Integer>();
				for (ProductDTO product : productList) {
					recipeIdList.addAll(recipeProductService.getRecipeIdByProductId(product.getProduct_id()));
				}
			
				//중복제거
				for (int i = recipeIdList.size() - 1; i >= 0 ; i--) {
					for (Integer integer : idList) {
						if (recipeIdList.get(i).equals(integer)) {
							recipeIdList.remove(i);
							if (i > 0) {
								i--;
							}
						}
					}
					idList.add(recipeIdList.get(i));			
				}
				
				ArrayList<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
				for (Integer recipeId : recipeIdList) {
					recipeList.add(recipeService.getRecipeById(recipeId));
				}
				
				model.addAttribute("recipeList", recipeList);
			}
		}
	    
	    return "index";
	}
	
	//회사 정보
	@GetMapping("/contact")
	public String contact() {

		return "recipe/recipeinformation";
	}
	

	// 장바구니
	@GetMapping("/mypage/mycart")
	public String cart(HttpServletRequest request, Model model) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    if (userId == null || userId.isEmpty()) {
	        return "redirect:/loginPage";
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
	    String cartListJson = objectMapper.writeValueAsString(mergedCartList);
	    model.addAttribute("cartListJson", cartListJson);

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
	
	//좋와요 확인
	@GetMapping("/searchUserLike")
	@ResponseBody
	public String searchUserLike(@RequestParam int recipe_id, HttpServletRequest request) {
    	HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("userId");
	    UserLikeDTO userlike = userService.searchUserLike(recipe_id, user_id);
	    String result = userlike != null ? "1" : "0";
	    return result;
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
