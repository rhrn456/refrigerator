package com.multi.personalfridge.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.multi.personalfridge.dto.RecipeAndProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;

@Mapper
public interface RecipeProductMapper {

	int PlustRecipeProducts(RecipeProductDTO product);

	List<RecipeAndProductDTO> getRecipeProductListByRecipeId(int recipe_id);

	int deleteRecipeProductsByRecipeId(int recipe_id);
	
}
