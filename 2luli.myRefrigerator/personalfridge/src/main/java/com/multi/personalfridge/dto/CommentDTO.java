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
	
	private int comment_no;				
	private int boardid;			
	private String c_content;
	private String regdate;
	private String userid;
}
