package com.multi.personalfridge.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.personalfridge.dto.BoardDTO;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시판 카테고리/페이징
	@GetMapping("/getBoardByCategory")
	@ResponseBody
	public Map<String, Object> getBoardByCategoryNo(@RequestParam("CategoryNo") int CategoryNo, @RequestParam int page, @RequestParam int pageSize) {
	    Map<String, Object> parameters = new HashMap<>();
		List<BoardDTO> boardList = service.getBoardByCategory(CategoryNo);
	    List<BoardDTO> boards = service.getBoardByCategoryAndPage(CategoryNo, page, pageSize);
	    int totalBoards = boardList.size();
	    int totalPages = (int) Math.ceil((double) totalBoards / pageSize); 
		if(totalPages > 5) {
			totalPages = 5;
		}
		
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalBoards)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	    parameters.put("boards", boards);
	    parameters.put("pageInfo", pageRequestDTO);
	    return parameters;
	}
	
	// Read
	@GetMapping("/board")
	public String getAllBoardByCategoryNo(@RequestParam("CategoryNo") int CategoryNo, @RequestParam(defaultValue = "1") int page, Model model) {
		String Category = "";
		int pageSize = 10;
		
		if(CategoryNo == 1) {
			Category = "notice";
		} else if(CategoryNo == 2) {
			Category = "shareBoard";
		} else if(CategoryNo == 3) {
			Category = "myRecipe";
		} else {
			return "../404";
		}
		
		List<BoardDTO> boardList = service.getAllBoardByCategoryNo(CategoryNo);
		List<BoardDTO> boards = service.getBoardByCategoryAndPage(CategoryNo, page, pageSize);
	    int totalBoards = boardList.size();
	    int totalPages = (int) Math.ceil((double) totalBoards / pageSize); 
		if(totalPages > 5) {
			totalPages = 5;
		}
		
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalBoards)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
		
		model.addAttribute("boards", boards);
		model.addAttribute("pageInfo", pageRequestDTO);
		return "board/" + Category;
	}
	
	@GetMapping("/view")
	public String getBoardByBoardNo(@RequestParam("boardNo") int boardNo, Model model) {
		
		BoardDTO board = service.getBoardByBoardNo(boardNo);
		model.addAttribute("board", board);
		
		return "board/boardDetail";
	}
	
	// Create
	@GetMapping("/boardInsert")
	public String insertForm() {
		return "board/boardInsert";
	}
	
	@PostMapping("/insertBoard")
	public String insertBoard(BoardDTO newBoard) {
		boolean result = service.insertBoard(newBoard);
		
		if(result) {
			return "/";
		} else {
			return "../404";
		}
	}
	
	// Update
	@GetMapping("/updateBoard")
	public String updateForm() {
		return "/modifyBoard";
	}
	
	@PutMapping("/modifyBoard")
	public String modifyBoard(@RequestParam("boardNo") int boardNo, @ModelAttribute BoardDTO newBoard) {
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
			return "../404";
		}
		
	}
	
	// Delete
	@DeleteMapping("/deleteBoard")
	public String deleteBoardByBoardNo(@RequestParam("boardNo") int boardNo, @ModelAttribute BoardDTO board) {
		
		board = service.deleteBoardByBoardNo(boardNo);
		
		return "board/" + board.getB_category_no();
	}
	
}
