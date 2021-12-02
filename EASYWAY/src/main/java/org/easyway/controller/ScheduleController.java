package org.easyway.controller;

import org.easyway.domain.schedule.ScheduleVO;
import org.easyway.service.schedule.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/schedule/**")
@Log4j
public class ScheduleController {

	@Autowired
	private ScheduleService service;
	//메인화면+리스트
	@GetMapping("/schedulemain")
	public void getList(Model model){
		log.info("getMain..........");
		model.addAttribute("list", service.getListDo());
	}
//	@GetMapping({"/schedulemain","/schedulemodify"})
//	public void get(@RequestParam("schedule_id") Long scheduleId,Model model){
//		log.info("getMain or modify");
//		model.addAttribute("list", service.getListDo(scheduleId));
//	}
	//일정등록
		@PostMapping("/scheduleregister")
		public String register(ScheduleVO schedule, RedirectAttributes rttr){
			log.info("register..........");
			log.info("postregister: " + schedule);
			service.register(schedule);
			rttr.addFlashAttribute("scheduleInfo", schedule);
			
			return "redirect:/schedule/schedulemain";
		}
	//조회
//	@GetMapping("/scheduledetail/?{scheduleId}")
//	public void detail(@RequestParam("scheduleId") Long scheduleId,Model model){
//		log.info("/detail");
//		model.addAttribute("schedule",service.detail(scheduleId));
//	}
	//조회
//	@GetMapping("/scheduleget")
//	public void get(@RequestParam("schedule_id") Long scheduleId, Model model){
//		log.info("/scheduleget");
//		model.addAttribute();
//	}
	

	//일정수정
//	@PostMapping("/schedulemodify")
//	public void modify(ScheduleVO schedule, RedirectAttributes rttr){
//		log.info("modify.......");
//		
//		if(service.modify(schedule)){
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//	}
	//수정
//	@GetMapping("/schedulemodify")
//	public void modify(@RequestParam("scheduleId") Long scheduleId,Model model){
//		log.info("/modify");
//		model.addAttribute("schedule",service.getListDo());
//	}
	//일정삭제
	
	
}
