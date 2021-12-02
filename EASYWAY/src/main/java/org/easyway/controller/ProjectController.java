package org.easyway.controller;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.Project;
import org.easyway.service.project.ProjectService;
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
@RequestMapping("/project")
@Log4j
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	//프로젝트 생성
	@PostMapping("/projectcreate")
	public String projectCreate(Project project, RedirectAttributes rttr) {
		service.create(project);
		rttr.addAttribute("projectId", project.getProjectId());
		return "redirect:/project/projectlist";
	}
	
	//프로젝트 수정
	
	
	//프로젝트 목록
	@GetMapping("/projectlist")
	public void projectList(Model model) {
		model.addAttribute("list", service.getListProject());
	}
	
	//프로젝트 게시판 등록
	@PostMapping("/projectboardregister")
	public String projectBoardRegister(ProjectBoard projectBoard, RedirectAttributes rttr) {
		log.info("프로젝트 시퀀스 아이디"+projectBoard.getProjectId());
		log.info("프로젝트 보드 객체"+projectBoard);
		service.registerProjectBoard(projectBoard);
		rttr.addAttribute("projectId", projectBoard.getProjectId());
		return "redirect:/project/projectboardlist";
	}
	
	//프로젝트 게시판 목록
	@GetMapping("/projectboardlist")
	public void projectBoardList(@RequestParam("projectId") Long projectId, Model model) {
		model.addAttribute("projectId", projectId);
		model.addAttribute("projectBoard", service.getListProjectBoard(projectId));
//		model.addAttribute("projectBoardId", projectBoardId);
//		model.addAttribute("projectPost", service.getListProjectPost(projectBoardId));
	}
	
	//프로젝트 게시물 생성 페이지
	@GetMapping("/projectpostregister")
	public void projectPostGetRegister(@RequestParam("projectId") Long projectId, Model model) {
		model.addAttribute("projectId", projectId);
//		log.info(projectId);
	}
	
	//프로젝트 게시물 생성
	@PostMapping("/projectpostregister")
	public String projectPostPostRegister(ProjectPost projectPost, RedirectAttributes rttr, @RequestParam("projectId") Long projectId) {
		log.info(projectId.getClass().getName());
		log.info(projectId);
		rttr.addAttribute("projectId", projectId);
		service.registerProjectPost(projectPost);
		return "redirect:/project/projectboardlist";
	}
	
//	//프로젝트 게시물 목록
//	@GetMapping("/projectpostlist")
//	public void projectPostList(@RequestParam Long projectId, @RequestParam Long projectBoardId, Model model) {
//		model.addAttribute("projectId", projectId);
//		model.addAttribute("projectBoardId", projectBoardId);
////		model.addAttribute("projectPost", service.getListProjectPost());
//	}

}
