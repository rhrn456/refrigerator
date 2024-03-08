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
public class RecipeProductDTO {
	
	private int recipeProductId;
	private int recipeId; 
	private int productId; 
	private Integer product_quantity; 
}
