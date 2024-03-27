package com.multi.personalfridge.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeAndProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.dto.ReviewDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.review.ReviewService;

@Controller
public class RecipeController {

	private final RecipeService recipeService;
	private final ProductService productService;
	private final RecipeProductService recipeProductService;
	private final ReviewService reviewService;
	
	@Autowired
	public RecipeController(RecipeService recipeService,
			ProductService productService,
			RecipeProductService recipeProductService,
			ReviewService reviewService) {
		this.recipeService = recipeService;
		this.productService = productService;
		this.recipeProductService = recipeProductService;
		this.reviewService = reviewService;
	}
	
	
	@GetMapping("/test")
	public String test() {

		return "/recipe/test";
	}
	
	//레시피목록 
	@GetMapping("/recipe")
	public ModelAndView getRecipeList(ModelAndView mv) {
		List<RecipeDTO> recipeList = recipeService.recipeList();
		mv.setViewName("recipeList");
		mv.addObject("recipeList", recipeList);
		
		return mv;
	}
	
	@RequestMapping("/insertRecipe")
	public void insertRecipe(RecipeDTO recipeDTO) {
		System.out.println(recipeDTO);
		boolean insertrecipe = recipeService.insertRecipe(recipeDTO);
		//WEB-INF/views/recipe/insertInit.jsp
	}

	@GetMapping("/recipedetail")
	public String getRecipeById(@RequestParam int recipe_id, Model model) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		RecipeDTO recipe = recipeService.getRecipeById(recipe_id);
		List<ProductDTO> productList = productService.getFullProduct();
		List<ReviewDTO> reviewList = reviewService.getReviewByRecipeId(recipe_id);
		List<RecipeAndProductDTO> recipeproductList = recipeProductService.getRecipeProductListByRecipeId(recipe_id);
		String recipeproductListJson = objectMapper.writeValueAsString(recipeproductList);
		model.addAttribute("recipe", recipe);
		model.addAttribute("productList", productList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("recipeproductListJson", recipeproductListJson);

		return "recipe/recipedetail";
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

	
		//메인에서 검색하기
		@GetMapping("/mainSearch")
		public String mainSearch(@RequestParam String keyword, @RequestParam(defaultValue ="1") int page, Model model) {
			int pageSize = 9;
			String category = "";
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
		    model.addAttribute("recipelist", recipes);
		    model.addAttribute("pageInfo", pageRequestDTO);
		    return "recipe/recipeshop";
		}
		


}
