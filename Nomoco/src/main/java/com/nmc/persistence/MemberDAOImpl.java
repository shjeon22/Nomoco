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

		sqlSession.insert(NAMESPACE + ".insertMember", vo);
		System.out.println("DAO: 회원가입 완료!!");
	}

	@Override
	public MemberVO loginMember(MemberVO vo) throws Exception {
		log.info("loginMember() 동작 호출");
		MemberVO resultVO = sqlSession.selectOne(NAMESPACE + ".login", vo);
		log.info("로그인 체크완료" + resultVO);

		return resultVO;
	}

	@Override
	public MemberVO getMember(String id) throws Exception {
		log.info("getMember(id) 호출");

		MemberVO vo = sqlSession.selectOne(NAMESPACE + ".getMember", id);

		return vo;
	}

	@Override
	public Integer updateMember(MemberVO vo) throws Exception {
		log.info("수정된 정보를 받아서 sql 호출");
		int resultCnt = sqlSession.update(NAMESPACE + ".update", vo);

		return resultCnt;
	}

	@Override
	public void deleteMember(MemberVO dvo) throws Exception {
		log.info("deleteMember(dvo) 호출");
		int check = sqlSession.delete(NAMESPACE + ".delete", dvo);
		log.info("DAO : deleteMember() " + check + "명 탈퇴");
	}

	@Override
	public int idchk(String id) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE + ".idChk", id);
		return result;
	}

	@Override
	public int telChk(String tel) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE + ".telChk", tel);
		return result;
	}

	@Override
	public int emailChk(String email) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE + ".emailChk", email);
		return result;
	}

	@Override
	public int delChk(MemberVO vo) throws Exception {
		int result =sqlSession.selectOne(NAMESPACE+".delChk", vo);
		return result;
	}

}
