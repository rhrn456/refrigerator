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
public class ProductDTO {

	private int productId;
	private String productName;
	private String productContent;
	private Integer productQuantity;
	private Integer productPrice;
	private String productImg;
	private String appendDate;
	private String limitDate;
	private String productCategory;
	
}
