package com.nmc.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nmc.domain.CommentVO;
import com.nmc.service.CommentService;

//@Controller
//@ResponseBody -JSON으로 온걸 Java객체로 변환해서 넣어줌
@RestController
public class CommentRESTController {

	private static final Logger log = LoggerFactory.getLogger(CommentRESTController.class);

	@Inject
	private CommentService service;

	
	// 댓글 등록
	// /comments?bno=100 POST
	// http://localhost:8088/comments
	@PostMapping("/comments")
	public ResponseEntity<String> writePOST(@RequestBody CommentVO vo, Integer bno, HttpSession session) {

		String commenter =(String)session.getAttribute("id");
		
//		String commenter = "test";
//		vo.setCommenter(commenter);
//		vo.setBno(bno);
		log.info("vo =" + vo);

		try {
			if (service.write(vo) != 1)
				throw new Exception("Write failed!");

			return new ResponseEntity<>("WRT_OK", HttpStatus.OK);// 200
			

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);// 400
		}

	}

	// 게시물 모든 댓글 노출
	// /comments?bno=100 GET
	@GetMapping("/comments")
	public ResponseEntity<List<CommentVO>> listGET(Integer bno) {
		List<CommentVO> list = null;

		try {
			list = service.getList(bno);

			return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);// 200

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentVO>>(HttpStatus.BAD_REQUEST);// 400

		}
	}

	// 댓글 수정
	// /comments/10 PATCH
	@PatchMapping("/comments/{cno}")
	public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentVO vo,HttpSession session) {
		 String commenter = (String)session.getAttribute("id");
//		String commenter = "test";
//		vo.setCommenter(commenter);
//		vo.setCno(cno);
		log.info("vo =" + vo);

		try {
			if (service.modify(vo) != 1)
				throw new Exception("Write failed@");

			return new ResponseEntity<>("MOD_OK", HttpStatus.OK);// 200

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);// 400
		}
	}

	// 댓글 삭제
	// /comments/1?bno=100 <-삭제할 댓글 번호
	public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
	//	String commenter = "test";
		 String commenter = (String)session.getAttribute("id");
		try {
			int rowCnt = service.remove(cno, bno, commenter);

			if (rowCnt != 1)
				throw new Exception("%% Delete Failed %%");

			return new ResponseEntity<>("DEL_OK", HttpStatus.OK);// 200
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);// 400
		}

	}

}
