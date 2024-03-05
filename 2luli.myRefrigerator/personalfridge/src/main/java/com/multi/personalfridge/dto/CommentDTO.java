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
	
	private int commentNo;				
	private int boardNo;			
	private String cContent;
	private String regDate;
	private String userId;
}
