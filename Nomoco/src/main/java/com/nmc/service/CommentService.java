package com.nmc.service;

import java.util.List;

import com.nmc.domain.CommentVO;

public interface CommentService {

	//개수
	public int getCount(Integer bno) throws Exception;
	
	//댓글 작성
	public int write(CommentVO vo) throws Exception;
	
	//리스트
	public List<CommentVO> getList(Integer bno) throws Exception;
	
	//읽기
	public CommentVO read(Integer cno) throws Exception;
    
	//수정
	public int modify(CommentVO vo) throws Exception;

	//삭제
	public int remove(Integer cno, Integer bno, String commenter) throws Exception;

	
}
