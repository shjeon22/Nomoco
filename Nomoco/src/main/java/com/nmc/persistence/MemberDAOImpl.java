package com.nmc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.nmc.domain.MemberVO;

@Repository // 해당 클래스를 DAO로 스프링에서 인식
public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);

	// DB연결정보가 필요하다 =>의존 주입
	@Inject // DB연결,자원해제,SQL실행
	private SqlSession sqlSession;

	// mapper의 위치값 주소 이름
	private static final String NAMESPACE = "com.nmc.mapper.MemberMapper";

	// 1. selectOne(SQL 구문:mapper네임스페이스.sql구문아이디); =>SQL 실행 결과를 하나 가져오는 동작
	// 2. selectOne(SQL구문 ,전달값)

	@Override
	public void insertMember(MemberVO vo) throws Exception {
       log.info("회원가입 실행");	
 
       sqlSession.insert(NAMESPACE+".insertMember", vo);
       System.out.println("DAO: 회원가입 완료!!");
	}

}
