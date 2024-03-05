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
	private int boardNo;
	private String title;
	private String content;
	private String userId;
	private int bCategoryNo;
	private int productId;
	private Date boardCreatDate;
	private int hit;
}
