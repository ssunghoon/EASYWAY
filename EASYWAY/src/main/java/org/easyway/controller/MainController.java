package org.easyway.controller;

import javax.servlet.http.HttpSession;

import org.easyway.domain.attendance.AttendanceVO;
import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.notice.NoticeVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.security.domain.CustomUser;
import org.easyway.service.attendance.AttendanceService;
import org.easyway.service.employee.EmployeeService;
import org.easyway.service.notice.NoticeService;
import org.easyway.service.office.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import java.util.List;
import java.util.Map;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;
import org.easyway.domain.project.Project;
import org.easyway.domain.schedule.ScheduleVO;
import org.easyway.domain.sign.SignListVO;
import org.easyway.service.office.WidgetService;
import org.easyway.service.project.ProjectService;
import org.easyway.service.schedule.ScheduleService;
import org.easyway.service.sign.SignService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SignService signService;
	
	@Autowired
	private ScheduleService scheduletService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	
	@GetMapping("/main/{officeId}")
	public String main(@PathVariable Long officeId, Authentication auth , HttpSession session){
		
		//????????? ?????? ????????? ??????
		log.info("????????? ?????? ????????????");
		OfficeVO nowOfficeInfo = officeService.getOffice(officeId);
		session.setAttribute("nowOfficeInfo", nowOfficeInfo);
		
		//??????id??? office id??? ????????? ?????? ?????? ??????
		log.info("?????? ?????? ????????????");
		CustomUser member = (CustomUser)auth.getPrincipal();
		Long nowMemberId = member.getMember().getMemberId();
		EmployeeDTO nowEmployeeInfo = employeeService.getEmployeeByMemberId(nowMemberId, officeId);
		session.setAttribute("nowEmployeeInfo", nowEmployeeInfo);
		
		return "redirect:/office/main";
	}
	
	// ?????? ?????? ????????????
	@GetMapping("/main")
	public void main(HttpSession session, Model model) throws Exception {
		
		log.info("????????? ?????? ?????? ???????????????!");
		
		// WidgetCustom ?????? 
		WidgetCustom widgetCustom = new WidgetCustom();
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeDTO.getMemberId());
		
		log.info("List<WidgetVO>-----------" + service.getListWidget(widgetCustom));
		model.addAttribute("widgetList", service.getListWidget(widgetCustom).getWidgetList());
		model.addAttribute("customNow", service.getListWidget(widgetCustom).getWsCustom());
	}
	
	// ?????? ?????? ??????
	@PostMapping("/saveOffset")
	@ResponseBody
	public String saveOffset(@RequestPart("customNumber") Map<String, Integer> data,
										@RequestPart("WidgetVO") List<WidgetVO> widgetList,
										HttpSession session){
		
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		log.info("widgetList!!!!!!!!!!!!!!!!!!!!---------------------------" + widgetList);
		log.info("widgetList!!!!!!!!!!!!!!!!!!!!---------------------------" + data);
		
		// WidgetCustom ??????
		WidgetCustom widgetCustom = new WidgetCustom();
		widgetCustom.setWsCustom(data.get("customNumber"));
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeDTO.getMemberId());
		widgetCustom.setWsImport("Y");
		
		// getList ?????????????????? ??????
		return service.save(widgetList, widgetCustom) == 1
				? "?????? ?????????????"
				: "????????? ?????????";
	}
	
	// ?????? ????????????(????????? ??????) ??????
	@PostMapping("/modifyDefault")
	@ResponseBody
	public String modifyDefault(@RequestBody Map<String, Integer> data, HttpSession session){
		
		log.info("????????? ?????? ?????? --------------------");
		WidgetCustom widgetCustom = new WidgetCustom();

		
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeDTO.getMemberId());
		int wsCustom = data.get("customNumber");
		log.info("customNumber : " + wsCustom);
		widgetCustom.setWsCustom(wsCustom);
		service.modifyDefault(widgetCustom);
		
		return "redirect:/office/main";
	}
	
	@GetMapping("/removewidget")
	public String removeWidget(@RequestParam("widgetName") int widgetName, @RequestParam("customNumber") int customNumber,
											HttpSession session) throws Exception{
		
		log.info("????????? ??????! --------------");
		WidgetCustom widgetCustom = new WidgetCustom();
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		widgetCustom.setOfficeId(officeVO.getOfficeId());
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		widgetCustom.setMemberId(employeeDTO.getMemberId());
		
		service.removeWidget(widgetCustom);
		
		return "redirect:/office/main";
	}
	
	// -----------------------------------------------------------------------------------
	// ?????? ?????? ??????-----------------------------------------------------------------------
	// ?????? ?????? - ????????????
	@GetMapping("/widget/projectlist")
	@ResponseBody
	public ResponseEntity<List<Project>> widgetprojectlist(Model model) {
		List<Project> projectList = projectService.getListProject();
		model.addAttribute("projectList", projectList);
		return new ResponseEntity<>(projectList, HttpStatus.OK);
	}
	
	// ?????? ?????? - ????????? ??????
	@GetMapping("/widget/paymentlist")
	@ResponseBody
	public ResponseEntity<List<SignListVO>> widgetpaymentlist(HttpSession session, Model model) {
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		List<SignListVO> paymentlist = signService.getSignList(employeeDTO.getEmployeeId());
		model.addAttribute("paymentList", paymentlist);
		return new ResponseEntity<>(paymentlist, HttpStatus.OK);
	}
	
	// ?????? ?????? - ????????? ?????? ??????
	@GetMapping("/widget/schedulemain")
	@ResponseBody
	public ResponseEntity<List<ScheduleVO>> widgetschedulemain(HttpSession session, Model model) {
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		List<ScheduleVO> scheduletlist = scheduletService.getListDo(employeeDTO.getEmployeeId());
		model.addAttribute("scheduletlist", scheduletlist);
		return new ResponseEntity<>(scheduletlist, HttpStatus.OK);
	}
	
	// ?????? ?????? - ???????????? ??????
	@GetMapping("/widget/noticelist")
	@ResponseBody
	public ResponseEntity<List<NoticeVO>> widgetnoticelist(Model model) {
		List<NoticeVO> noticelist = noticeService.getListAll();
		model.addAttribute("noticelist", noticelist);
		return new ResponseEntity<>(noticelist, HttpStatus.OK);
	}
	
	// ?????? ?????? - ????????? ??????
	@GetMapping("/widget/workcheck")
	@ResponseBody
	public ResponseEntity<AttendanceVO> workcheck(HttpSession session, Model model) {
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		AttendanceVO attendance = attendanceService.getList(employeeDTO.getEmployeeId());
		model.addAttribute("attendance", attendance);
		return new ResponseEntity<>(attendance, HttpStatus.OK);
	}
	
}
