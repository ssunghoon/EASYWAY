package org.easyway.controller;

import java.util.List;

import org.easyway.domain.member.MemberDTO;
import org.easyway.domain.member.MemberVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.security.domain.CustomUser;
import org.easyway.service.office.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	private OfficeService service;
	
	@GetMapping("/officelist")
	public void officeList(Authentication auth, Model model){
		log.info(auth.getPrincipal());
		
		CustomUser member = (CustomUser)auth.getPrincipal();
		List<OfficeVO> offices = service.getList(member.getMember().getMemberId());
		offices.forEach((office)->{
			log.info(office+"zzzzzzzzzzzzzzzzzzzzzzzzz");
		});
		
		model.addAttribute("ofiiceList", offices);
		log.info("ofiice list...............");
	}
	
	@PostMapping("/create")
	public String create(@RequestParam("officeName") String officeName, Authentication auth, RedirectAttributes rttr){
		CustomUser member = (CustomUser)auth.getPrincipal();
		log.info(officeName);
		int result = service.create(officeName, member.getMember().getMemberId());
		rttr.addFlashAttribute("insertResult", result);
		return "redirect:/office/officelist";
	}
	
	@PostMapping("/employee/register/{officeId}")
	@ResponseBody
	public ResponseEntity<?> employeeRegister(@RequestBody List<MemberDTO> members, @PathVariable Long officeId){
		log.info(members);
		log.info(officeId);
		service.sendEmail(members, officeId);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	
}
