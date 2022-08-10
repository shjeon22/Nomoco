package com.nmc.service;

import java.util.List;
import java.util.Map;

import com.nmc.domain.BoardVO;

public interface BoardService {
	
	//총개수
	public int getCount() throws Exception;
	
	
	// 글쓰기
	public void boardCreate(BoardVO vo) throws Exception;

	// 글목록
	public List<BoardVO> getBoardListALL() throws Exception;

	// 페이징
	
	public List<BoardVO> getPage(Map<String, Integer> map) throws Exception;

	// 조회수증가
	//public void updateBoardCount(Integer bno) throws Exception;

	// 글상세보기// 조회수증가
	public BoardVO readBoard(Integer bno) throws Exception;

	// 글수정
	public int modify(BoardVO vo) throws Exception;

	// 글 삭제
	public int remove(Integer bno, String writer) throws Exception;

}
