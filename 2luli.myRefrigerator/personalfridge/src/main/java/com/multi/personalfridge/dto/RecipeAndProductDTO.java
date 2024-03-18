package com.multi.personalfridge.dto;

import java.sql.Timestamp;

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
public class RecipeAndProductDTO {
    private Integer recipe_product_id;
    private Integer recipe_id;
    private Integer product_id;
    private Integer product_quantity;
    private String product_name;
    private String product_img;
}
