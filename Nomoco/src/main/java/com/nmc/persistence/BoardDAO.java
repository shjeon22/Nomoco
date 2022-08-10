package com.nmc.persistence;

import java.util.*;

import com.nmc.domain.BoardVO;

public interface BoardDAO {

	// 총개수
	public int count() throws Exception;

	// 글쓰기
	public void create(BoardVO vo) throws Exception;

	// 글목록
	public List<BoardVO> listAll() throws Exception;

	// 글 페이징 리스트
	public List<BoardVO> selectPage(Map<String, Integer> map) throws Exception;

	// 조회수 1증가
	public void updateBoardCnt(Integer bno) throws Exception;

	// 글 상세보기
	public BoardVO getBoard(Integer bno) throws Exception;

	// 글수정
	public int update(BoardVO vo) throws Exception;

	// 글삭제
	public int delete(Integer bno, String writer) throws Exception;

}
