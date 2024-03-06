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

	public List<RecipeDTO> getAllrecipe() {
		
		return recipeMapper.getAllrecipe();
	}

}
