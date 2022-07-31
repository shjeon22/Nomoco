package com.nmc.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	private static final Logger log = LoggerFactory.getLogger(TestController.class);

	
	// http://localhost:8088/index
	@GetMapping(value = "/index")
	public String indexGET0() {

		return "/index";
	}

	
	////////////////////////////////////templateView/////////////////////
	// http://localhost:8088/index
	@GetMapping("templateView/index")
	public String indexGET() {
		
		return "templateView/index";
	}
	
	// http://localhost:8088/templateView/about
	@GetMapping("/templateView/about")
	public String aboutGET() {
		
		return "templateView/about";
	}
	// http://localhost:8088/templateView/contact
	@GetMapping("/templateView/contact")
	public String contactGET() {
		
		return "templateView/contact";
	}
	// http://localhost:8088/templateView/shop
	@GetMapping("/templateView/shop")
	public String shopGET() {
		
		return "templateView/shop";
	}
	// http://localhost:8088/templateView/shop-single
	@GetMapping("/templateView/shop-single")
	public String shopsingleGET() {
		
		return "templateView/shop-single";
	}
//	// http://localhost:8088/member/login
//	@GetMapping("/member/login")
//	public String loginGET() {
//		
//		return "member/loginForm";
//	}
//	// http://localhost:8088/member/insert
//	@GetMapping("/member/insert")
//	public String insertGET() {
//		
//		return "member/insertForm";
//	}

}
