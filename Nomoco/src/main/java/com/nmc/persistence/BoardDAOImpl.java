package com.nmc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.nmc.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);

@Inject
private SqlSession sqlSession;

private static final String NAMESPACE ="com.nmc.mapper.BoardMapper";



@Override
public int insert(BoardVO vo) throws Exception {
	return sqlSession.selectOne(NAMESPACE+".insert", vo);
}



@Override
public BoardVO select(Integer bno) throws Exception {

	return sqlSession.selectOne(NAMESPACE+"select", bno);
}




} 
