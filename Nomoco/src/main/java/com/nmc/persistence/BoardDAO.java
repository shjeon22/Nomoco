package com.nmc.persistence;

import com.nmc.domain.BoardVO;

public interface BoardDAO {
	
	//글쓰기
	int insert(BoardVO vo) throws Exception;
	
	
	BoardVO select(Integer bno) throws Exception;
}
