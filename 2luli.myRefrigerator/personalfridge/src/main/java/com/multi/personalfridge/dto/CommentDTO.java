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
public class CommentDTO {
	
	private Integer comment_no;				
	private int board_no;			
	private String c_content;
	private String reg_date;
	private String user_id;
}
