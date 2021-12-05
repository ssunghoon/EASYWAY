package org.easyway.controller;

import javax.servlet.http.HttpSession;

import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.security.domain.CustomUser;
import org.easyway.service.employee.EmployeeService;
import org.easyway.service.office.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/office")
public class MainController {

	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@GetMapping("/main/{officeId}")
	public String main(@PathVariable Long officeId, Authentication auth , HttpSession session){
		
		//오피스 정보 모델이 전달
		log.info("오피스 정보 불러오기");
		OfficeVO nowOfficeInfo = officeService.getOffice(officeId);
		session.setAttribute("nowOfficeInfo", nowOfficeInfo);
		
		//맴버id와 office id를 이용해 사원 정보 조회
		log.info("사원 정보 불러오기");
		CustomUser member = (CustomUser)auth.getPrincipal();
		Long nowMemberId = member.getMember().getMemberId();
		EmployeeVO nowEmployeeInfo = employeeService.getEmployee2(nowMemberId, officeId);
		session.setAttribute("nowEmployeeInfo", nowEmployeeInfo);
		
		return "redirect:/office/main";
	}
	
	@GetMapping("/main")
	public void main(){
		
	}
}
