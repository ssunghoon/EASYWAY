package org.easyway.controller;

import java.util.List;
import java.util.Map;

import org.easyway.domain.member.MemberDTO;
import org.easyway.domain.member.MemberVO;
import org.easyway.service.member.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {


	@Autowired
	private MemberServiceImpl service;
	
	@GetMapping("/login")
	public void login(){
		log.info("login................");
	}//로그인 페이지로 이동
	
	
	@GetMapping("/register")
	public void register(){
		log.info("register ................");
	}//회원가입 페이지로 이동
	
	@PostMapping("/register")
	public String register(MemberVO member){
		log.info(member);
		service.register(member);
		return "redirect:/member/login";
	}//회원가입 후 로그인 페이지로 리다이렉트
	
	@PostMapping("/register/checkemail")
	@ResponseBody
	public ResponseEntity<?> checkEmail(@RequestBody Map<String, String> data)
	{
		String tempEmail = data.get("tempEmail");
		log.info("check email................" + tempEmail);
		if(tempEmail == null) {
			return new ResponseEntity<>("fail", HttpStatus.OK);
		}
		
		Long result = service.checkEmail(tempEmail);
		if(result == null) {
			return new ResponseEntity<>("ok", HttpStatus.OK);
		}
		log.info("=============" + result+"=============");
		return new ResponseEntity<>("fail", HttpStatus.OK);
	}// Ajax통신으로 받은 json객체를 이용해 이메일 중복여부를 판단해준다.
	
	@PostMapping(value="/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<?> searchMember(@RequestBody Map<String, String> data) {
		String enteredEmail = data.get("enteredEmail");
		
		MemberDTO selectMember = service.get(enteredEmail);
		
		if(selectMember == null){
			return new ResponseEntity<String>("fail", HttpStatus.FORBIDDEN);
		}
		
		return new ResponseEntity<MemberDTO>(selectMember, HttpStatus.OK);
	}// 사원추가시 이메일로 맴버를 검색해준다.1`
}
