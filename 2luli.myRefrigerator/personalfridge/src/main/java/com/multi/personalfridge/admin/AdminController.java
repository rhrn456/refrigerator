package com.multi.personalfridge.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeAndProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.dto.ReviewDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.recipe.RecipeProductService;
import com.multi.personalfridge.recipe.RecipeService;
import com.multi.personalfridge.review.ReviewService;
import com.multi.personalfridge.user.UserService;

@Controller
public class AdminController {

	private final RecipeService recipeService;
	private final ProductService productService;
	private final RecipeProductService recipeProductService;
	private final ReviewService reviewService;
	private final AdminService adminService;
	private final UserService userService;
	
	@Autowired
	public AdminController(RecipeService recipeService,
							ProductService productService,
							RecipeProductService recipeProductService,
							ReviewService reviewService,
							AdminService adminService,
							UserService userService) {
		this.recipeService = recipeService;
	    this.productService = productService;
	    this.recipeProductService = recipeProductService;
	    this.reviewService = reviewService;
	    this.adminService = adminService;
	    this.userService = userService;
	}
	
	//관리자 페이지
	@GetMapping("/admin")
	public String goAdmin() {
		return "admin/adminpage";
	}
	
	//레시피 등록 페이지
	@GetMapping("/insertRecipe")
	public String insertRecipe() {
		return "admin/insertrecipe";
	}
	
	//레시피 등록 페이지
	@GetMapping("/insertProduct")
	public String insertProduct() {
		return "admin/isnertproduct";
	}
	
	
	//차트 보드
	@GetMapping("/chartboard")
	public String chartboard() {
		return "admin/plusrecipeproducts";
	}
	
	
	//레시피 관련 START------------------------------------------------------------------------
	//레시피 리스트 페이지
	@GetMapping("/RecipeListAdmin")
	public String RecipeListAdmin(@RequestParam(defaultValue ="1") int page,Model model) {
		int pageSize = 8;
		List<RecipeDTO> recipelist = recipeService.getAllRecipePage(page, pageSize);
		List<RecipeDTO> recipes = recipeService.getAllrecipe();
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
		return "admin/recipelsitadmin";
	}
	
	//레시피 검색/페이징
		@GetMapping("/searchRecipe")
		@ResponseBody
		public Map<String, Object> getRecipeBySearch(@RequestParam String category, @RequestParam String keyword, @RequestParam(defaultValue ="1") int page, @RequestParam int pageSize) {
		    Map<String, Object> parameters = new HashMap<>();
		    List<RecipeDTO> recipes = recipeService.getRecipesBykeywordAndPage(category, keyword, page, pageSize);
		    List<RecipeDTO> recipeList = recipeService.getRecipesBykeyword(category, keyword);
		    int totalRecipes = recipeList.size();
		    int totalPages = (int) Math.ceil((double) totalRecipes / pageSize); 
			if(totalPages >5) {
				totalPages = 5;
			}
		    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
											.total(totalRecipes)
											.pageAmount(totalPages)
											.currentPage(page)
											.amount(pageSize)
											.build();  
		    parameters.put("recipes", recipes);
		    parameters.put("pageInfo", pageRequestDTO);
		    return parameters;
		}
		
		//레시피 전체/카테고리 페이징
		@GetMapping("/getRecipeByCategory")
		@ResponseBody
		public Map<String, Object> getRecipeByCategory(@RequestParam String category, @RequestParam int page, @RequestParam int pageSize) {
		    Map<String, Object> parameters = new HashMap<>();
		    List<RecipeDTO> recipeList = recipeService.getRecipesByCategory(category);
		    List<RecipeDTO> recipes = recipeService.getRecipesByCategoryAndPage(category, page, pageSize);
		    int totalRecipes = recipeList.size();  
		    int totalPages = (int) Math.ceil((double) totalRecipes / pageSize); 
			if(totalPages >5) {
				totalPages = 5;
			}
		    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
											.total(totalRecipes)
											.pageAmount(totalPages)
											.currentPage(page)
											.amount(pageSize)
											.build();
		    parameters.put("recipes", recipes);
		    parameters.put("pageInfo", pageRequestDTO);
		    return parameters;
		}
		
