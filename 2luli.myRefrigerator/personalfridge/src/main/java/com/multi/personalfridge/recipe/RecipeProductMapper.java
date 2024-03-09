package com.multi.personalfridge.recipe;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.RecipeProductDTO;

@Mapper
public interface RecipeProductMapper {

	int PlustRecipeProducts(RecipeProductDTO product);

	
}
