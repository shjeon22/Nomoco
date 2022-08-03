package com.nmc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.nmc.domain.MemberVO;

@Repository // 해당 클래스를 DAO로 스프링에서 인식
public class AdminDAOImpl implements AdminDAO {

	private static final Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);

	// DB연결정보가 필요하다 =>의존 주입
	@Inject // DB연결,자원해제,SQL실행
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.nmc.mapper.AdminMapper";

	
	@Override
	public List<MemberVO> getMemberList(String adminID) throws Exception {
		log.info("getMemberList(adminID) 호출");
		return sqlSession.selectList(NAMESPACE + ".memberList", adminID);

	}
}
