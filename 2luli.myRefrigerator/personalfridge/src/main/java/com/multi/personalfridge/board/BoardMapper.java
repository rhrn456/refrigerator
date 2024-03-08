package com.multi.personalfridge.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.BoardDTO;

@Mapper
public interface BoardMapper {
	
	public List<BoardDTO> getAllBoard(int bCategoryNo);

	public int insertBoard(BoardDTO newBoard);

	public BoardDTO getBoardByBoardNo(int boardNo);

	public int updateBoard(BoardDTO board);

	public int deleteBoardByBoardNo(int boardNo);
	
}