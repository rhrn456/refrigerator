package com.multi.personalfridge.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.personalfridge.dto.BoardDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시판 카테고리 이동
	@GetMapping("/board")
	public String getBoardByCategoryNo(@RequestParam String CategoryNo) {
		String Category = "";
		int cateNum = Integer.parseInt(CategoryNo);
		
		if(cateNum == 1) {
			Category = "notice";
		} else if(cateNum == 2) {
			Category = "shareBoard";
		} else if(cateNum == 3) {
			Category = "myRecipe";
		} else {
			return "error";
		}
		
		return "board/" + Category;
	}
	
	// Read
	public String getAllBoard() {
		
		return "board";
	}
	
	// Create
	
	// Update
	
	// Delete
	
}
