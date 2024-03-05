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
public class BoardDTO {
	private int board_no;
	private String title;
	private String content;
	private String user_id;
	private int b_category_no;
	private Date board_regdate;
	private int hit;
	private int product_id;
}
