package com.nmc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*")
public class SimpleRESTController {
	
	// http://localhost:8088/board/test
    @GetMapping("/test")
    public String ajax() {
        return "/board/test";
    }
    
  
}