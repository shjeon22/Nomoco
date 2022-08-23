package com.nmc.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nmc.domain.CommentVO;
import com.nmc.persistence.BoardDAO;
import com.nmc.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	private static final Logger log = LoggerFactory.getLogger(CommentServiceImpl.class);

	@Inject
	private CommentDAO cdao;
	@Inject
	private BoardDAO bdao;

	// public CommentServiceImpl(CommentDAO cdao, BoardDAO bdao) {// 생성자 1개밖에없을때
	// 주입가능
	// this.cdao =cdao; //실수로 한개만 주입받고 @inject 안적는경우
	// this.bdao =bdao; //주입해야할 객체 없으면 빨간줄떠서 쉽게 알수있음
	// }

	@Override
	public int getCount(Integer bno) throws Exception {
		return cdao.count(bno);
	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 2가지 작업하게 Transactionl을 걸어줌 그리고 예외가 발생하면 롤백 시켜줌 참고로 CHECKED예외는 롤백안함
	public int write(CommentVO vo) throws Exception {
		bdao.updateCommentCnt(vo.getBno(), 1);
		return cdao.insert(vo);

	}

	@Override
	public List<CommentVO> getList(Integer bno) throws Exception {
		return cdao.selectAll(bno);
	}

	@Override
	public CommentVO read(Integer cno) throws Exception {
		return cdao.select(cno);
	}

	@Override
	public int modify(CommentVO vo) throws Exception {
		return cdao.update(vo);
	}

	@Override

	@Transactional(rollbackFor = Exception.class)
	public int remove(Integer cno, Integer bno, String commenter) throws Exception {
		int rowCnt = bdao.updateCommentCnt(bno, -1);
		log.info("updateCommentCnt - rowCnt = " + rowCnt);

		rowCnt = cdao.delete(cno, commenter);
		log.info("rowCnt = " + rowCnt);
		return rowCnt;
	}

}
