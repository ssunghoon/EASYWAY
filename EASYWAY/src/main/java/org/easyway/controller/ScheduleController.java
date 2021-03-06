package org.easyway.controller;

import javax.servlet.http.HttpSession;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.schedule.ScheduleVO;
import org.easyway.service.employee.EmployeeService;
import org.easyway.service.office.OfficeService;
import org.easyway.service.schedule.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/schedule/**")
@Log4j
public class ScheduleController {

	@Autowired
	private ScheduleService service;
	
	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	//메인화면+리스트
	@GetMapping("/schedulemain")
	public void getList(Model model, ScheduleVO schedule,HttpSession session){
		
		//session객체를 통해 employeeid사용
		//사원번호넘겨주기
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		
		Long employeeId = employeeDTO.getEmployeeId();
		service.getListDo(employeeId);
		log.info("getList..........");
		log.info("불러온 employeeId....."+employeeId);
		//사원번호넘겨주기
//		schedule.setEmployeeId(employeeDTO.getEmployeeId());
		
		//사원번호넘겨주기
	//model.addAttribute("nowEmployeeInfo", session.getAttribute("nowEmployeeInfo"));
		model.addAttribute("list", service.getListDo(employeeId));
		
	}
	
	//일정등록
	@PostMapping("/scheduleregister")
	public String register(ScheduleVO schedule, RedirectAttributes rttr, HttpSession session){
		//사원번호넘겨주기
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		
		log.info("register..........");
		log.info("postregister: " + schedule);
		
		service.register(schedule);
		rttr.addFlashAttribute("scheduleInfo", schedule.getScheduleId());//생성한 일정번호 넘겨줌
		//사원번호넘겨주기
		schedule.setEmployeeId(employeeDTO.getEmployeeId());
		
		return "redirect:/schedule/schedulemain";
	}
	
	//일정조회
	@GetMapping(value={"/scheduledetail/{scheduleId}"},produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<ScheduleVO> detail(@PathVariable Long scheduleId){

		log.info("/detail or modify");
		return new ResponseEntity<ScheduleVO>(service.detail(scheduleId), HttpStatus.OK);
	}
	
	//일정수정기간 포맷 시분초지우기
	@PostMapping("/schedulemodify")
	public String modify(ScheduleVO schedule, RedirectAttributes rttr, HttpSession session){
		log.info("modify:"+schedule);
		
		if(service.modify(schedule)){
			rttr.addFlashAttribute("result", "success");	
		}
		return "redirect:/schedule/schedulemain";
	}
	
	//일정삭제
	@PostMapping("/scheduleremove")
	public String remove(@RequestParam("scheduleId") Long scheduleId,RedirectAttributes rttr){
		log.info("remove:"+scheduleId);
		
		if(service.remove(scheduleId)){
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/schedule/schedulemain";
	}
	
}
