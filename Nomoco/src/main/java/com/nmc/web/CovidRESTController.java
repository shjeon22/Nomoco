package com.nmc.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nmc.service.CovidService;

@RestController
@RequestMapping("/covidREST/*")
public class CovidRESTController {

	private static final Logger log = LoggerFactory.getLogger(CovidRESTController.class);

	@Inject
	private CovidService service;

	/*
	 * PostMapping("/info") public List covidInfoPOST(Model model)throws Exception{
	 * log.info("발생현황 infoPOST() 크롤링 정보 호출");
	 * 
	 * return service.getCovidInfo(); }
	 */
}
