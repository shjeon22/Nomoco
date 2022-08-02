package com.nmc.persistence;

import com.nmc.domain.MemberVO;

public interface MemberDAO {

	//회원가입
	public void insertMember(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO vo) throws Exception;
}
