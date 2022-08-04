package com.nmc.persistence;


import com.nmc.domain.MemberVO;

public interface MemberDAO {

	//회원가입
	public void insertMember(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO vo) throws Exception;

	//회원정보 조회
	public MemberVO getMember(String id) throws Exception;

	//회원정보 수정(이름,이메일,전화번호,주소)
	public Integer updateMember(MemberVO vo) throws Exception;

	//회원탈퇴
	public void deleteMember(MemberVO dvo) throws Exception;
	
	//id확인
	public int idCnt (MemberVO vo) throws Exception;


}
