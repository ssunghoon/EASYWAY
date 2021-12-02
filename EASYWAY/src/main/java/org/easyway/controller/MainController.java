package org.easyway.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@GetMapping("/main")
	public void main(){
		
		log.info("이렇게 하는 거 맞아?");
	}
	
}