	//레시피 삭제
	@GetMapping("/recipedeleteadmin/{recipe_id}")
	public String RecipeDeleteAdmin(@PathVariable int recipe_id) {
		boolean result = recipeService.recipeDeletById(recipe_id);
		if(result) {
			return "redirect:/SpecialProductAllList";
		}else {
		return "error";
		}
	}
	
    @PostMapping("/RecipeUpdateAdmin")
    @ResponseBody
    public String RecipeUpdateAdmin(@RequestBody RecipeDTO recipeDTO) {
        // 받아온 데이터를 사용하여 상품 업데이트 작업 수행
        recipeService.recipetUpdate(recipeDTO);
        return "success"; // 성공적으로 업데이트되었음을 클라이언트에게 반환
    }
	
	//수정하기위에 데이터 던져주기
	@GetMapping("/findrecipe")
	@ResponseBody
	public RecipeDTO FindRecipe(@RequestParam int recipe_id) {
		RecipeDTO recipe =  recipeService.getRecipeById(recipe_id);
		return recipe;
	}
	
	//레시피 리뷰 페이지
	@GetMapping("/ReviewRecipeAdmin")
	public String ReviewRecipeAdmin(@RequestParam(defaultValue ="1") int page, Model model) {
		int pageSize = 12; // 보여줄 아이템수 
		String category ="";
		List<ReviewDTO> reviews = reviewService.ReviewAndPage(category,page, pageSize);//전체 리뷰 페이징
		List<ReviewDTO> reviewList = reviewService.getAllReviewList(category);// 전체 리뷰 가져오기
		System.out.println(reviews);
		System.out.println(reviewList);
		int totalReviews = reviewList.size();//총 페이지수 구하기
		int totalPages = (int) Math.ceil((double) totalReviews / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalReviews)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
		model.addAttribute("pageInfo", pageRequestDTO);
		model.addAttribute("reviews",reviews);
		return "admin/recipereviewadmin";
	}
	
	
	//레시피 관련 END ---------------------------------------------------------------------
	
	
	
	//사용자 관련 START --------------------------------------------------------------------
	//사용자 리스트
	@GetMapping("/userListadmin")
	public String userListAdmin(@RequestParam(defaultValue ="1") int page, Model model) {
		int pageSize = 12;
		List<UserDTO> userlist = userService.getAllUserPage(page, pageSize);
		List<UserDTO> userpage = userService.getAlluser();
		int totalUsers = userpage.size();
		int totalPages = (int) Math.ceil((double) totalUsers / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalUsers)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
		model.addAttribute("pageInfo", pageRequestDTO);
		model.addAttribute("userlist",userlist);
		return "admin/userlistadmin";
	}
	
	//사용자 리스트 페이지
	@GetMapping("/getAllUserAndPage")
	@ResponseBody
	public Map<String, Object> userListAndPageAdmin(@RequestParam String keyword, @RequestParam int page, @RequestParam int pageSize, Model model) {
	   Map<String, Object> parameters = new HashMap<>();
	   List<UserDTO> userpage = userService.getAlluserByKeyword(keyword);
   	   List<UserDTO> userlist = userService.getAllUserByKewordPage(keyword, page, pageSize);
   	   int totalUsers = userpage.size();
	   	int totalPages = (int) Math.ceil((double) totalUsers / pageSize); 
		if(totalPages > 5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalUsers)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	   parameters.put("userlist", userlist);
	   parameters.put("pageInfo", pageRequestDTO);
	   return parameters;
	}
	//사용자-> 매니저 등록
	@GetMapping("/userupdateadmin/{user_id}")
	public String userUpdateToManager(@PathVariable("user_id") String user_id) {
		boolean result = userService.userUpdateToManager(user_id);
		if(result) {
			return "redirect:/userListadmin";
		}else {
		return "error";
		}
	}

	
	//사용자 삭제
	@GetMapping("/userdeleteadmin/{user_id}")
	public String userDeleteAdmin(@PathVariable("user_id") String user_id) {
	boolean result = userService.deleteUserAdmin(user_id);
	if(result) {
		return "redirect:/userListadmin";
	}else {
	return "error";
	}
}

	
	//사용자 관련 END ------------------------------------------------------------------
	
