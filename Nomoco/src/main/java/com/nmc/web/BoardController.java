package com.nmc.web;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmc.domain.BoardVO;
import com.nmc.domain.PageHandler;
import com.nmc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// 게시물 목록(페이징)
	// http://localhost:8088/board/list
	@GetMapping("/list")
	public String listGET(Integer page, Integer pageSize, Model model, HttpServletRequest request) throws Exception {
		// if (!loginCheck(request))
		// return "redirect:/member/login?toURL=" + request.getRequestURL(); // 로그인을
		// 안했으면 로그인 화면으로 이동

		if (page == null)// 첫페이지가 null이면 1로 지정
			page = 1;
		if (pageSize == null)// 페이지사이즈 null로 받으면 10으로 기본 지정
			pageSize = 10;

		// List<BoardVO> boardList = service.getBoardlist();
		// model.addAttribute("boardList", boardList); //밑에 list에 담은
		// service.getPage(map)로 불러온 값을 리스트로 대신출력

		try {

			int totalCnt = service.getCount();
			model.addAttribute("totalCnt", totalCnt);// 총게시물 수(사용ok =>view출력 미정)
			PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

			log.info("totalCnt(총 게시물 수:" + totalCnt);
			log.info("page(현재 페이지):" + page);
			log.info("pageSize(한 페이지 게시물 수)" + pageSize);

			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", (page - 1) * pageSize);
			map.put("pageSize", pageSize);

			List<BoardVO> list = service.getPage(map);
			model.addAttribute("list", list);
			model.addAttribute("ph", pageHandler);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/board/list"; // 로그인을 한 상태이면, 게시판 화면으로 이동
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

		// ip생성 IPv6( 0.0.0.0.0.1 ) => IPv4 ( 127.0.0.1 ) 형식으로
		// RUN-configurations-Arguments 에 -Djava.net.preferIPv4Stack=true 추가
//		String ip = request.getHeader("X-Forwarded-For");
//
//		log.info(">>>> X-FORWARDED-FOR : " + ip);
//
//		if (ip == null) {
//			ip = request.getHeader("Proxy-Client-IP");
//			log.info(">>>> Proxy-Client-IP : " + ip);
//		}
//		if (ip == null) {
//			ip = request.getHeader("WL-Proxy-Client-IP");
//			log.info(">>>> WL-Proxy-Client-IP : " + ip);
//		}
//		if (ip == null) {
//			ip = request.getHeader("HTTP_CLIENT_IP");
//			log.info(">>>> HTTP_CLIENT_IP : " + ip);
//		}
//		if (ip == null) {
//			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//			log.info(">>>> HTTP_X_FORWARDED_FOR : " + ip);
//		}
//		if (ip == null) {
//			ip = request.getRemoteAddr();
//		}
//		log.info(">>>> Result : IP Address : " + ip);
		
		// 루프백 주소->ipV4(내부주소)로 변환
		String ipAddress = request.getHeader("x-forwarded-for");
	    if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
	        ipAddress = request.getHeader("Proxy-Client-IP");
	    }
	    if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
	        ipAddress = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
	        ipAddress = request.getRemoteAddr();
	        if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
	            //          IPv4             ||                    IPv6
	            InetAddress inet = null;
	            try {
	                inet = InetAddress.getLocalHost();
	            } catch (UnknownHostException e) {
	                e.printStackTrace();
	            }
	            ipAddress = inet.getHostAddress();
	        }
	    }
	    log.info(">>>> Result : IP Address : " + ipAddress);
		model.addAttribute("ip", ipAddress);

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

		return "redirect:/board/list";

	}

//	  // http://localhost:8088/board/list // 글 리스트 - GET ( 맨처음 단락 페이징 처리할떄 같이 출력으로 =>변경)
//	  
//	  @GetMapping("/list") public void listGET(Model model, HttpSession
//	  session) throws Exception { log.info("listGET 호출");
//	  
//	  List<BoardVO> boardList = service.getBoardlist();
//	  
//	  model.addAttribute("boardList", boardList);
//	  
//	  }

	// 글본문보기 +조회수 증가
	// http://localhost:8088/board/read?bno=1
	@GetMapping("/read")
	public void readGET(Integer bno, Integer page, Integer pageSize, Model model) throws Exception {
		// @RequestParam => request.getParameter("이름");
		// -> 유사한 동작을 수행(문자열,숫자,날짜 자동형 변환)

		log.info("readGET() 호출");
		log.info("bno: " + bno);

		// 댓글할떄 commenter 못불러올경우 세션에서 직접가져오기!!!
//		String id = (String) session.getAttribute("id");
//		MemberVO mvo = service2.getMember(id);
//		model.addAttribute(id, mvo);//세션에서 id값가져옴

		// 글 번호를 가지고 서비스 -글정보 가져오기 동작
		BoardVO vo = service.readBoard(bno);
		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);
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
		model.addAttribute("uvo", service.readBoard(bno));// getboard

	}

	// 글 수정하기(수정할 정보를 전달받아서 DB에 수정)
	@PostMapping("/modify")
	public String modifyPOST(BoardVO vo, Integer page, Integer pageSize, RedirectAttributes rttr, Model model,
			HttpSession session) throws Exception {
		log.info("modifyPOST() 호출");

		String writer = (String) session.getAttribute("id");
		vo.setWriter(writer);

		if (service.modify(vo) != 1) {
			// throw new Exception("board remove failed!");//예외던지기
			rttr.addFlashAttribute("result", "MODX");
		} else {
			rttr.addFlashAttribute("result", "MODOK");
		}

		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);

//		return "redirect:/board/list?page=&pageSize";  모델에 정의해두면 자동으로 리다이렉트 할떄 붙여줌
		return "redirect:/board/list";
	}

	// http://localhost:8088/board/remove
	// 글 삭제
	@PostMapping("/remove")
	public String removePOST(Integer bno, Integer page, Integer pageSize, Model model, HttpSession session,
			RedirectAttributes rttr) throws Exception {
		log.info("bno :" + bno);
		String writer = (String) session.getAttribute("id");

		// bno와 writer를 사용하여 글삭제
		int delck = service.remove(bno, writer);
		if (delck != 1) {
//			throw new Exception("board remove failed!"); //예외던지기
			rttr.addFlashAttribute("result", "DELX");
		} else {
			rttr.addFlashAttribute("result", "DELOK");
		}

		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);

//		return "redirect:/board/list?page=&pageSize";  모델에 정의해두면 자동으로 리다이렉트 할떄 붙여줌
		return "redirect:/board/list";

	}

}
