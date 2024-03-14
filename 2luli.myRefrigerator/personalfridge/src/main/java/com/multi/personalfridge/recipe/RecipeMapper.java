package com.multi.personalfridge.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface RecipeMapper {

	public List<RecipeDTO> getAllrecipe();

	public int insertRecipe(RecipeDTO recipe);

	public RecipeDTO getReturnInsertRecipe(String recipe_name);

	//모든 레시피 페이징
	public List<RecipeDTO> getAllRecipePage(Map parameters);
	
	//레시피 검색 데이터 페이징
	public List<RecipeDTO> getRecipesBykeywordAndPage(Map parameters);

	//레시피 검색 총데이터 수 구하기
	public List<RecipeDTO> getRecipesBykeyword(Map parameters);

	//레시피 카테고리 총데이터 수 구하기
	public List<RecipeDTO> getRecipesByCategoryAndPage(Map parameters);

	//레시피 카테고리 데이터 페이징
	public List<RecipeDTO> getRecipesByCategory(Map parameters);

	//레시피 삭제
	public int recipeDeletById(int recipe_id);

	//레시피 업데이트
	public int recipetUpdate(RecipeDTO recipe);

	//레시피 조회
	public RecipeDTO getRecipeById(int recipe_id);
	
	


}
