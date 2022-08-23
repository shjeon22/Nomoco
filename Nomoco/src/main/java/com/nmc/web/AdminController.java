package com.nmc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmc.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService service;

	// 관리자 페이지( index에서 관리자로그인후 ACCESS가능)
	// http://localhost:8088/admin/memberList
	@GetMapping("/memberList")
	public String adminGET(HttpSession session, Model model) throws Exception {
		// 로그인 세션처리
		String id = (String) session.getAttribute("id");
		if (id == null || !id.equals("admin")) {
			return "redirect:/member/index";
		}
		model.addAttribute("memberList", service.getMemberList(id));

		return "/admin/memberList";
	}

}
