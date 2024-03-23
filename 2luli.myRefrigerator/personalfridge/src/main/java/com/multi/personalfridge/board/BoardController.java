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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.personalfridge.dto.BoardCategoryDTO;
import com.multi.personalfridge.dto.BoardDTO;
import com.multi.personalfridge.dto.PageRequestDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
		service.updateHit(boardNo);
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
	public String insertBoard(@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam("CategoryNo") int CategoryNo,
								@RequestParam("latitude") double latitude,
								@RequestParam("longitude") double longitude,
								HttpServletRequest request) {
		BoardDTO newBoard = new BoardDTO();
		
		System.out.println(latitude);
		System.out.println(longitude);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		newBoard.setTitle(title);
		newBoard.setContent(content);
		newBoard.setB_category_no(CategoryNo);
		newBoard.setUser_id(userId);
		boolean result = service.insertBoard(newBoard);
		
		if(result) {
			return "redirect:/board?CategoryNo=" + CategoryNo;
		} else {
			return "../404";
		}
		
	}
	
	// Update
	@GetMapping("/updateBoard")
	public String updateForm(@RequestParam("boardNo") int boardNo, Model model) {
		
		BoardDTO board = service.getBoardByBoardNo(boardNo);
		String Category = service.getCategoryName(board.getB_category_no());
		
		if(Category.equals("notice")) {
			Category = "공지사항";
		} else if(Category.equals("shareBoard")) {
			Category = "공유 게시판";
		} else if(Category.equals("myRecipe")) {
			Category = "나만의 레시피";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("Category", Category);
		
		return "board/modifyBoard";
	}
	
	@PostMapping("/modifyBoard")
	public String modifyBoard(@RequestParam("boardNo") int boardNo, @ModelAttribute BoardDTO newBoard) {
		boolean result = false;
		
		BoardDTO board = service.getBoardByBoardNo(boardNo);
		
		if(board.getBoard_no() == boardNo) {
			board.setTitle(newBoard.getTitle());
			board.setContent(newBoard.getContent());
			result = service.updateBoard(board);
		}
		
		if(result) {
			return "redirect:/view?boardNo=" + boardNo;
		} else {
			return "../404";
		}
		
	}
	
	// Delete
	@GetMapping("/deleteBoard")
	public String deleteBoardByBoardNo(@RequestParam("boardNo") int boardNo) {
		BoardDTO board = service.getBoardByBoardNo(boardNo);
		int CategoryNo = board.getB_category_no();
		
		boolean result = service.deleteBoardByBoardNo(boardNo);
		
		if(result) {
			return "redirect:/board?CategoryNo=" + CategoryNo;
		} else {
			return "../404";
		}
		
	}
	
}
