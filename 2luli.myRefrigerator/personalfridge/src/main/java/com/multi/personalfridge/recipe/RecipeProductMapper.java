package com.multi.personalfridge.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;

@Mapper
public interface RecipeProductMapper {

	int PlustRecipeProducts(RecipeProductDTO product);


	
}
