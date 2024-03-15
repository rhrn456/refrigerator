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
	
	private Integer recipe_product_id;
	private int recipe_id; 
	private int product_id; 
	private int product_quantity; 
}
