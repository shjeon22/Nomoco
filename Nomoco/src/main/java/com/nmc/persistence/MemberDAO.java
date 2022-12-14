package com.nmc.persistence;

import com.nmc.domain.MemberVO;

public interface MemberDAO {

	// 회원가입
	public void insertMember(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO loginMember(MemberVO vo) throws Exception;

	// 회원정보 조회
	public MemberVO getMember(String id) throws Exception;

	// 회원정보 수정(이름,이메일,전화번호,주소)
	public Integer updateMember(MemberVO vo) throws Exception;

	// 회원탈퇴
	public void deleteMember(MemberVO dvo) throws Exception;
	
	//회원탈퇴 체크
	public int delChk(MemberVO vo) throws Exception;

	// id중복체크
	public int idchk(String id) throws Exception;

	// tel중복체크
	public int telChk(String tel) throws Exception;

	// email중복체크
	public int emailChk(String email) throws Exception;
	
	

}
