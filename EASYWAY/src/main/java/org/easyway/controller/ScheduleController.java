package org.easyway.controller;

import org.easyway.domain.schedule.ScheduleVO;
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
	//메인화면+리스트
	@GetMapping("/schedulemain")
	public void getList(Model model){
		log.info("getList..........");
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
//		rttr.addFlashAttribute("scheduleInfo", schedule);
		rttr.addFlashAttribute("scheduleInfo", schedule.getScheduleId());//클릭한번호 넘겨줌
		return "redirect:/schedule/schedulemain";
	}
	//일정조회
	@GetMapping(value="/scheduledetail/{scheduleId}",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<ScheduleVO> detail(@PathVariable Long scheduleId){
		log.info("/detail");
		return new ResponseEntity<ScheduleVO>(service.detail(scheduleId), HttpStatus.OK);
	}
	//일정수정
	@PostMapping("/schedulemodify")
	public String modify(ScheduleVO schedule, RedirectAttributes rttr){
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