	//매니저 관련 START-----------------------------------------------------------------
	//매니저 리스트
	@GetMapping("/managerListadmin")
	public String managerListadmin(@RequestParam(defaultValue ="1") int page, Model model) {
		int pageSize = 12;
		List<UserDTO> userlist = adminService.getAllManagerPage(page, pageSize);
		List<UserDTO> userpage = adminService.getAllManager();
		int totalUsers = userpage.size();
		int totalPages = (int) Math.ceil((double) totalUsers / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
									.total(totalUsers)
									.pageAmount(totalPages)
									.currentPage(page)
									.amount(pageSize)
									.build();
		model.addAttribute("pageInfo", pageRequestDTO);
		model.addAttribute("userlist",userlist);
		return "admin/managerlistadmin";
	}
	
	//매니저 리스트 페이지
	@GetMapping("getAllManagerrAndPage")
	@ResponseBody
	public Map<String, Object> ManagerListAndPageAdmin(@RequestParam String keyword, @RequestParam int page, @RequestParam int pageSize, Model model) {
	   Map<String, Object> parameters = new HashMap<>();
	   List<UserDTO> userpage = adminService.getAllManagerByKeyword(keyword);
	   List<UserDTO> userlist = adminService.getAllManagerByKeywordPage(keyword, page, pageSize);
	   int totalUsers = userpage.size();
	   int totalPages = (int) Math.ceil((double) totalUsers / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalUsers)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	   parameters.put("userlist", userlist);
	   parameters.put("pageInfo", pageRequestDTO);
	   return parameters;
	}
	
	//매니저-> 사용자 등록
	@GetMapping("/managerupdateadmin/{user_id}")
	public String ManagerUpdateToUser(@PathVariable("user_id") String user_id) {
		System.out.println(user_id);
		boolean result = adminService.ManagerUpdateToUser(user_id);
		System.out.println(result);
		if(result) {
			return "redirect:/managerListadmin";
		}else {
		return "error";
		}
	}
	//매니저 관련 END-------------------------------------------------------------------
	
	//레시피 등록
		@GetMapping("/RecipePlus")
		public String insertRecipe(@ModelAttribute RecipeDTO recipe, Model model) throws JsonProcessingException {
			ObjectMapper objectMapper = new ObjectMapper();;
			List<ProductDTO> productList = productService.getFullProduct();
			RecipeDTO onerecipe;
			List<RecipeAndProductDTO> recipeproductList = null;
			String recipeproductListJson = "0";
			 if(recipe.getRecipe_name() != null) {
			    boolean result = recipeService.insertRecipe(recipe);
			    onerecipe = recipeService.getReturnInsertRecipe(recipe.getRecipe_name());
			}else {
				onerecipe = recipeService.getRecipeById(recipe.getRecipe_id());
				recipeproductList = recipeProductService.getRecipeProductListByRecipeId(recipe.getRecipe_id());
				recipeproductListJson = objectMapper.writeValueAsString(recipeproductList);
			}
				model.addAttribute("onerecipe",onerecipe);
			    model.addAttribute("recipeproductListJson", recipeproductListJson);
		    	model.addAttribute("productList",productList);
		    	
			return "admin/plusrecipeproducts";
		}
		
	
	//레시피 재료 등록
	@GetMapping("/RecipeProductPlus")
	public String PlustRecipeProducts(@RequestParam("recipeProducts") String recipeProductsJson) { 
	    ObjectMapper objectMapper = new ObjectMapper(); 
	    
	    try {
	        // JSON 문자열을 RecipeProductDTO 배열로 변환
	        RecipeProductDTO[] recipeProducts = objectMapper.readValue(recipeProductsJson, RecipeProductDTO[].class);
	        
	        boolean deleteResult = recipeProductService.deleteRecipeProductsByRecipeId(recipeProducts[0].getRecipe_id());
	        if (!deleteResult) {
	            // 삭제에 실패한 경우 에러 반환
	            return "error";
	        }
	        
	        // 모든 제품을 처리하기 위해 루프 사용
	        for (RecipeProductDTO product : recipeProducts) {
	            // 변경된 데이터를 recipeProductService에 전달
	            boolean result = recipeProductService.PlustRecipeProducts(product);
	            if (!result) {
	                // 처리 중 문제 발생 시 에러 반환
	                return "error";
	            }
	        }
	        // 모든 제품이 성공적으로 처리된 경우에만 성공 반환
	        return "redirect:/admin";
	    } catch (JsonProcessingException e) {
	        // JSON 파싱에 실패한 경우에 대한 예외 처리
	        e.printStackTrace();
	        return "error";
	    }
	}
	
	//상품 추가
	@GetMapping("/ProductPlus")
	public String ProductPlus(@ModelAttribute ProductDTO product) {
		 boolean result = productService.ProductPlus(product);
		 if(result) {
			 return "redirect:/admin";			 
		 }
		 return "error";
	}
	
	//일반 상품 리스트(어드민)
	@GetMapping("/productAllList")
	public String ProductPlus(@RequestParam(defaultValue ="1") int page,Model model) {
		int pageSize = 12;
		List<ProductDTO> productlist = productService.getAllProductPage(page, pageSize);
		List<ProductDTO> products = productService.getAllProduct();
		int totalProducts = products.size();
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
		model.addAttribute("productlist",productlist);
		 model.addAttribute("pageInfo", pageRequestDTO);
		 return "admin/productslistadmin";
	}
	
		
	
	
	//특가 상품 리스트(어드민)
		@GetMapping("/SpecialProductAllList")
		public String SpecialProductPlus(@RequestParam(defaultValue ="1") int page,Model model) {
			int pageSize = 12;
			List<ProductDTO> productlist = productService.getAllSepcialProductPage(page, pageSize);
			List<ProductDTO> products = productService.getAllSepcialProduct();
			int totalProducts = products.size();
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
		    System.out.println(pageRequestDTO); 
			model.addAttribute("productlist",productlist);
			 model.addAttribute("pageInfo", pageRequestDTO);
			 return "admin/specialproductslistadmin";
		}
		
		//상품 삭제
		@GetMapping("/productdeleteadmin/{product_id}")
		public String ProductDeleteAdmin(@PathVariable int product_id) {
			boolean result = productService.productDeletById(product_id);
			if(result) {
				return "redirect:/SpecialProductAllList";
			}else {
			return "error";
			}
		}
		
	    @PostMapping("/ProductUpdateAdmin")
	    @ResponseBody
	    public String ProductUpdateAdmin(@RequestBody ProductDTO productDTO) {
	        // 받아온 데이터를 사용하여 상품 업데이트 작업 수행
	         productService.productUpdate(productDTO);
	        return "success"; // 성공적으로 업데이트되었음을 클라이언트에게 반환
	    }
		
		//수정하기위에 데이터 던져주기
		@GetMapping("/findproduct")
		@ResponseBody
		public ProductDTO FindProduct(@RequestParam int product_id) {
			
			ProductDTO product =  productService.getProductById(product_id);
			return product;
		}

}
