package com.multi.personalfridge.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class RecipeDTO {
	private int recipeId;
	private String recipeName;
	private String recipeContent;
	private String ingredient;
	private String recipeCategory;
	private String recipeImg;
	private String nutritionFacts;
}
