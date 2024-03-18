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
import com.multi.personalfridge.product.ProductService;

@Controller
@RequestMapping("recipe")
public class RecipeController {

	private final RecipeService recipeService;
	private final ProductService productService;
	private final RecipeProductService recipeProductService;
	
	@Autowired
	public RecipeController(RecipeService recipeService,
			ProductService productService,
			RecipeProductService recipeProductService) {
		this.recipeService = recipeService;
		this.productService = productService;
		this.recipeProductService = recipeProductService;
	}
	
	
	
	@GetMapping("/test")
	public void test() {
		//WEB-INF/views/test.jsp
	}
	
	//insertRecipe
	//recipe/insertRecipe
	@RequestMapping("/insertRecipe")
	public void insertRecipe(RecipeDTO recipeDTO) {
		//System.out.println(recipeDTO);
		boolean insertrecipe = recipeService.insertRecipe(recipeDTO);
		//WEB-INF/views/recipe/insertInit.jsp
		System.out.println(insertrecipe);
	}
	

	//레시피목록 
	@GetMapping("/recipe")
	public ModelAndView getRecipeList(ModelAndView mv) {
		List<RecipeDTO> recipeList = recipeService.recipeList();
		mv.setViewName("recipeList");
		mv.addObject("recipeList", recipeList);
		
		return mv;
	}
	

	@GetMapping("/recipedetail")
	public String getRecipeById(@RequestParam int recipe_id, Model model) {
		System.out.println("실행");
		System.out.println(recipe_id);
		RecipeDTO recipe = recipeService.getRecipeById(recipe_id);
		List<RecipeAndProductDTO> recipeProductList = recipeProductService.getRecipeProductListByRecipeId(recipe_id);
		model.addAttribute("recipe", recipe);
		model.addAttribute("recipeProductList",recipeProductList);
		return "recipe/recipedetail";
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
	
	
	//화면이동


	
//	---------레시피 추가---------------------

	@GetMapping("/RecipePlus")
	public String insertRecipe(@ModelAttribute RecipeDTO recipe, Model model) {
		System.out.println(recipe);
	    boolean result = recipeService.insertRecipe(recipe);
	    RecipeDTO onerecipe = recipeService.getReturnInsertRecipe(recipe.getRecipe_name());
	    List<ProductDTO> productList = productService.getFullProduct();
	    System.out.println(productList);
	    System.out.println(productList.size());
	    System.out.println(onerecipe);
	    if (result) {
	    	model.addAttribute("onerecipe",onerecipe);
	    	model.addAttribute("productList",productList);
	        return "admin/plusrecipeproducts";
	    }
	    return "error";
	}
	
	@GetMapping("/RecipeProductPlus")
	public String PlustRecipeProducts(@RequestParam("recipeProducts") String recipeProductsJson) { 
	    ObjectMapper objectMapper = new ObjectMapper(); 
	    System.out.println(recipeProductsJson); 
	    
	    try {
	        // JSON 문자열을 RecipeProductDTO 배열로 변환
	        RecipeProductDTO[] recipeProducts = objectMapper.readValue(recipeProductsJson, RecipeProductDTO[].class);
	        
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

}
