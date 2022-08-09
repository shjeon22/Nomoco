package com.nmc.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nmc.domain.BoardVO;
import com.nmc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;


	@Override
	public int getCount() throws Exception {
		return dao.count();
	}
	
	
	
	@Override
	public void boardCreate(BoardVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public List<BoardVO> getBoardListALL() throws Exception {
		List<BoardVO> boardList = dao.listAll();
		return boardList;
	}

	
	@Override
	public List<BoardVO> getPage(Map<String, Integer>map) throws Exception {
		return dao.selectPage(map);
	}

	@Override
	public void updateBoardCount(Integer bno) throws Exception {
		dao.updateBoardCnt(bno);
	}

	@Override
	public BoardVO readBoard(Integer bno) throws Exception {
		BoardVO vo = dao.getBoard(bno);
		return vo;
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(Integer bno) throws Exception {
		dao.removeBoard(bno);
	}


}
