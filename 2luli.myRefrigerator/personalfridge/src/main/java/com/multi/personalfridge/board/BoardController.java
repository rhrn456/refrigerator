package com.multi.personalfridge.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.tags.shaded.org.apache.bcel.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.personalfridge.common.EmailService;
import com.multi.personalfridge.dto.BoardCategoryDTO;
import com.multi.personalfridge.dto.BoardDTO;
import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.user.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	
	// 게시판 카테고리/페이징
	@GetMapping("/getBoardByCategoryNoAndSearch")
	@ResponseBody
	public Map<String, Object> getBoardByCategoryNo(@RequestParam("CategoryNo") int CategoryNo,@RequestParam String keyword, @RequestParam int page, @RequestParam int pageSize) {
		Map<String, Object> parameters = new HashMap<>();
		List<BoardDTO> boardList = service.getAllBoardByCategoryNo(CategoryNo, keyword);
	    List<BoardDTO> boards = service.getBoardByCategoryAndPage(CategoryNo,keyword, page, pageSize);
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
		String keyword = "";
		int pageSize = 10;
		
		if(CategoryNo == 1) {
			Category = "notice";
		} else if(CategoryNo == 2) {
			Category = "shareBoard";
		} else if(CategoryNo == 3) {
			Category = "myRecipe";
		} else {
			return "error/error";
		}
		
		List<BoardDTO> boardList = service.getAllBoardByCategoryNo(CategoryNo, keyword);
		List<BoardDTO> boards = service.getBoardByCategoryAndPage(CategoryNo, keyword, page, pageSize);
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
		
		return "/board/boardDetail";
	}
	
	// Create
	@GetMapping("/mypage/boardInsert")
	public String insertForm() {
		return "board/boardInsert";
	}
	
	@PostMapping("/insertBoard")
	public String insertBoard(@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam("CategoryNo") int CategoryNo,
								@RequestParam(value = "latitude", required=false) Double latitude,
								@RequestParam(value = "longitude", required=false) Double longitude,
								HttpServletRequest request) {
		BoardDTO newBoard = new BoardDTO();
		
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		newBoard.setTitle(title);
		newBoard.setContent(content);
		newBoard.setB_category_no(CategoryNo);
		newBoard.setUser_id(userId);
		newBoard.setLatitude(latitude);
		newBoard.setLongitude(longitude);
		boolean result = service.insertBoard(newBoard);
		
		if(result) {
			return "redirect:/board?CategoryNo=" + CategoryNo;
		} else {
			return "error/error";
		}
		
	}
	
	// Update
	@GetMapping("/mypage/updateBoard")
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
	public String modifyBoard(@RequestParam("boardNo") int boardNo,
								@ModelAttribute BoardDTO newBoard) {
		boolean result = false;
		BoardDTO board = service.getBoardByBoardNo(boardNo);
		
		if(board.getBoard_no() == boardNo) {
			board.setTitle(newBoard.getTitle());
			board.setContent(newBoard.getContent());
			board.setLatitude(newBoard.getLatitude());
			board.setLongitude(newBoard.getLongitude());
			result = service.updateBoard(board);
		}
		
		if(result) {
			return "redirect:/view?boardNo=" + boardNo;
		} else {
			return "error/error";
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
			return "error/error";
		}
		
	}
	
	@PostMapping("/mypage/requestShare")
	public ResponseEntity<String> requestShare(Integer board_no, HttpServletRequest request){
		//보드넘버로 작성자이메일, 세션유저로 로그인유저 이메일 가져와서 작성자에게 로그인유저의 유저네임과 메일을 함게 보내줌 
		String userId = (String) request.getSession().getAttribute("userId");
		BoardDTO board = service.getBoardByBoardNo(board_no);		
		UserDTO writer = userService.getUserById(board.getUser_id());
		UserDTO user = userService.getUserById(userId);
		String writerMail = writer.getMail();		
		String userMail = user.getMail();
		String userName = user.getUser_name();
		String[] contentText = board.getTitle().split(" ");
		String content = contentText[0];
		
		emailService.sendSimpleMessage(writerMail, content + " 공유받고 싶어요~", "안녕하세요, 우리집AI냉장고 유저 " + userName + "입니다. " + userMail + "로 연락주세요");
		return ResponseEntity.ok("good");
	}
	
}
