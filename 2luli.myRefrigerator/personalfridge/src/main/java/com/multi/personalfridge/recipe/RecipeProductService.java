package com.multi.personalfridge.recipe;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.RecipeAndProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;

@Service
public class RecipeProductService {

	
	@Autowired
	RecipeProductMapper recipeProductMapper;

	
	public boolean PlustRecipeProducts(RecipeProductDTO product) {
		try {
			recipeProductMapper.PlustRecipeProducts(product);
		return true; 
	
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}

	
	public List<RecipeAndProductDTO> getRecipeProductListByRecipeId(int recipe_id) {
		return recipeProductMapper.getRecipeProductListByRecipeId(recipe_id);
	}


	public boolean deleteRecipeProductsByRecipeId(int recipe_id) {
		try {
			recipeProductMapper.deleteRecipeProductsByRecipeId(recipe_id);
		return true; 
	
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}
	
	public List<Integer> getRecipeIdByProductId(int product_id) {
		return recipeProductMapper.getRecipeIdByProductId(product_id);
	}
}

