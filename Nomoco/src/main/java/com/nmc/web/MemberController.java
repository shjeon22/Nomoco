package com.nmc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmc.domain.MemberVO;
import com.nmc.service.CovidService;
import com.nmc.service.MemberService;

@Controller
@RequestMapping("/member/*") // 공통주소를 설계 호출시(uri 중간에 위치)
public class MemberController { // 순서 : 컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;

	// http://localhost:8088/index
	// @RequestMapping(value = "/index", method = RequestMethod.GET)
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
		return "redirect:/member/index";

	}

	// 로그인
	// http://localhost:8088/member/login
	@GetMapping("/login")
	public String loginGET() {
		log.info("loginGET() 호출");
		return "/member/login";

	}

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

	// 로그아웃
	// http://localhost:8088/member/logout
	@GetMapping("/logout")
	public String logoutGET(HttpSession session) throws Exception {
		log.info("logoutGET() 호출");

		session.invalidate();
		return "redirect:/index";
	}

	// 마이페이지
	// http://localhost:8088/member/mypage
	@GetMapping("/mypage")
	public String mypageGET(MemberVO vo, HttpSession session) throws Exception {
		log.info("mypageGET() 호출");

		String id = (String) session.getAttribute("id");
		// 세션에 정보가 없다면 (로그인 되지않은 상태에서 mypage접근 불가)
		if (id == null) {
			return "redirect:/member/login"; // 로그인 페이지로 이동
		}

		return "/member/mypage";
	}

	// 회원정보 조회(개인 각각)
	// http://localhost:8088/member/info
	@GetMapping("/info")
	public void infoGET(HttpSession session, Model model) throws Exception {
		log.info("infoGET() 호출");

		// id값 세션에서 가져옴
		String id = (String) session.getAttribute("id");

		// id에 해당하는 회원정보 모두 조회 ->서비스 동작 호출(위에 세션으로 id 가져와서 서비스 id호출0
		MemberVO vo = service.getMember(id);

		log.info(vo + "");// 가져온 회원정보 확인

		model.addAttribute(vo);// db에서 받은 정보를 뷰페이지로 전달
	}

	// 회원정보 수정
	// http://localhost:8088/member/update
	@GetMapping("/update")
	public String updateGET(HttpSession session, Model model) throws Exception {
		log.info("updateGET() 호출");

		String id = (String) session.getAttribute("id");
		model.addAttribute(service.getMember(id));

		return "member/updateForm";
	}

	@PostMapping("/update")
	public String updatePOST(MemberVO vo, RedirectAttributes rttr) throws Exception {
		log.info("updatePOST 호출");

		// 수정할 정보를 저장
		log.info("수정된 데이터" + vo);

		// 서비스-정보수정동작 호출
		int result = service.updateMember(vo);

		if (result != 1) {
			return "redirect:/member/update";
		}

		log.info("회원수정 완료 -> 마이 페이지 이동");
		rttr.addFlashAttribute("result", "UPOK");
		return "redirect:/member/mypage";

	}

	// 회원탈퇴
	// http://localhost:8088/member/delete
	@GetMapping("/delete")
	public String deleteGET(HttpSession session) throws Exception {
		log.info("deleteGET()호출");

		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/index";
		}
		return "/member/deleteForm";
	}

	@PostMapping("/delete")
	public String deletePOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		log.info("deletePOST() 호출");

		log.info("삭제정보" + vo);
		service.deleteMember(vo);
		session.invalidate();
		rttr.addFlashAttribute("result", "DELOK");
		return "redirect:/member/index";
	}

	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(@RequestParam("id") String id) throws Exception {
		log.info("idChk() 호출");
		log.info("전달받은id" + id);
		int cnt = service.idChk(id);
		log.info("확인결과" + cnt);
		return cnt;
	}

	@ResponseBody
	@PostMapping("/telChk")
	public int telChk(@RequestParam("tel") String tel) throws Exception {
		log.info("telChk() 호출");
		int tcnt = service.telChk(tel);
		return tcnt;
	}

	@ResponseBody
	@PostMapping("/emailChk")
	public int emailChk(@RequestParam("email") String email) throws Exception {
		log.info("emailChk() 호출");
		int ecnt = service.emailChk(email);
		return ecnt;
	}

}
