package com.multi.personalfridge.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.BoardDTO;
import com.multi.personalfridge.dto.ProductDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;

	public List<BoardDTO> getAllBoardByCategoryNo(int CategoryNo, String keyword) {
		 Map<String, Object> parameters = new HashMap<>();
		    parameters.put("CategoryNo", CategoryNo);
		    parameters.put("keyword", keyword);
		return mapper.getAllBoardByCategoryNo(parameters);
	}

	public BoardDTO getBoardByBoardNo(int boardNo) {
		return mapper.getBoardByBoardNo(boardNo);
	}

	public boolean insertBoard(BoardDTO newBoard) {
		int res = mapper.insertBoard(newBoard);
		
		if(res != 0) {
			return true;
		}
		
		return false;
	}

	public boolean updateBoard(BoardDTO newBoard) {
		int res = mapper.updateBoard(newBoard);
		
		if(res != 0) {
			return true;
		}
		return false;
	}

	public boolean deleteBoardByBoardNo(int boardNo) {
		int res = mapper.deleteBoardByBoardNo(boardNo);
		
		if(res != 0) {
			return true;
		}
		return false;
	}
	
	// 게시판 카테고리 이름 가져오기
	public String getCategoryName(int CategoryNo) {
		return mapper.getCategoryName(CategoryNo);
	}
	
	// 게시판 카테고리 페이지 보여주기
	public List<BoardDTO> getBoardByCategoryAndPage(int CategoryNo, String keyword, int page, int pageSize) {
		 int offset = (page - 1) * pageSize;
		    Map<String, Object> parameters = new HashMap<>();
		    parameters.put("CategoryNo", CategoryNo);
		    parameters.put("keyword", keyword);
		    parameters.put("pageSize", pageSize);
		    parameters.put("offset", offset);
		    return mapper.getBoardByCategoryAndPage(parameters);
	}

	public void updateHit(int boardNo) {
		mapper.updateHit(boardNo);
	}
	
}
