package com.nmc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;
	
	@GetMapping("/list")
	public String list(HttpServletRequest request) {
		if(!loginCheck(request))
			return "redirect:/member/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

		return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
	}

	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어서
		HttpSession session = request.getSession();
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session.getAttribute("id")!=null;
	}
	
	
	
	
	
	
	
	
	@GetMapping("/write")
	public String write(Model model) {
		model.addAttribute("mode", "new");
		return "/board";
	}
	
	
}
