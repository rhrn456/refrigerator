package com.multi.personalfridge.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import com.multi.personalfridge.dto.UserLikeDTO;
import com.multi.personalfridge.common.ShipScheduler;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeAndProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.dto.ReviewDTO;
import com.multi.personalfridge.dto.ShipDTO;
import com.multi.personalfridge.dto.ShipItemDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.recipe.RecipeProductService;
import com.multi.personalfridge.recipe.RecipeService;
import com.multi.personalfridge.review.ReviewService;
import com.multi.personalfridge.ship.ShipService;
import com.multi.personalfridge.user.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final RecipeService recipeService;
	private final ProductService productService;
	private final RecipeProductService recipeProductService;
	private final ReviewService reviewService;
	private final AdminService adminService;
	private final UserService userService;
	private final ShipService shipService;
	private final ShipScheduler shipScheduler;
	
	@Autowired
	public AdminController(RecipeService recipeService,
							ProductService productService,
							RecipeProductService recipeProductService,
							ReviewService reviewService,
							AdminService adminService,
							UserService userService,
							ShipService shipService,
							ShipScheduler shipScheduler) {
		this.recipeService = recipeService;
	    this.productService = productService;
	    this.recipeProductService = recipeProductService;
	    this.reviewService = reviewService;
	    this.adminService = adminService;
	    this.userService = userService;
	    this.shipService = shipService;
	    this.shipScheduler = shipScheduler;
	}
	
	//관리자 페이지
	@GetMapping("/page")
	public String goAdmin(Model model) {
		List<RecipeDTO> recipeList = recipeService.getAllrecipe();
		List<String> likeList = adminService.getAllLike();
	       // 카테고리별 카운트를 저장할 Map 생성
        Map<String, Integer> categoryCounts = new HashMap<>();
        Map<String, Integer> likeCounts = new HashMap<>();

        // 카테고리 초기화(레시피 카테고리 분포도)
        categoryCounts.put("밥", 0);
        categoryCounts.put("국&찌개", 0);
        categoryCounts.put("반찬", 0);
        categoryCounts.put("후식", 0);
        categoryCounts.put("일품", 0);
        //좋와요 카테고리 분포도
        likeCounts.put("밥", 0);
        likeCounts.put("국&찌개", 0);
        likeCounts.put("반찬", 0);
        likeCounts.put("후식", 0);
        likeCounts.put("일품", 0);
        
        // 레시피 리스트를 카테고리별 카운트 증가
        for (RecipeDTO recipe : recipeList) {
            String category = recipe.getRecipe_category();
            if (category != null && categoryCounts.containsKey(category)) {
                int count = categoryCounts.get(category);
                categoryCounts.put(category, count + 1);
            }
        }
        //좋와요 레시피 카테고리별 카운트 증가
        for (String Likecategory : likeList) {
            if (likeCounts.containsKey(Likecategory)) {
                int count = likeCounts.get(Likecategory);
                likeCounts.put(Likecategory, count + 1);
            }
        }
        
        // model로 넘겨줄 레시피 카테고리 분포 데이터 저장
        int rice = categoryCounts.get("밥");
        int soup = categoryCounts.get("국&찌개");
        int food = categoryCounts.get("반찬");
        int desert = categoryCounts.get("후식");
        int first = categoryCounts.get("일품");
        //좋와요 레시피 카테고리 데이터 저장
        int likeRice = likeCounts.get("밥");
        int likeSoup = likeCounts.get("국&찌개");
        int likeFood = likeCounts.get("반찬");
        int likeDesert = likeCounts.get("후식");
        int likefirst = likeCounts.get("일품");
        
        model.addAttribute("rice",rice);
        model.addAttribute("soup",soup);
        model.addAttribute("food",food);
        model.addAttribute("desert",desert);
        model.addAttribute("first",first);
        model.addAttribute("likeRice",likeRice);
        model.addAttribute("likeSoup",likeSoup);
        model.addAttribute("likeFood",likeFood);
        model.addAttribute("likeDesert",likeDesert);
        model.addAttribute("likefirst",likefirst);
        
		return "admin/adminpage";
	}
	
	//레시피 등록 페이지
	@GetMapping("insertRecipeAdmin")
	public String insertRecipe() {
		return "admin/insertrecipe";
	}
	
	//상품 등록 페이지
	@GetMapping("/insertProductAdmin")
	public String insertProduct() {
		return "admin/isnertproduct";
	}
	//배송 신청 목록 가져오기
	@GetMapping("/shipcontrollerAdmin")
	public String shipcontrollerAdmin(@RequestParam(defaultValue ="1") int page, Model model){
		int pageSize = 12;
		List<ShipDTO> shipList = shipService.getAllShipPage(page, pageSize);
		List<ShipDTO> shipItems = shipService.getAllShipInfoAdmin();
		int totalShips = shipItems.size();
		int totalPages = (int) Math.ceil((double) totalShips / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
		PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
											.total(totalShips)
											.pageAmount(totalPages)
											.currentPage(page)
											.amount(pageSize)
											.build();
	    		
		model.addAttribute("shipList", shipList);
		model.addAttribute("pageInfo", pageRequestDTO);
		return "/admin/shipcontrolleradmin";
	}
	//배송 신청 목록 페이징
	@GetMapping("/getShipByPage")
	@ResponseBody
	public Map<String, Object> getShipByKeword(@RequestParam int page, @RequestParam int pageSize){

		List<ShipDTO> shipList = shipService.getAllShipPage(page, pageSize);
		List<ShipDTO> shipItems = shipService.getAllShipInfoAdmin();
	    int totalShips = shipItems.size();
	    int totalPages = (int) Math.ceil((double) totalShips / pageSize);
	    if (totalPages > 5) {
	        totalPages = 5;
	    }
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
								            .total(totalShips)
								            .pageAmount(totalPages)
								            .currentPage(page)
								            .amount(pageSize)
								            .build();
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("shipList", shipList);
	    response.put("pageInfo", pageRequestDTO);

	    return response;
	}
	//송장번호에 해당하는 재료 및 정보 가져오기
	@GetMapping("/getshipItemlist")
	@ResponseBody
	public Map<String, Object> getshipItemlist(@RequestParam String ship_code) {
		List<ShipItemDTO> shipList = shipService.getAllItemByShipCode(ship_code);
		Map<String, List<ShipItemDTO>> groupedShipList = shipList.stream()
				.collect(Collectors.groupingBy(ShipItemDTO::getShip_code));
		Map<String, Object> response = new HashMap<>();
		response.put("groupedShipList", groupedShipList); 
		return response;
	}
	
	//제품 발송하기
	@PostMapping("/startShip")
	@ResponseBody
	public String startShipAdmin(@RequestParam String ship_code) {
		boolean result = shipService.UpdateShipAndAdminCheck(ship_code);
		  if(result) {
			  shipScheduler.startScheduler(ship_code);
		 return "success";
	  }else {
			return "error";
			}
	  }
	//배송 시작된 목록
	@GetMapping("/shipScheduleAdmin")
	public String shipScheduleAdmin(@RequestParam(defaultValue ="1") int page, Model model){
		int pageSize = 12;
		List<ShipDTO> shipList = shipService.getAllShipSchedulePage(page, pageSize);
		List<ShipDTO> shipItems = shipService.getAllShipSchdule();
		int totalShips = shipItems.size();
		int totalPages = (int) Math.ceil((double) totalShips / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
		PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
											.total(totalShips)
											.pageAmount(totalPages)
											.currentPage(page)
											.amount(pageSize)
											.build();
	    		
		model.addAttribute("shipList", shipList);
		model.addAttribute("pageInfo", pageRequestDTO);
		return "/admin/shipscheduleadmin";
	}
	
	//송장으로 이동경로 조회
	@GetMapping("/getshipschduleAdmin")
	@ResponseBody
	public Map<String, Object> getshipschduleAdmin(@RequestParam String ship_code) {
		System.out.println("넘어옴" + ship_code);
		List<ShipDTO> shipList = shipService.MovingShipSchedule(ship_code);
		Map<String, List<ShipDTO>> groupedShipList = shipList.stream()
				.collect(Collectors.groupingBy(ShipDTO::getShip_code));
		Map<String, Object> response = new HashMap<>();
		response.put("groupedShipList", groupedShipList); 
		return response;
	}
	
	//택배 정보 삭제
	@PostMapping("/deleteShipByShipCode")
	@ResponseBody
	public String deleteShipByShipCode(@RequestParam String ship_code) {
		boolean result = shipService.deleteShipByShipCode(ship_code);
		  if(result) {
		 return "success";
	  }else {
			return "error";
			}
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
	
	
		
	//레시피 삭제
	@GetMapping("/recipedeleteadmin/{recipe_id}")
	public String RecipeDeleteAdmin(@PathVariable int recipe_id) {
		boolean result = recipeService.recipeDeletById(recipe_id);
		if(result) {
			return "redirect:/admin/RecipeListAdmin";
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
	
	//리뷰 삭제
	@GetMapping("/reviewdeleteadmin/{review_id}")
	public String ReviewDeleteAdmin(@PathVariable int review_id) {
		boolean result = reviewService.reviewDeletById(review_id);
		if(result) {
			return "redirect:/amdin/ReviewRecipeAdmin";
		}else {
		return "error";
		}
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
			return "redirect:/admin/userListadmin";
		}else {
		return "error";
		}
	}

	
	//사용자 삭제
	@GetMapping("/userdeleteadmin/{user_id}")
	public String userDeleteAdmin(@PathVariable("user_id") String user_id) {
	boolean result = userService.deleteUserAdmin(user_id);
	if(result) {
		return "redirect:/admin/userListadmin";
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
	@GetMapping("/getAllManagerrAndPage")
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
		boolean result = adminService.ManagerUpdateToUser(user_id);
		if(result) {
			return "redirect:/admin/managerListadmin";
		}else {
		return "error";
		}
	}
	//매니저 관련 END-------------------------------------------------------------------
	
	//레시피 등록
		@GetMapping("/RecipePlus")
		public String insertRecipe(@ModelAttribute RecipeDTO recipe, Model model) throws JsonProcessingException {
			ObjectMapper objectMapper = new ObjectMapper();
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
	        return "redirect:/admin/RecipeListAdmin";
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
			 return "redirect:/admin/page";			 
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
			model.addAttribute("productlist",productlist);
			 model.addAttribute("pageInfo", pageRequestDTO);
			 return "admin/specialproductslistadmin";
		}
		
		//상품 삭제
		@GetMapping("/productdeleteadmin/{product_id}")
		public String ProductDeleteAdmin(@PathVariable int product_id) {
			boolean result = productService.productDeletById(product_id);
			if(result) {
				return "redirect:/admin/SpecialProductAllList";
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
