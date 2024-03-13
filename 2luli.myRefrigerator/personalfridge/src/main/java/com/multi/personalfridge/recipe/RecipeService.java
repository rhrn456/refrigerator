package com.multi.personalfridge.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.admin.AdminMapper;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.UserDTO;

@Service
public class RecipeService {

	@Autowired
	RecipeMapper recipeMapper;
	

	
	//레시피목록
	public List<RecipeDTO> recipeList() {
		List<RecipeDTO> recipeList = recipeMapper.getAllrecipe();
		return recipeList;
	}


	public List<RecipeDTO> getAllrecipe() {
		
		return recipeMapper.getAllrecipe();
	}

	public boolean insertRecipe(RecipeDTO recipe) {
		try {
			recipeMapper.insertRecipe(recipe);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}

	public RecipeDTO getReturnInsertRecipe(String recipe_name) {
		
		return recipeMapper.getReturnInsertRecipe(recipe_name);
	}

}
