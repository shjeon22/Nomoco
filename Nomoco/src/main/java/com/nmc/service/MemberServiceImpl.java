package com.nmc.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nmc.domain.MemberVO;
import com.nmc.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject 
	private MemberDAO dao;

	@Override
	public void memberInsert(MemberVO vo)  throws Exception{
        log.info("memberInsert(vo) 서비스 호출");
        
        // 순서 : 컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB
		dao.insertMember(vo);// 인터페이스안에 있는동작이지만 오버라이딩되어있는거 호출
	    
		log.info("DAO 처리완료 => 컨트롤러 이동");
	}
	
	
}
