package com.multi.personalfridge.dto;

import java.sql.Date;

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
public class ProductDTO {

	private Integer product_id;
	private String product_name;
	private String product_content;
	private int product_quantity;
	private int product_price;
	private String product_img;
	private Date append_date;
	private int limit_date;
	private String product_category;
    private boolean special_product;
	
}
