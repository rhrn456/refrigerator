package com.multi.personalfridge.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	public List<BoardDTO> getAllBoardByCategoryNo(int CategoryNo);

	public BoardDTO getBoardByBoardNo(int boardNo);

	public int insertBoard(BoardDTO newBoard);

	public int updateBoard(BoardDTO newBoard);

	public BoardDTO deleteBoardByBoardNo(int boardNo);
	
	
}
