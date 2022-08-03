package com.nmc.persistence;

import java.util.List;

import com.nmc.domain.MemberVO;

public interface AdminDAO {

	//전체회원목록(관리자용)
	public List<MemberVO> getMemberList(String adminID) throws Exception;
}
