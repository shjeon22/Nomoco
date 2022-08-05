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
        
		dao.insertMember(vo);// 인터페이스안에 있는동작이지만 오버라이딩되어있는거 호출
	    
		log.info("DAO 처리완료 => 컨트롤러 이동");
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) throws Exception {
		log.info("loginCheck(vo) 호출");
		
		MemberVO loginResultVO = dao.loginMember(vo);
		log.info(loginResultVO+"");
		
		return loginResultVO;// 서비스를 호출햇던 멤머 컨트롤러로 리턴됨
	}
	

	@Override
	public MemberVO getMember(String id) throws Exception {
        log.info("getMember(id) 호출");
        MemberVO vo =dao.getMember(id);
		return vo;
	}

	@Override
	public Integer updateMember(MemberVO vo) throws Exception {
       log.info("updateMember(vo) 호출");
       
       int resultCnt= dao.updateMember(vo);
       log.info("resultCnt : "+resultCnt+" (SERVICE페이지)");
		return resultCnt;
	}

	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		
		dao.deleteMember(vo);//dao에 있는 dvo 대신 서비스에있는 vo매개변수로 담아서 호출
		
		log.info("회원탈퇴완료 =>컨트롤러 이동");
	}

	@Override
	public int idChk(String id) throws Exception {
		int result =dao.idchk(id);
		return result;
	}

	@Override
	public int telChk(String tel) throws Exception {
		int result=dao.telChk(tel);
		return result;
	}

	@Override
	public int emailChk(String email) throws Exception {
		int result =dao.emailChk(email);
		return result;
	}



	
	
}
