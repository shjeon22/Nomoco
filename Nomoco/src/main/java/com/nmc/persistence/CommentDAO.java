package com.nmc.persistence;

import java.util.List;

import com.nmc.domain.CommentVO;

public interface CommentDAO {
	
	//댓글작성
	public int insert(CommentVO vo) throws Exception;
	
	//지정된 게시물의 모든 댓글을 가져오는 메서드
	public List<CommentVO> selectAll(Integer bno) throws Exception;

	//댓글읽기
	public CommentVO select(Integer cno) throws Exception;
	
	//개수
	public int count(Integer bno) throws Exception;

	//수정
	public int update(CommentVO vo) throws Exception;
	
	//삭제
	public int delete(Integer cno, String commenter) throws Exception;
	
	//삭제All
	public int deleteAll(Integer bno);
}
