package com.multi.personalfridge.dto;

import java.sql.Date;
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
public class LikeDTO {

	private Integer like_id;
	private String user_id;
	private int recipe_id;
	private Timestamp like_date;
	private int board_no;
}
