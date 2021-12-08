package org.easyway.controller;

import javax.servlet.http.HttpSession;

import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.security.domain.CustomUser;
import org.easyway.service.employee.EmployeeService;
import org.easyway.service.office.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import java.util.List;
import java.util.Map;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;
import org.easyway.service.office.WidgetService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/office")
public class MainController {
	
	@Autowired
	private WidgetService service;

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
	
	// 위젯 메인 불러오기
	@GetMapping("/main")
	public void main(HttpSession session, Model model) throws Exception {
		
		log.info("메인에 오신 것을 환영합니다!");
		
		// WidgetCustom 구성 
		WidgetCustom widgetCustom = new WidgetCustom();
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeVO.getMemberId());
		
		log.info("List<WidgetVO>-----------" + service.getListWidget(widgetCustom));
		model.addAttribute("widgetList", service.getListWidget(widgetCustom).getWidgetList());
		model.addAttribute("customNow", service.getListWidget(widgetCustom).getWsCustom());
	}
	
	// 위젯 저장 요청
	@PostMapping("/saveOffset")
	@ResponseBody
	public String saveOffset(@RequestPart("customNumber") Map<String, Integer> data,
										@RequestPart("WidgetVO") List<WidgetVO> widgetList,
										HttpSession session){
		
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		log.info("widgetList!!!!!!!!!!!!!!!!!!!!---------------------------" + widgetList);
		log.info("widgetList!!!!!!!!!!!!!!!!!!!!---------------------------" + data);
		
		// WidgetCustom 구성
		WidgetCustom widgetCustom = new WidgetCustom();
		widgetCustom.setWsCustom(data.get("customNumber"));
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeVO.getMemberId());
		widgetCustom.setWsImport("Y");
		
		// getList 만들기전까지 임시
		return service.save(widgetList, widgetCustom) == 1
				? "일단 성공했지?"
				: "안됐어 돌아가";
	}
	
	// 위젯 불러오기(기본값 변경) 요청
	@PostMapping("/modifyDefault")
	@ResponseBody
	public String modifyDefault(@RequestBody Map<String, Integer> data){
		
		log.info("기본값 변경 요청 들어갑니다--------");
		int wsCustom = data.get("customNumber");
		log.info("customNumber : " + wsCustom);
		service.modifyDefault(wsCustom);
		
		return "redirect:/office/main";
	}
	
	@GetMapping("/removewidget")
	public String removeWidget(@RequestParam("widgetName") int widgetName, @RequestParam("customNumber") int customNumber,
											HttpSession session) throws Exception{
		
		log.info("지우자 위젯! --------------");
		WidgetCustom widgetCustom = new WidgetCustom();
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeVO.getMemberId());
		
		service.removeWidget(widgetName, widgetCustom);
		
		return "redirect:/office/main";
	}
	
	//String url = request.getParameter("url");
	//response.sendRedirect("/main");
	
}
