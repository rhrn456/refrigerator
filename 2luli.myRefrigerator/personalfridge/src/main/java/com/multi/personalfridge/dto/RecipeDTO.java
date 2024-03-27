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
	private Integer recipe_id;
	private String recipe_name;
	private String recipe_content;
	private String ingredient;
	private String recipe_category;
	private String recipe_img;
	private String nutrition_facts;
}
