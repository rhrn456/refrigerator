package com.multi.personalfridge.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;

	public List<BoardDTO> getAllBoard(int bCategoryNo) {
		
		return mapper.getAllBoard(bCategoryNo);
	}

	public boolean insertBoard(BoardDTO newBoard) {
		boolean result = false;
		
		int res = mapper.insertBoard(newBoard);
		
		if(res != 0) {
			result = true;
		} else {
			new Exception("게시글 작성 실패");
		}
		
		return result;
	}

	public BoardDTO getBoardByBoardNo(int boardNo) {
		
		BoardDTO board = mapper.getBoardByBoardNo(boardNo);
		
		return null;
	}

	public boolean updateBoard(BoardDTO board) {
		boolean result = false;
		
		int res = mapper.updateBoard(board);
		if(res != 0) {
			result = true;
		} else {
			new Exception("게시글 수정 실패");
		}
		
		return result;
	}

	public void deleteBoardByBoardNo(int boardNo) throws Exception {
		int res = mapper.deleteBoardByBoardNo(boardNo);
		
		if(res == 0) {
			throw new Exception("게시글 삭제에 실패했습니다.");
		}
	}
	
}
