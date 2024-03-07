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
public class RefrigeratorProdcutDTO {

	
	private int refrigerator_product_id; 
	private String product_name; 
	private Integer product_quantity;
	private int refrigerator_id; 
	private Date append_date; 
	private Date limit_date; 
}
