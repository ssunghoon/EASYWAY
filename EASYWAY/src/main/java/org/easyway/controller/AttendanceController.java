package org.easyway.controller;

import org.easyway.service.attendance.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/attendance")
@Log4j
public class AttendanceController {

	@Autowired
	private AttendanceService service;
	
	@GetMapping("/main")
	public void main(Model model){
		  
		log.info("controller/main--------------------------------");
		
		model.addAttribute("attendance", service.main());
	}
	
	@GetMapping("/add")
	public String add(){
		
		log.info("attendance : 출근 시간 체크!!!");
		
		service.add();
		
		return "redirect:/attendance/main";
	}
	
	@GetMapping("/updateAttendanceOut")
	public String updateAttendanceOut(){
		
		log.info("attendance : 외근 시간 체크!!!");
		
		service.updateAttendanceOut();
		
		return "redirect:/attendance/main";
	}
	
	@GetMapping("/updateAttendanceEnd")
	public String updateAttendanceEnd(){
		
		log.info("attendance : 퇴근 시간 체크!!!");
		
		service.updateAttendanceEnd();
		
		return "redirect:/attendance/main";
	}
	
//	이거 테스트다 지워라!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@GetMapping("/common_boardlist")
	public void common_boardlist(){
		  
		log.info("controller/common_boardlist--------------------------------");
		
	}
	
	@GetMapping("/common_boardapply")
	public void common_boardapply(){
		  
		log.info("controller/common_boardapply--------------------------------");
		
	}
	
	@GetMapping("/common_boarddetail")
	public void common_boarddetail(){
		  
		log.info("controller/common_boarddetail--------------------------------");
		
	}
	
	
}
