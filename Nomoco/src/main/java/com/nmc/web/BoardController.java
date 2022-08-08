package com.nmc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmc.domain.BoardVO;
import com.nmc.service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;
	

	// http://localhost:8088/board/list
	@GetMapping("/list")
	public String listGET(HttpServletRequest request) {
		if (!loginCheck(request))
			return "redirect:/member/login?toURL=" + request.getRequestURL(); // 로그인을 안했으면 로그인 화면으로 이동

		return "/board/listAll"; // 로그인을 한 상태이면, 게시판 화면으로 이동
	}

	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
		HttpSession session = request.getSession(false);
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session != null && session.getAttribute("id") != null;
	}

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

model.addAttribute("ip",ip);
		
	}

	@PostMapping("/register")
	public String registerPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		log.info("registerPOST() 호출");
		log.info("글쓰기 정보 : " + vo);

		service.boardCreate(vo);
		log.info("글쓰기 완료");

		rttr.addFlashAttribute("result", "REGOK");
	
		
		return "redirect:/board/listAll";

	}

}
