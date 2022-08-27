package com.nmc.web;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
@RequestMapping("/board/*")
public class CommentRESTController {

	private static final Logger log = LoggerFactory.getLogger(CommentRESTController.class);

	@Inject
	CommentService service;

	// 댓글 등록
	// /comments?bno=100 POST
	// http://localhost:8088/board/comments?bno=1085
	@PostMapping("/comments")
	public ResponseEntity<String> writePOST(@RequestBody CommentVO vo, Integer bno, HttpSession session,
			HttpServletRequest request, Model model) {

		String commenter = (String) session.getAttribute("id");

		// String commenter = "test";
		vo.setCommenter(commenter);
		vo.setBno(bno);

		log.info("vo =" + vo);
		// 루프백 주소->ipV4(내부주소)로 변환
				String ipAddress = request.getHeader("x-forwarded-for");
				if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
					ipAddress = request.getHeader("Proxy-Client-IP");
				}
				if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
					ipAddress = request.getHeader("WL-Proxy-Client-IP");
				}
				if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
					ipAddress = request.getRemoteAddr();
					if (ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
						// IP
						InetAddress inet = null;
						try {
							inet = InetAddress.getLocalHost();
						} catch (UnknownHostException e) {
							e.printStackTrace();
						}
						ipAddress = inet.getHostAddress();
					}
				}
				// ， IP IP, IP ','
				if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length() = 15
					if (ipAddress.indexOf(",") > 0) {
						ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
					}
				}
				log.info(ipAddress);
				model.addAttribute("re_ip", ipAddress);
		try {
			if (service.write(vo) != 1)
				throw new Exception("Write failed!");

			return new ResponseEntity<>("Write Success!!!", HttpStatus.OK);// 200

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("Write_ERROR!", HttpStatus.BAD_REQUEST);// 400
		}

	}

	// 게시물 모든 댓글 노출
	// http://localhost:8088/board/comments
	// /comments?bno=100 GET
	@GetMapping("/comments")
	public ResponseEntity<List<CommentVO>> listGET(Integer bno,HttpServletRequest request, Model model) {
			
		List<CommentVO> list = null;
		try {
			list = service.getList(bno);
			System.out.println("list@@@" + list);
			return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);// 200

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentVO>>(HttpStatus.BAD_REQUEST);// 400

		}
	}

	// 댓글을 수정하는 메서드
	@PatchMapping("/comments/{cno}") // /board/comments/26 PATCH
	public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentVO vo, HttpSession session) {
		String commenter = (String) session.getAttribute("id");
		// String commenter = "test";
		vo.setCommenter(commenter);
		vo.setCno(cno);
		System.out.println("vo = " + vo);

		try {
			if (service.modify(vo) != 1)
				throw new Exception("Write failed.");

			return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
	}

	// 지정된 댓글을 삭제하는 메서드
	@DeleteMapping("/comments/{cno}") // DELETE /comments/1?bno=345 <-- 삭제할 댓글 번호
	public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
		String commenter = (String) session.getAttribute("id");
		// String commenter = "test";

		try {
			int rowCnt = service.remove(cno, bno, commenter);

			if (rowCnt != 1)
				throw new Exception("Delete Failed");

			return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}

}
