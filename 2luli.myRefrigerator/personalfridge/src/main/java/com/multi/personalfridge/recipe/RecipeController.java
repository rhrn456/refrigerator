package com.multi.personalfridge.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.product.ProductService;

@Controller
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
