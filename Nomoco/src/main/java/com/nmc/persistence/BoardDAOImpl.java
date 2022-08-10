package com.nmc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	private static final String NAMESPACE = "com.nmc.mapper.BoardMapper";

	
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".count");
	}

	
	
	@Override
	public void create(BoardVO vo) throws Exception {
		log.info(" 정보 전달받아서 mapper 호출 ");
		// 정보 전달받아서 mapper를 거쳐서 DB에 저장
		// sqlSession.insert("com.itwillbs.mapper.BoardMapper.createBoard", vo);
		sqlSession.insert(NAMESPACE + ".createBoard", vo);

		log.info(" mapper에서 처리 후 이동 ");
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		List<BoardVO> boardList = sqlSession.selectList(NAMESPACE + ".listAll");
		return boardList;
	}

	

	@Override
	public List<BoardVO> selectPage(Map<String, Integer> map) throws Exception {
		  return sqlSession.selectList(NAMESPACE+".selectPage", map);
	}

	
	
	@Override
	public void updateBoardCnt(Integer bno) throws Exception {
		sqlSession.update(NAMESPACE + "updateBoard", bno);
	}

	@Override
	public BoardVO getBoard(Integer bno)  throws Exception{
		BoardVO vo = sqlSession.selectOne(NAMESPACE + ".getBoard", bno);

		return vo;
	}

	@Override
	public int update(BoardVO vo) throws Exception {
		return sqlSession.update(NAMESPACE+".update",vo);
	}

	@Override
	public int delete(Integer bno, String writer)  throws Exception {
		  Map map = new HashMap();
	        map.put("bno", bno);
	        map.put("writer", writer);
	        return sqlSession.delete(NAMESPACE+".delete", map);
		
	}


}
