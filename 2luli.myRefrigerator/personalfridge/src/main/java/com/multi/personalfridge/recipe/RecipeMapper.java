package com.multi.personalfridge.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface RecipeMapper {

	public List<RecipeDTO> getAllrecipe();

	public int insertRecipe(RecipeDTO recipe);

	public RecipeDTO getReturnInsertRecipe(String recipe_name);
	


}
