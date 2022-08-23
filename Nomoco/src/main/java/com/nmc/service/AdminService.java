package com.nmc.service;

import java.util.List;

import com.nmc.domain.MemberVO;

public interface AdminService {
	// 전체회원정보(관리자용)
	public List<MemberVO> getMemberList(String id) throws Exception;

}
