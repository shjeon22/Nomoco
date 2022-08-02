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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmc.domain.MemberVO;
import com.nmc.service.MemberService;

@Controller
@RequestMapping("/member/*") // 공통주소를 설계 호출시(uri 중간에 위치)
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private MemberService service;

	// http://localhost:8088/index
//	@RequestMapping(value = "/index", method = RequestMethod.GET)
	@GetMapping("/index")
	public String indexGET() {

		return "/index";
	}

	// 회원가입
	// http://localhost:8088/member/insert
	@GetMapping("/insert")
	public String insertGET(HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");

		if (id != null) {
			return "redirect:/index";
		}

		return "/member/insertForm";

	}

	// http://localhost:8088/member/insert
	@PostMapping("/insert")
	public String insertPOST(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr, Model model)
			throws Exception {
		// request.setCharacterEncoding("UTF-8");//(HttpServletRequest request)생성해야만
		// 사용가능 하지만 한글처리 별도로 완료

		service.memberInsert(vo);

		String id = request.getParameter("id");
		model.addAttribute("id", id);// HttpServletRequest 으로 id 받아오고 모델로 아이디값을 뷰페이지로 넘김 ex>${id} 나중에 로그인페이지
										// 처리시이용(미정)

		log.info("회원가입 완료 -> 로그인 페이지 이동");
		rttr.addFlashAttribute("result", "msg");

		// 페이지 이동( 로그인페이지 )
		return "redirect:/member/login";

	}

	// http://localhost:8088/member/login
	@GetMapping("/login")
	public String loginGET() {
		log.info("loginGET() 호출");
		return "/member/login";

	}
	
	// http://localhost:8088/member/login
	@PostMapping("/login")
	public String loginPOST(MemberVO vo, HttpSession session) throws Exception {
		log.info("loginPOST() 호출");
		log.info(vo + "");
		// DB 동작 호출을 위해서 서비스 동작을 호출 - loginCheck()
		MemberVO resultVO = service.loginCheck(vo);

		if (resultVO == null) {
			log.info("로그인 실패! (로그인 페이지로 이동)");
			return "redirect:/member/login";
		}
		session.setAttribute("id", resultVO.getId());
		return "redirect:/index";
	}
	
	// http://localhost:8088/member/logout
	@GetMapping("/logout")
	public String logoutGET(HttpSession session) throws Exception{
		log.info("logoutGET() 호출");
		session.invalidate();
		return "redirect:/index";
	}
	
	
}
