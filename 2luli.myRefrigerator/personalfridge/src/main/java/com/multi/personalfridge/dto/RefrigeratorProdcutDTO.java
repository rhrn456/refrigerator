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

	
	private int refrigeratorProduct_id; 
	private String productName; 
	private Integer productQuantity;
	private int refrigeratorId; 
	private Date appendDate; 
	private Date limitDate; 
}
