package org.easyway.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;
import org.easyway.service.office.WidgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParser;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
public class MainController {
	
	@Autowired
	private WidgetService service;

	// 위젯 메인 불러오기
	@GetMapping("/office/main")
	public void main(Model model){
		
		log.info("메인에 오신 것을 환영합니다 여러분!!!!!!--------------------------------");
		
		/*WidgetCustom widgetCustom = new WidgetCustom();
		// Long memberId, Long officeId 얘들 어쩌냐 ㅎ 일단 임시
		widgetCustom.setMemberId(818L);
		widgetCustom.setOfficeId(616L);
		
		log.info("List<WidgetVO>-----------" + service.getListWidget(widgetCustom));
		model.addAttribute("WidgetList", service.getListWidget(widgetCustom));*/
	}
	
	// 위젯 불러오기 요청
	@GetMapping("/importOffset")
	public String main(Map<String, Integer> data, Model model){
		
		log.info("메인 getList 페이지");
		
		WidgetCustom widgetCustom = new WidgetCustom();
		// Long memberId, Long officeId 얘들 어쩌냐 ㅎ 일단 임시
		widgetCustom.setMemberId(818L);
		widgetCustom.setOfficeId(616L);
		widgetCustom.setWsCustom(data.get("customNumber"));
		
		log.info("List<WidgetVO>-----------" + service.getListWidget(widgetCustom));
		model.addAttribute("WidgetList", service.getListWidget(widgetCustom));
		
		return "redirect:/office/main";
	}
	
	// 위젯 저장 요청
	@PostMapping("/saveOffset")
	@ResponseBody
	public String saveOffset(@RequestPart("customNumber") Map<String, Integer> data,
										@RequestPart("WidgetVO") List<WidgetVO> widgetList,
										RedirectAttributes rttr){
		
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		log.info("widgetList!!!!!!!!!!!!!!!!!!!!---------------------------" + widgetList);
		log.info("widgetList!!!!!!!!!!!!!!!!!!!!---------------------------" + data);
		
		WidgetCustom widgetCustom = new WidgetCustom();
		// Long memberId, Long officeId 얘들 어쩌냐 ㅎ 일단 임시
		widgetCustom.setWsCustom(data.get("customNumber"));
		widgetCustom.setMemberId(55L);
		widgetCustom.setOfficeId(55L);
		widgetCustom.setWsImport("Y");
		
		// getList 만들기전까지 임시
		return service.save(widgetList, widgetCustom) == 1
				? "일단 성공했지?"
				: "안됐어 돌아가";
	}
	
}
