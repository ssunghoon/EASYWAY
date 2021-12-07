package org.easyway.controller;

import org.easyway.domain.attendance.AttendanceVO;
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
	
	@GetMapping("/attendancemain")
	public void getList(Model model){
		  
		log.info("controller/attendancemain--------------------------------");
		
		AttendanceVO attendance = service.getList();
		
		System.out.println(attendance);
		
		model.addAttribute("attendance", attendance);
		
	}
	
	@GetMapping("/registerAttendanceStart")
	public String registerAttendanceStart(){
		
		log.info("attendance : 출근 시간 체크!!!");
		
		service.registerAttendanceStart();
		
		return "redirect:/attendance/attendancemain";
	}
	
	@GetMapping("/registerAttendanceOut")
	public String registerAttendanceOut(){
		
		log.info("attendance : 외근 시간 체크!!!");
		
		service.registerAttendanceOut();
		
		return "redirect:/attendance/attendancemain";
	}
	
	@GetMapping("/registerAttendanceEnd")
	public String registerAttendanceEnd(){
		
		log.info("attendance : 퇴근 시간 체크!!!");
		
		service.registerAttendanceEnd();
		
		return "redirect:/attendance/attendancemain";
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
	
	@GetMapping("/test")
	public void test(){
		
	}
	
}
