package com.multi.personalfridge.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.product.ProductService;

@Controller
public class RecipeController {
	@Autowired
	RecipeService recipeservice;
	
	
	@RequestMapping("/test")
	public void test() {
		//WEB-INF/views/test.jsp
	}
	
	@RequestMapping("/insertRecipe")
	public void insertRecipe(RecipeDTO recipeDTO) {
		//System.out.println(recipeDTO);
		boolean insertrecipe = recipeservice.insertRecipe(recipeDTO);
		//WEB-INF/views/insertInit.jsp
		System.out.println(insertrecipe);
	}
	

	//레시피목록 
	@GetMapping("/recipe")
	public ModelAndView getRecipeList(ModelAndView mv) {
		List<RecipeDTO> recipeList = recipeservice.recipeList();
		mv.setViewName("recipeList");
		mv.addObject("recipeList", recipeList);
		
		return mv;
	}
	


	
	
	

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
    
	

}
