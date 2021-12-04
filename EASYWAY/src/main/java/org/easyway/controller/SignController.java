package org.easyway.controller;

import java.util.List;

import org.easyway.domain.sign.BasicSignVO;
import org.easyway.domain.sign.Criteria;
import org.easyway.domain.sign.EmployeeVO;
import org.easyway.domain.sign.PageVO;
import org.easyway.domain.sign.SignListVO;
import org.easyway.domain.sign.SignVO;
import org.easyway.domain.sign.SpendSignVO;
import org.easyway.domain.sign.VacationSignVO;
import org.easyway.service.sign.SignServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2LoginConfigurer.RedirectionEndpointConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sign/*")
@Log4j
public class SignController {
	
	@Autowired
	private SignServiceImpl service;
	
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
	public void applyBasic(EmployeeVO employee, Model model) {
		// 회원 목록
		log.info("회원 목록 : "+service.getListEmployee());
		model.addAttribute("employeeList", service.getListEmployee());
		
		log.info("applyBasic......................");
	}
	
	@GetMapping("/applyvacation")
	public void applyVacation() {
		log.info("applyVacation......................");
	}	

	// 지출 결의서
	@PostMapping("/applyspend")
	public String applySpend(SpendSignVO spend, SignVO sign, RedirectAttributes rttr){
		log.info(spend);
		
		service.applySpend(spend, sign);
		
		rttr.addFlashAttribute("spendSign", spend);
		rttr.addFlashAttribute("sign", sign);
		
		return "redirect:/sign/signmain";
	}
	// 기본 기안서
	@PostMapping("/applybasic")
	public String applyBasic(BasicSignVO basic, SignVO sign, EmployeeVO employee, RedirectAttributes rttr, Model model) {
		log.info(basic);
		log.info("employee : " +employee);
		service.applyBasic(basic, sign);
		
		rttr.addFlashAttribute("basicSign", basic);
		rttr.addFlashAttribute("sign", sign);
		//model.addAttribute("signId", sign.getSignId());
		
		/*// 파일처리 begin
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile : signFilePath) {
			
			log.info("--------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			}catch (Exception e) {
				log.error(e.getMessage());
			}
		}*/
		// 파일처리 end
		
		return "redirect:/sign/signmain";
	}

	// 휴가 신청서
	@PostMapping("/applyvacation")
	public String applyVacation(VacationSignVO vacation, SignVO sign, RedirectAttributes rttr){
		log.info(vacation);
		service.applyVacation(vacation, sign);
		
		rttr.addFlashAttribute("vacationSign", vacation);
		rttr.addFlashAttribute("sign", sign);
		
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
		
		log.info("getDraft,getpayment");
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
			
			log.info("getDraft,getpayment");
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
	
	// 결재선 등록
/*	@PostMapping("/applylinefirst")
	@ResponseBody
	public ResponseEntity<?> applyLineFirst(SignListVO list, SignVO sign, RedirectAttributes rttr){
		log.info(list);
		service.applyLineFirst(list, sign);
		rttr.addFlashAttribute("lineFirst", list);
		return new ResponseEntity<EmployeeVO>(employee, HttpStatus.OK);
		
	}*/
	
	// 결재선 등록 해결 못함
	@PostMapping("/applylinefirst")
	public void applyLineFirst(long employeeId, RedirectAttributes rttr){
		log.info(employeeId);
	}
	
	// 결재함 목록
	@GetMapping("/paymentlist")
	public void getPayment(Criteria cri,Model model){
		
		log.info("paymentlist : " + cri);

		model.addAttribute("paymentList", service.getListPayment());
		int total = service.getTotalDraft(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
	
	// 결재함 결재
	@PostMapping("/payment")
	public String modify(SignListVO list, RedirectAttributes rttr){
		log.info("modifyPayment: " + list);
		if(service.modify(list)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/sign/paymentlist";
	}
	
	
}
