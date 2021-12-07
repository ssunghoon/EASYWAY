package org.easyway.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.SliderUI;

import org.apache.commons.io.FilenameUtils;
import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.member.MemberDTO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.sign.BasicSignVO;
import org.easyway.domain.sign.Criteria;
import org.easyway.domain.sign.PageVO;
import org.easyway.domain.sign.SignListVO;
import org.easyway.domain.sign.SignVO;
import org.easyway.domain.sign.SpendSignVO;
import org.easyway.domain.sign.VacationSignVO;
import org.easyway.security.domain.CustomUser;
import org.easyway.service.employee.EmployeeService;
import org.easyway.service.office.OfficeService;
import org.easyway.service.sign.SignService;
import org.easyway.service.sign.SignServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.mail.iap.Response;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sign/*")
@Log4j
public class SignController {
	
	@Autowired
	private SignService service;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/signmain")
	public void main() {
		log.info("signMain...................");
	}
	
	@GetMapping("/apply")
	public void apply() {
		log.info("apply...................");
	}
	
	@GetMapping("/applyspend")
	public void applySpend() {
		
		log.info("applySpend......................");
	}
	
	@GetMapping("/applybasic")
	public void applyBasic(/*EmployeeVO employee,*/ Model model, HttpSession session, RedirectAttributes rttr) {
		// 회원 목록
		/*log.info("회원 목록 : "+service.getListEmployee());
		model.addAttribute("employeeList", service.getListEmployee());*/
	   
		log.info("applyBasic......................");
	}
	
	@GetMapping("/applyvacation")
	public void applyVacation() {
		log.info("applyVacation......................");
	}	

	// 지출 결의서
	@PostMapping("/applyspend")
	public String applySpend(SpendSignVO spend, SignVO sign, RedirectAttributes rttr, HttpSession session) throws IOException {
		log.info(spend);
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		sign.setEmployeeId(employeeVO.getEmployeeId());
		
		
		rttr.addFlashAttribute("spendSign", spend);
		rttr.addFlashAttribute("sign", sign);
		
		// 파일처리 begin
		log.info("파일 이름 : " + sign.getSignFilePath());
		String fileName = null;
		MultipartFile uploadFile = sign.getSignFilePath();
		
		if (!uploadFile.isEmpty()) {
			
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}else {
			sign.setFileName("null");
		}
		sign.setFileName(fileName);
		service.applySpend(spend, sign);
		// 파일처리 end
		return "redirect:/sign/signmain";
	}
	// 기본 기안서
	@PostMapping("/applybasic")
	public String applyBasic(BasicSignVO basic, SignVO sign, RedirectAttributes rttr, HttpServletRequest request, HttpSession session)throws IOException {
		log.info(basic);
		// session
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		sign.setEmployeeId(employeeVO.getEmployeeId());
		
		rttr.addFlashAttribute("basicSign", basic);
		rttr.addFlashAttribute("sign", sign);
		// 결재선
		/*String[] employeeArr = request.getParameterValues("employeeId");
		for (int i = 0; i < employeeArr.length; i++) {
			System.out.println(employeeArr[i]);
			}
*/
		// 파일처리 begin
		log.info("파일 이름 : " + sign.getSignFilePath());
		String fileName = null;
		MultipartFile uploadFile = sign.getSignFilePath();
		
		if (!uploadFile.isEmpty()) {
			
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		sign.setFileName(fileName);
		service.applyBasic(basic, sign);
		// 파일처리 end
		
		return "redirect:/sign/signmain";
	}

	// 휴가 신청서
	@PostMapping("/applyvacation")
	public String applyVacation(VacationSignVO vacation, SignVO sign, RedirectAttributes rttr, HttpSession session) throws IOException {
		log.info(vacation);
		
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		sign.setEmployeeId(employeeVO.getEmployeeId());
		
		rttr.addFlashAttribute("vacationSign", vacation);
		rttr.addFlashAttribute("sign", sign);
		// 파일처리 begin
		log.info("파일 이름 : " + sign.getSignFilePath());
		String fileName = null;
		MultipartFile uploadFile = sign.getSignFilePath();
		
		if (!uploadFile.isEmpty()) {
			
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		sign.setFileName(fileName);
		service.applyVacation(vacation, sign);
		// 파일처리 end
		return "redirect:/sign/signmain";
	}
	// 기안함 목록
	/*@GetMapping("/draftlist")
	public void list(Model model){
		
		log.info("draftList");
		model.addAttribute("draftList", service.getListDraft());
		
	}*/
	
	// 기안함 목록 + 페이징
	@GetMapping("/draftlist")
	public void draftList(Criteria cri, Model model){
		log.info("draftList : " + cri);

		model.addAttribute("draftList", service.getListDraft(cri));
		int total = service.getTotalDraft(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
		
	
	// 기안함상세
	@GetMapping("/getdraft")
	public void getDraft(@RequestParam("signId") Long signId, @RequestParam(value="signFormId", required=false) Long signFormId, 
						 @RequestParam("signFormId") Long signFromId, @ModelAttribute("cri") Criteria cri, Model model){
		
		log.info("getDraft");
		log.info("signFormId = " + signFormId);
		log.info("signId : " + signId);
		if(signFormId == 1){
			model.addAttribute("basicSign", service.getDraftBasic(signId, signFormId));
		}else if(signFormId == 2) {
			model.addAttribute("spendSign", service.getDraftSpend(signId, signFormId));
		}else if(signFormId == 3) {
			model.addAttribute("vacationSign", service.getDraftVacation(signId, signFormId));
		}
	}
	
	// 결재함상세
		@GetMapping("/getpayment")
		public void getPayment(@RequestParam("signId") Long signId, @RequestParam(value="signFormId", required=false) Long signFormId, 
							 @RequestParam("signFormId") Long signFromId, @ModelAttribute("cri") Criteria cri, Model model){
			
			log.info("getpayment");
			log.info("signFormId = " + signFormId);
			log.info("signId : " + signId);
			if(signFormId == 1){
				model.addAttribute("basicSign", service.getPaymentBasic(signId, signFormId));
			}else if(signFormId == 2) {
				model.addAttribute("spendSign", service.getPaymentSpend(signId, signFormId));
			}else if(signFormId == 3) {
				model.addAttribute("vacationSign", service.getPaymentVacation(signId, signFormId));
			}
		}
	
	// 결재함 목록
	@GetMapping("/paymentlist")
	public void getPayment(Criteria cri,Model model){
		
		log.info("paymentlist : " + cri);

		model.addAttribute("paymentList", service.getListPayment(cri));
		int total = service.getTotalPayment(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
	
	// 결재함 결재
	@PostMapping("/payment")
	public String modify(SignListVO list, SignVO sign, RedirectAttributes rttr){
		log.info("modifyPayment: " + list);
		if(service.modify(list) && service.modifySignCheck(sign)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/sign/paymentlist";
	}

	// 직원 검색
	@PostMapping(value="/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<?> searchMember(@RequestBody Map<String, String> data) {
		
		String enteredName = data.get("enteredName");
		System.out.println("이름 : " + enteredName);
		EmployeeVO selectEmployee = service.get(enteredName);
		
		if(selectEmployee == null) {
			return new ResponseEntity<String>("fail", HttpStatus.FORBIDDEN);
		}
		return new ResponseEntity<EmployeeVO>(selectEmployee, HttpStatus.OK);
	}
	
	@ResponseBody
    @PostMapping("/applypaymentline")
    public void applyPaymentLine(@RequestParam(value="chbox[]") List<Long> chbox, SignListVO list, SignVO sign, HttpSession session, RedirectAttributes rttr) {
		EmployeeVO employeeVO = (EmployeeVO)session.getAttribute("nowEmployeeInfo");
		list.setEmployeeId(employeeVO.getEmployeeId());
		
		log.info("배열 : "+ chbox);
		rttr.addFlashAttribute("list", list);
		
		for (int i = 0; i < chbox.size(); i++) {
			System.out.println((i+1L)+"====="+chbox.get(i));
			service.applyLine(chbox.get(i), (i+1L), sign, list);
		}
			
	}
}