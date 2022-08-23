package com.nmc.web;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nmc.service.CovidService;

@Controller
@RequestMapping("/covid/*")
public class CovidController {

	private static final Logger log = LoggerFactory.getLogger(CovidController.class);

	@Inject
	private CovidService service;

	// http://localhost:8088/covid/info
	@GetMapping("/info")
	public String covidInfoGET(Model model) throws Exception {

		// 상세정보를 크롤링하여 저장함
		JSONArray CovidInfo = service.getCovidInfo();
		JSONArray CovidInfo2 = service.getCovidInfo2();

		model.addAttribute("covidinfo", CovidInfo);
		model.addAttribute("covidinfo2", CovidInfo2);

		return "/covid/info";

	}

	// http://localhost:8088/covid/info2
	@GetMapping("/info2")
	public String covidInfo2GET() throws Exception {
		return "/covid/info2";

	}

}
