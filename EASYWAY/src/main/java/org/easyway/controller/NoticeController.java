package org.easyway.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticePageDTO;
import org.easyway.domain.notice.NoticeVO;
import org.easyway.service.notice.NoticeService;
import org.easyway.service.notice.NoticeServicelmpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@AllArgsConstructor
@Log4j
public class NoticeController {

	@Autowired
	private NoticeService service;

	// 게시글 입력폼 페이지를 불러온다
	@GetMapping("/noticeregister")
	public void noticeRegister() {
		System.out.println("입력폼을 불러옵니다");
	}

	// 입력 기능을 실행한다
	@PostMapping("/noticeregister")
	public String noticeRegister(NoticeVO notice, RedirectAttributes rttr) {
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getObId());
		return "redirect:/notice/noticelist";
	}

	// 목록을 가져온다
	//페이징 처리 리스트로 변경
//	@GetMapping("/noticelist")
//	public String noticeList(Model model) {
//		log.info("listttttttttttttttttt");
//		model.addAttribute("noticelist", service.getListAll());
//		return "/notice/noticelist";
//	}
	
	//페이징 처리 리스트
	@GetMapping("/noticelist")
	public void noticelist(NoticeCriteria cri, Model model){
		log.info("noticelist" + cri);
		model.addAttribute("noticelist", service.getListAll(cri));
//		model.addAttribute("pageMaker", new NoticePageDTO(cri, 123));
		int total = service.getTotal(cri);
		
		log.info("total" + total);
		
		model.addAttribute("pageMaker", new NoticePageDTO(cri, total));
	}

	@GetMapping({ "/noticedetail", "/noticemodify" })
	public void noticedetail(@RequestParam("obId") int obId, @ModelAttribute("cri") NoticeCriteria cri, Model model) {
		log.info("/noticedetail or noticemodify");
		model.addAttribute("of_board", service.detail(obId));
		log.info("조회폼 잘 떴나요");
	}


	@PostMapping("/noticemodify")
	public String noticemodify(NoticeVO notice, RedirectAttributes rttr, @RequestParam("obId") int obId) {
		//데이터가 잘 전달됐는지 확인하기위한 로그
		System.out.println("title: " + notice.getObTitle()); 
		System.out.println("Id: " + notice.getObId());
		System.out.println("content:" + notice.getObContent());
		log.info("noticemodify:" + notice);
		
//		if (service.modify(notice)) {
//			rttr.addFlashAttribute("result" + "success");
//		}
		service.modify(notice);
		//리퀘스트 파람으로 번호를 받아와 출력
		return "redirect:/notice/noticedetail?obId="+ notice.getObId();
//		 return "redirect:/notice/noticelist";
	}
	
	@PostMapping("/noticeremove")
	public String remove(@RequestParam("obId") int obId, RedirectAttributes rttr){
//		System.out.println("Id: " + obId);
//		System.out.println("title:" + obTitle);
		if(service.remove(obId)){
			rttr.addAttribute("result", "success");
		}
		return "redirect:/notice/noticelist";
	}
	
	
	//부서 공지사항 컨트롤러
	
	//부서 공지 입력폼
//	@GetMapping("/departmentnoticeregister")
//	public void departmentnoticeRegister() {
//		System.out.println("부서공지입력폼을 불러옵니다");
//	}
//	
//	//부서 공지 리스트
//	@GetMapping("/noticelist")
//	public String noticeList(Model model) {
//		log.info("listttttttttttttttttt");
//		model.addAttribute("noticelist", service.getListAll());
//		return "/notice/noticelist";
//	}
	
}
