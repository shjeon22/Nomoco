package com.nmc.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nmc.domain.BoardVO;
import com.nmc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public int write(BoardVO vo) throws Exception {
		return dao.insert(vo);
	}
}
