package com.multi.personalfridge.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.RecipeDTO;

@Mapper
public interface MainMapper {

	List<RecipeDTO> getMainRecipe();

}
