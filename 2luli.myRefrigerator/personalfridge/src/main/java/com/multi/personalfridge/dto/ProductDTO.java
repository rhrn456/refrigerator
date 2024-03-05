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
	private int productid;
	private String productname;
	private String productcontent;
	private String productquantity;
	private int productprice;
	private String productimg;
	private String appenddate;
	private String limitdate;
	private String productcategory;
	
}
