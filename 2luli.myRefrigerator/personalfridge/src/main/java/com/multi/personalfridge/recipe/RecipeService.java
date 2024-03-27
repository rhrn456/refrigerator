package com.multi.personalfridge.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//모든 레시피 데이터 페이징
	public List<RecipeDTO> getAllRecipePage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return recipeMapper.getAllRecipePage(parameters);
	}
	
	//레시피 검색 데이터 페이징
	public List<RecipeDTO> getRecipesBykeywordAndPage(String category, String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("category", category);
	    parameters.put("keyword", keyword);
	    parameters.put("pageSize", pageSize);
	    parameters.put("offset", offset);
		return recipeMapper.getRecipesBykeywordAndPage(parameters);
	}

	//레시피 검색 총데이터 수 구하기
	public List<RecipeDTO> getRecipesBykeyword(String category, String keyword) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("category", category);
		parameters.put("keyword", keyword);
		return recipeMapper.getRecipesBykeyword(parameters);
	}

	//레시피 카테고리 총데이터 수 구하기
	public List<RecipeDTO> getRecipesByCategoryAndPage(String category, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("category", category);
	    parameters.put("pageSize", pageSize);
	    parameters.put("offset", offset);
		return recipeMapper.getRecipesByCategoryAndPage(parameters);
	}
		
	//레시피 카테고리 데이터 페이징
	public List<RecipeDTO> getRecipesByCategory(String category) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("category", category);
		return recipeMapper.getRecipesByCategory(parameters);
	}


	
	//레시피 삭제
	public boolean recipeDeletById(int recipe_id) {
		try {
		recipeMapper.recipeDeletById(recipe_id);
		return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	//레시피 업데이트
	public void recipetUpdate(RecipeDTO recipe) {
		recipeMapper.recipetUpdate(recipe);
		
	}

	//레시피 아이디로 조히하기
	public RecipeDTO getRecipeById(int recipe_id) {
		return recipeMapper.getRecipeById(recipe_id);
	}

	//인기 레시피 4종 가져오기
	public List<RecipeDTO> getPopularRecipe() {
	
		return recipeMapper.getPopularRecipe();
	}



}
