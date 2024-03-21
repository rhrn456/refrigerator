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
public class CartDTO {
	private Integer cart_id;
	private String user_id;
	private int product_id;
	private Integer product_quantity;
	private int product_buycheck;
}
