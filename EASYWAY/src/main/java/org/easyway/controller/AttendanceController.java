package org.easyway.controller;

import javax.servlet.http.HttpSession;

import org.easyway.domain.attendance.AttendanceVO;
import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.service.attendance.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/attendance")
@Log4j
public class AttendanceController {

	@Autowired
	private AttendanceService service;
	
	@GetMapping("/attendancemain")
	public void getList(HttpSession session, Model model){
		  
		log.info("controller/attendancemain--------------------------------");
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		AttendanceVO attendance = service.getList(employeeDTO.getEmployeeId());
		
		model.addAttribute("attendance", attendance);
	}
	
	@GetMapping("/registerAttendanceStart")
	public String registerAttendanceStart(HttpSession session){
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		Long employeeId = employeeDTO.getEmployeeId();
		
		log.info("attendance : 출근 시간 체크!!!");
		service.registerAttendanceStart(employeeId);
		
		return "redirect:/attendance/attendancemain";
	}
	
	@GetMapping("/registerAttendanceOut")
	public String registerAttendanceOut(HttpSession session){
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		Long employeeId = employeeDTO.getEmployeeId();
		
		log.info("attendance : 외근 시간 체크!!!");
		service.registerAttendanceOut(employeeId);
		
		return "redirect:/attendance/attendancemain";
	}
	
	@GetMapping("/registerAttendanceEnd")
	public String registerAttendanceEnd(HttpSession session){
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		Long employeeId = employeeDTO.getEmployeeId();
		log.info("attendance : 퇴근 시간 체크!!!");
		service.registerAttendanceEnd(employeeId);
		
		return "redirect:/attendance/attendancemain";
	}
	
}
