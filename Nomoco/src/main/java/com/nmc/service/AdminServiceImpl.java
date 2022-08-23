package com.nmc.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nmc.domain.MemberVO;
import com.nmc.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Inject
	private AdminDAO dao;

	@Override
	public List<MemberVO> getMemberList(String id) throws Exception {
		log.info("getMemberList(String id) 호출");
		return dao.getMemberList(id);
	}
}
