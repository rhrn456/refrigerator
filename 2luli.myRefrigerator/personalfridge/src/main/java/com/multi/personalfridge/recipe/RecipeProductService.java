package com.multi.personalfridge.recipe;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.RecipeProductDTO;

@Service
public class RecipeProductService {

	
	@Autowired
	RecipeProductMapper recipeProductMapper;

	
	public boolean PlustRecipeProducts(RecipeProductDTO product) {
		System.out.println(product);
		try {
			recipeProductMapper.PlustRecipeProducts(product);
		return true; 
	
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}

}

