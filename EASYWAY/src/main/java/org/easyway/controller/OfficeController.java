package org.easyway.controller;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.member.MemberDTO;
import org.easyway.domain.member.MemberVO;
import org.easyway.domain.office.AnnualVacation;
import org.easyway.domain.office.DepartmentVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.office.PositionVO;
import org.easyway.security.domain.CustomUser;
import org.easyway.service.employee.EmployeeService;
import org.easyway.service.office.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/office")
public class OfficeController {
	
	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/officelist")
	public void officeList(Authentication auth, Model model){
		log.info(auth.getPrincipal());
		
		CustomUser member = (CustomUser)auth.getPrincipal();
		List<OfficeVO> offices = new ArrayList<>();
		if(member.getMember().getMemberAuth() == "ROLE_ADMIN"){
			offices = officeService.getList(member.getMember().getMemberId());
			offices.forEach((office)->{
				log.info(office);
			});
		}else{
			offices = officeService.getListByEmployee(member.getMember().getMemberId());
			offices.forEach((office)->{
				log.info(office);
			});
		}
		model.addAttribute("ofiiceList", offices);
		log.info("ofiice list...............");
	}
	
	//meanagement pages	
	@GetMapping("/admin/management/employeemanagement")
	public void employeeManagement(HttpSession session, Model model){
		log.info("admin/employeemanagement Page");
		
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(officeVO);
		model.addAttribute("employeeList", employeeService.getListEmployee(officeVO.getOfficeId()));
		model.addAttribute("positionList", officeService.getPosition(officeVO.getOfficeId()));
		model.addAttribute("departmentList", officeService.getDepartment(officeVO.getOfficeId()));
	}
	
	@GetMapping("/admin/management/managementsetting")
	public void managementSetting(){
		log.info("admin/managementsetting Page");
	}
	
	//office setting page
	@GetMapping("/admin/officesetting/departmentsetting")
	public void departmentSetting(HttpSession session, Model model){
		log.info("admin/departmentsetting Page");
		log.info("admin/positionsetting Page");
		log.info("admin/vactionsetting Page");
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(officeVO);
		model.addAttribute("departmentInfos", officeService.getDepartment(officeVO.getOfficeId()));
	}
	
	@GetMapping("/admin/officesetting/departmentmodify")
	public void departmentModify(HttpSession session, Model model){
		log.info("admin/departmentsetting Page");
		log.info("admin/positionsetting Page");
		log.info("admin/vactionsetting Page");
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(officeVO);
		model.addAttribute("departmentInfos", officeService.getDepartment(officeVO.getOfficeId()));
	}
	
	
	@GetMapping("/admin/officesetting/positionlist")
	public void positionList(HttpSession session, Model model){
		log.info("admin/positionsetting Page");
		log.info("admin/vactionsetting Page");
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(officeVO);
		model.addAttribute("positionInfos", officeService.getPosition(officeVO.getOfficeId()));
	}
	
	@GetMapping("/admin/officesetting/positionmodify")
	public void positionSetting(HttpSession session, Model model){
		log.info("admin/positionmodify Page");
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(officeVO);
		model.addAttribute("positionInfos", officeService.getPosition(officeVO.getOfficeId()));
	}
	
	@GetMapping("/admin/officesetting/vacationsetting")
	public void vacationSetting(HttpSession session, Model model){
		log.info("admin/vactionsetting Page");
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(officeVO);
		model.addAttribute("vacationInfos", officeService.getAnnualVacation(officeVO.getOfficeId()));
	}
	
	
	
	@PostMapping("/create")
	public String create(@RequestParam("officeName") String officeName, Authentication auth, RedirectAttributes rttr){
		CustomUser member = (CustomUser)auth.getPrincipal();
		log.info(officeName);
		int result = officeService.create(officeName, member.getMember().getMemberId());
		rttr.addFlashAttribute("insertResult", result);
		return "redirect:/office/officelist";
	}
	
	@PostMapping("/employee/register")
	@ResponseBody
	public ResponseEntity<?> employeeRegister(@RequestBody List<EmployeeDTO> employees, HttpSession session){
		OfficeVO officeVO = (OfficeVO)session.getAttribute("nowOfficeInfo");
		log.info(employees);
		log.info(officeVO.getOfficeId());
		
		officeService.sendEmail(employees, officeVO.getOfficeId());
		employeeService.registerEmployees(employees, officeVO.getOfficeId());
		
		return new ResponseEntity<>("ok", HttpStatus.OK);
	}
	
	@PostMapping("/vacation/modify")
	@ResponseBody
	public ResponseEntity<?> vacationModify(@RequestBody List<AnnualVacation> vacationInfos){
		log.info(vacationInfos);
		
		officeService.modifyVacation(vacationInfos);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	@PostMapping("/enter/{officeId}")
	@ResponseBody
	public ResponseEntity<?> enterOffice(@RequestBody String officeCode, @PathVariable Long officeId){
		if(officeService.checkOfficeCode(officeCode.replace("\"", ""), officeId)){
			return new ResponseEntity<Long>(officeId, HttpStatus.OK);
		}
		return new ResponseEntity<String>("fail", HttpStatus.FORBIDDEN);
	}
	
	@PostMapping("/position/modify")
	@ResponseBody
	public ResponseEntity<?> positionModify(@RequestBody List<PositionVO> positionInfos){
		log.info(positionInfos);
		
		if(officeService.modifyPosition(positionInfos) > 0){
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		};
		return new ResponseEntity<String>("fail", HttpStatus.FORBIDDEN);
	}
	
	@PostMapping("/department/modify")
	@ResponseBody
	public ResponseEntity<?> departmentModify(@RequestBody List<DepartmentVO> departmentInfos){
		log.info(departmentInfos);
		
		if(officeService.modifyDepartment(departmentInfos) > 0){
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		};
		return new ResponseEntity<String>("fail", HttpStatus.FORBIDDEN);
	}
}
