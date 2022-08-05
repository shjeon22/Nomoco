package com.nmc.service;


import com.nmc.domain.MemberVO;

public interface MemberService {

	
	//회원가입
	public void memberInsert(MemberVO vo) throws Exception;

	//로그인
	public MemberVO loginCheck(MemberVO vo) throws Exception;

	//회원정보 조회
	public MemberVO getMember(String id) throws Exception;

	//회원정보 수정
	public Integer updateMember(MemberVO vo) throws Exception;

	//회원정보 삭제
	public void deleteMember(MemberVO vo) throws Exception;
	
	//id중복체크
	public int idChk(String id) throws Exception;
	
	//tel중복체크
	public int telChk(String tel) throws Exception;
	
	//email중복체크
	public int emailChk(String email) throws Exception;

	
	
}
