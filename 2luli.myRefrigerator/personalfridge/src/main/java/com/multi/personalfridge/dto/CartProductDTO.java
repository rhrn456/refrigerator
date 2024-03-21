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
public class CartProductDTO {
    private Integer cart_id;
    private Integer product_id;
    private Integer product_quantity;
    private String product_name;
    private String product_price;
    private String product_img;
    private int special_product;

}