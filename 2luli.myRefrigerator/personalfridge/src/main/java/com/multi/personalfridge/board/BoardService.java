package com.multi.personalfridge.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;

	public List<BoardDTO> getAllBoardByCategoryNo(int CategoryNo) {
		return mapper.getAllBoardByCategoryNo(CategoryNo);
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

	public BoardDTO deleteBoardByBoardNo(int boardNo) {
		return mapper.deleteBoardByBoardNo(boardNo);
	}
	
	
}
