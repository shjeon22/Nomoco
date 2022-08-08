package com.nmc.persistence;

import com.nmc.domain.BoardVO;

public interface BoardDAO {
	

	// 글쓰기 (create)
	public void create(BoardVO vo);
}
