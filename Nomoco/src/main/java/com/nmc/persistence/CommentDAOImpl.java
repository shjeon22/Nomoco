package com.nmc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nmc.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.nmc.mapper.CommentMapper";

	@Override
	public int insert(CommentVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}

	@Override
	public List<CommentVO> selectAll(Integer bno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectAll",bno);
	}

	@Override
	public CommentVO select(Integer cno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".select", cno);
	
	}

	@Override
	public int count(Integer bno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".count",bno);
	}

	@Override
	public int update(CommentVO vo) throws Exception {
		return sqlSession.update(NAMESPACE+".update",vo);
	}

	@Override
	public int delete(Integer cno, String commenter) throws Exception {
		
	
		Map map = new HashMap();
		map.put("cno", cno);
		map.put("commenter", commenter);
		
		return sqlSession.delete(NAMESPACE+".delete",map);
	}

	@Override
	public int deleteAll(Integer bno){
		return sqlSession.delete(NAMESPACE+".deleteAll",bno);
	}
	
	}