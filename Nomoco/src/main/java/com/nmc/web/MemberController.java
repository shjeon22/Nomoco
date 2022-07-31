package com.nmc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmc.domain.MemberVO;
import com.nmc.service.MemberService;

@Controller
@RequestMapping("/member/*") // 공통주소를 설계 호출시(uri 중간에 위치)
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private MemberService service;

	// 회원가입
	// http://localhost:8088/member/insert
	// @RequestMapping(value = "/insert", method = RequestMethod.GET)
	@GetMapping("/insert")
	public String insertGET() throws Exception {
		return "member/insertForm";

	}

	@PostMapping("/insert")
	public String insertPOST(MemberVO vo) throws Exception {
		log.info("insertPOST() 호출");
		log.info(vo + "");

		service.memberInsert(vo);

		// 페이지 이동( 로그인페이지 )
		return "redirect:/member/login";
	}

}
