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
    
	

}
