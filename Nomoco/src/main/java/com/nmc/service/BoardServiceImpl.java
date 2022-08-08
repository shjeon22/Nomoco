package com.nmc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nmc.domain.BoardVO;
import com.nmc.persistence.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;


	@Override
	public void boardCreate(BoardVO vo) {
		dao.create(vo);
	}


	
}
