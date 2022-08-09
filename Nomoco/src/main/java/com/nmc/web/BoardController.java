package com.nmc.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmc.domain.BoardVO;
import com.nmc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

//	// http://localhost:8088/board/list
//	@GetMapping("/listAll")
//	public String listGET(HttpServletRequest request) {
//		if (!loginCheck(request))
//			return "redirect:/member/login?toURL=" + request.getRequestURL(); // 로그인을 안했으면 로그인 화면으로 이동
//
//		return "/board/listAll"; // 로그인을 한 상태이면, 게시판 화면으로 이동
//	}
//
//	private boolean loginCheck(HttpServletRequest request) {
//		// 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
//		HttpSession session = request.getSession(false);
//		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
//		return session != null && session.getAttribute("id") != null;
//	}

	// 글쓰기
	// http://localhost:8088/board/register
	@GetMapping("/register")
	public void registerGET(HttpSession session, Model model, HttpServletRequest request) throws Exception {

		log.info("registerGET()호출");

		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);

		// ip생성
		String ip = request.getHeader("X-Forwarded-For");

		log.info(">>>> X-FORWARDED-FOR : " + ip);

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
			log.info(">>>> Proxy-Client-IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			log.info(">>>> WL-Proxy-Client-IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			log.info(">>>> HTTP_CLIENT_IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			log.info(">>>> HTTP_X_FORWARDED_FOR : " + ip);
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		log.info(">>>> Result : IP Address : " + ip);

		model.addAttribute("ip", ip);

	}

	// 글쓰기
	// http://localhost:8088/board/register
	@PostMapping("/register")
	public String registerPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		log.info("registerPOST() 호출");
		log.info("글쓰기 정보 : " + vo);

		service.boardCreate(vo);
		log.info("글쓰기 완료");

		rttr.addFlashAttribute("result", "REGOK");

		return "redirect:/board/listAll";

	}

	// http://localhost:8088/board/listAll
	// 글 리스트 - GET
	@GetMapping("/listAll")
	public void listAllGET(Model model, HttpSession session) throws Exception {
		log.info("listAllGET 호출");

		List<BoardVO> boardList = service.getBoardListALL();

		// session.setAttribute("upFlag", "1");//0-false,1-true

		model.addAttribute("boardList", boardList);

	}

	// 글본문보기 +조회수 증가
	// http://localhost:8088/board/read?bno=1
	// http://localhost:8088/board/read?bno=1
	@GetMapping("/read")
	public void readGET(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception {
		// @RequestParam => request.getParameter("이름");
		// -> 유사한 동작을 수행(문자열,숫자,날짜 자동형 변환)

		log.info("readGET() 호출");
		log.info("bno: " + bno);

		// String upFlag =(String)session.getAttribute("upFlag");

//		if(upFlag.equals("1")) {//글 조회수 1증가
//			service.updateBoardCount(bno);
//			session.setAttribute("upFlag", "0");
//		}
//		//글 번호를 가지고 서비스 -글정보 가져오기 동작
		BoardVO vo = service.readBoard(bno);

		// 가져온데이터를 view에 출력
		model.addAttribute("vo", vo);

	}

	// http://localhost:8088/board/modify?bno=4
	// 글 수정하기 (수정할 정보를 가져와서 view 페이지 출력)
	@GetMapping("/modify")
	public void modifyGET(@RequestParam("bno") int bno, Model model) throws Exception {
		log.info("modifyGET() 호출");
		log.info("수정할 글 번호 : " + bno);

		// bno에 해당하는 글 정보를 가져와서 처리
		model.addAttribute("uvo", service.readBoard(bno));

	}

	// 글 수정하기(수정할 정보를 전달받아서 DB에 수정)
	@PostMapping("/modify")
	public String modifyPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		log.info("modifyPOST() 호출");

		service.updateBoard(vo);

		rttr.addFlashAttribute("result", "MODOK");

		return "redirect:/board/listAll";
	}

	// http://localhost:8088/board/remove
	// 글 삭제
	@PostMapping("/remove")
	public String removePOST(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		log.info("bno :" + bno);

		// bno를 사용하여 글삭제
		service.deleteBoard(bno);

		rttr.addFlashAttribute("result", "DELOK");

		return "redirect:/board/listAll";

	}

	// http://localhost:8088/board/listCri
	// http://localhost:8088/board/listCri?perPageNum=5
	// http://localhost:8088/board/listCri?page=10
	// http://localhost:8088/board/listCri?perPageNum=5&page=5

	// 페이징처리 - 게시판 리스트
	@GetMapping("listCri")
	public void listCriGET(Criteria cri, Model model, HttpSession session) throws Exception {
		log.info("listCriGET() 페이징 처리 리스트");

		// 서비스 - 페이징처리된 리스트 동작 호출
		// 해당정보를 view 페이지로 전달
		model.addAttribute("boardList", service.boardListCri(cri));

	}

}
