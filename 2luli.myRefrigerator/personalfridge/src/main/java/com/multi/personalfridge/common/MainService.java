package com.multi.personalfridge.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.multi.personalfridge.dto.RecipeDTO;

@Service
public class MainService {
	
	@Autowired
	MainMapper mapper;

	public List<RecipeDTO> getMainRecipe() {
		
		return mapper.getMainRecipe();
	}
	
}
