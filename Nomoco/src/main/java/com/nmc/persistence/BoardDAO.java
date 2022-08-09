package com.nmc.persistence;

import java.util.List;

import com.nmc.domain.BoardVO;

public interface BoardDAO {
	

	// 글쓰기
	public void create(BoardVO vo) throws Exception;
	
	// 글목록
	public List<BoardVO> listAll() throws Exception;
	
	//조회수 1증가
	public void updateBoardCnt(Integer bno) throws Exception;
	
	//글 상세보기
	public BoardVO getBoard(Integer bno) throws Exception;
	
	//글수정
	public void updateBoard(BoardVO vo) throws Exception;
	
	//글삭제
	public void removeBoard(Integer bno) throws Exception;

}
