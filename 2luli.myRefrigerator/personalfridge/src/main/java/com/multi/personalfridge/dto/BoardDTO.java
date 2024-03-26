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
public class BoardDTO {
	private Integer board_no;
	private String title;
	private String content;
	private String user_id;
	private int b_category_no;
	private Timestamp board_create_date;
	private Integer hit;
	private Integer refrigerator_product_id;
	private Double latitude;
	private Double longitude;
}
