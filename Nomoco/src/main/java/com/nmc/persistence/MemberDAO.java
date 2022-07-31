package com.nmc.persistence;

import com.nmc.domain.MemberVO;

public interface MemberDAO {

	//회원가입
	public void insertMember(MemberVO vo) throws Exception;
}
