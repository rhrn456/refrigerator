package com.multi.personalfridge.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.personalfridge.dto.BoardDTO;
import com.multi.personalfridge.dto.UserDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// Read
	@GetMapping("/board")
	public String getAllBoardByCategoryNo(@RequestParam("CategoryNo") int CategoryNo, Model model) {
		String Category = "";
		
		List<BoardDTO> boardList = service.getAllBoardByCategoryNo(CategoryNo);
		model.addAttribute("boardList", boardList);
		
		if(CategoryNo == 1) {
			Category = "notice";
		} else if(CategoryNo == 2) {
			Category = "shareBoard";
		} else if(CategoryNo == 3) {
			Category = "myRecipe";
		} else {
			return "/404";
		}
		
		return "board/" + Category;
	}
	
	public String getBoardByBoardNo(@RequestParam("boardNo") int boardNo, Model model) {
		
		BoardDTO board = service.getBoardByBoardNo(boardNo);
		model.addAttribute("board", board);
		
		return "/boardDetail";
	}
	
	// Create
	@GetMapping("/board")
	public String insertForm() {
		return "/insert";
	}
	
	@PostMapping("/insert")
	public String insertBoard(BoardDTO newBoard) {
		boolean result = service.insertBoard(newBoard);
		
		if(result) {
			return "/index";
		} else {
			return "/404";
		}
	}
	
	// Update
	@GetMapping("/board")
	public String updateForm() {
		return "/update";
	}
	
	@PutMapping("/modify")
	public String updateBoard(@RequestParam("boardNo") int boardNo, @ModelAttribute BoardDTO newBoard) {
		boolean result = false;
		BoardDTO board = null;
		
		board = service.getBoardByBoardNo(boardNo);
		
		if(board.getBoard_no() == newBoard.getBoard_no()) {
			board.setTitle(newBoard.getTitle());
			board.setContent(newBoard.getContent());
			result = service.updateBoard(newBoard);
		}
		
		if(result) {
			return "/boardDetail/" + boardNo;
		} else {
			return "/404";
		}
		
	}
	
	// Delete
	@DeleteMapping("/delete")
	public String deleteBoardByBoardNo(@RequestParam("boardNo") int boardNo, @ModelAttribute BoardDTO board) {
		
		board = service.deleteBoardByBoardNo(boardNo);
		
		return "board/" + board.getB_category_no();
	}
	
}
