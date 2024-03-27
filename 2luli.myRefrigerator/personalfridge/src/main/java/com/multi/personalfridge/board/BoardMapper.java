package com.multi.personalfridge.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.BoardDTO;
import com.multi.personalfridge.dto.ProductDTO;

@Mapper
public interface BoardMapper {

	public List<BoardDTO> getAllBoardByCategoryNo(int CategoryNo);

	public BoardDTO getBoardByBoardNo(int boardNo);

	public int insertBoard(BoardDTO newBoard);

	public int updateBoard(BoardDTO newBoard);

	public int deleteBoardByBoardNo(int boardNo);

	public List<BoardDTO> getBoardByCategory(Map parameters);

	public List<BoardDTO> getBoardByCategoryAndPage(Map parameters);

	public void updateHit(int boardNo);

	public String getCategoryName(int categoryNo);
	
	
}
