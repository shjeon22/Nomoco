package com.nmc.service;

import com.nmc.domain.MemberVO;

public interface MemberService {

	
	//회원가입
	public void memberInsert(MemberVO vo) throws Exception;

	//로그인
	public MemberVO loginCheck(MemberVO vo) throws Exception;
}