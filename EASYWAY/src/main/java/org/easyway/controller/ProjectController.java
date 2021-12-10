package org.easyway.controller;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectCriteria;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.ProjectPostPageDTO;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.project.Project;
import org.easyway.service.project.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/project")
@Log4j
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	// 프로젝트 생성
	@PostMapping("/projectcreate")
	public String projectCreate(Project project, RedirectAttributes rttr) {
		service.create(project);
		rttr.addAttribute("projectId", project.getProjectId());
		return "redirect:/project/projectlist";
	}
	
	// 프로젝트 목록
	@GetMapping("/projectlist")
	public void projectList(Model model) {
		model.addAttribute("list", service.getListProject());
	}
	
	// 프로젝트 수정
	
	// 프로젝트 삭제
	
	
	// 게시판 등록
	@PostMapping("/projectboardregister")
	public String projectBoardRegister(ProjectBoard projectBoard, RedirectAttributes rttr) {
		rttr.addAttribute("projectId", projectBoard.getProjectId());
		service.registerProjectBoard(projectBoard);
		return "redirect:/project/projectboardlist";
	}
	
	// 게시판 목록 페이지
	@GetMapping("/projectboardlist")
	public void projectBoardList(@RequestParam("projectId") Long projectId, Model model) {
		model.addAttribute("projectId", projectId);
		model.addAttribute("projectBoard", service.getListProjectBoard(projectId));
	}
	
	// 게시판 수정
	@PostMapping("/projectboardmodify")
	public String projectBoardModify(ProjectBoard projectBoard, RedirectAttributes rttr) {
		rttr.addAttribute("projectId", projectBoard.getProjectId());
		service.modifyProjectBoard(projectBoard);
		return "redirect:/project/projectboardlist";
	}
	
	// 게시판 삭제
	@PostMapping("/projectboardremove")
	public String projectBoardRemove(ProjectBoard projectBoard, RedirectAttributes rttr) {
		rttr.addAttribute("projectId", projectBoard.getProjectId());
		service.removeProjectBoard(projectBoard);
		return "redirect:/project/projectboardlist";
	}
	
	// 게시물 생성 페이지
	@GetMapping("/projectpostregister")
	public void projectPostGetRegister(@RequestParam("projectId") Long projectId, @RequestParam("projectBoardId") Long projectBoardId, Model model) {
		model.addAttribute("projectId", projectId);
		model.addAttribute("projectBoardId",projectBoardId);
	}
	
	// 게시물 생성
	@PostMapping("/projectpostregister")
	public String projectPostPostRegister(ProjectPost projectPost, RedirectAttributes rttr, HttpSession session) throws IOException {
		EmployeeDTO EmployeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		projectPost.setEmployeeId(EmployeeDTO.getEmployeeId());
		rttr.addAttribute("projectId", projectPost.getProjectId());
		rttr.addAttribute("projectBoardId", projectPost.getProjectBoardId());
		rttr.addAttribute("projectPostId", projectPost.getProjectPostId());
		
		// 파일처리 begin
		log.info("파일 이름 : " + projectPost.getProjectPostFilePath());
		String fileName = null;
		MultipartFile uploadFile = projectPost.getProjectPostFilePath();
		
		if (!uploadFile.isEmpty()) {
			
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("/Users/sunghoonlee/upload/" + fileName));
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@"+uploadFile);
		}else {
			projectPost.setProjectPostFileName("null");
		}
		projectPost.setProjectPostFileName(fileName);
		
		service.registerProjectPost(projectPost);
		return "redirect:/project/projectpostlist";
	}
	
	// 게시물 목록 페이지
	@GetMapping("/projectpostlist")
	public void projectPostList(@RequestParam("projectId") Long projectId, @RequestParam("projectBoardId") Long projectBoardId, Model model, HttpSession session, ProjectCriteria cri) {
		EmployeeDTO EmployeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		
//		int total = service.getTotalCount(projectId, projectBoardId);
//		log.info(total);
		
		model.addAttribute("projectId", projectId);
		model.addAttribute("projectBoard", service.getListProjectBoard(projectId));
		model.addAttribute("projectBoardId", projectBoardId);
		model.addAttribute("projectPostDTO", service.getListProjectPostDTO(projectId, projectBoardId));
		model.addAttribute("pbn", service.getProjectBoard(projectId, projectBoardId).getProjectBoardName());
//		model.addAttribute("pageMaker", new ProjectPostPageDTO(cri, total));
	}
	
	// 게시물 상세 페이지
	@GetMapping("/projectpostdetail")
	public void projectPostDetail(@RequestParam("projectId") Long projectId, @RequestParam("projectBoardId") Long projectBoardId, @RequestParam("projectPostId") Long projectPostId, Model model, HttpSession session) {
		EmployeeDTO EmployeeDTO = (EmployeeDTO)session.getAttribute("nowEmployeeInfo");
		model.addAttribute("projectId", projectId);
		model.addAttribute("projectBoardId", projectBoardId);
		model.addAttribute("projectBoard", service.getListProjectBoard(projectId));
		model.addAttribute("pb", service.getProjectBoard(projectId, projectBoardId));
		model.addAttribute("projectPost", service.getProjectPostDTO(projectBoardId, projectPostId));
	}
	
	// 게시물 수정 페이지
	@GetMapping("/projectpostmodify")
	public void projectPostGetModify(@RequestParam("projectId") Long projectId, @RequestParam("projectBoardId") Long projectBoardId, @RequestParam("projectPostId") Long projectPostId, Model model) {
		model.addAttribute("projectId", projectId);
		model.addAttribute("projectBoardId", projectBoardId);
		model.addAttribute("projectBoard", service.getListProjectBoard(projectId));
		model.addAttribute("projectPost", service.getProjectPost(projectBoardId, projectPostId));
	}
	
	// 게시물 수정
	@PostMapping("/projectpostmodify")
	public String projectPostPostModify(ProjectPost projectPost, RedirectAttributes rttr) throws IOException {
		rttr.addAttribute("projectId", projectPost.getProjectId());
		rttr.addAttribute("projectBoardId", projectPost.getProjectBoardId());
		rttr.addAttribute("projectPostId", projectPost.getProjectPostId());
		
		// 파일처리 begin
		log.info("파일 이름 : " + projectPost.getProjectPostFilePath());
		String fileName = null;
		MultipartFile uploadFile = projectPost.getProjectPostFilePath();
		
		if (!uploadFile.isEmpty()) {
			
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("/Users/sunghoonlee/upload/" + fileName));
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@"+uploadFile);
		}else {
			projectPost.setProjectPostFileName("null");
		}
		projectPost.setProjectPostFileName(fileName);
		
		service.modifyProjectPost(projectPost);
		
		
		return "redirect:/project/projectpostlist";
	}
	
	// 게시물 삭제
	@PostMapping("/projectpostremove")
	public String projectPostRemove(ProjectPost projectPost, RedirectAttributes rttr) {
		rttr.addAttribute("projectId", projectPost.getProjectId());
		rttr.addAttribute("projectBoardId", projectPost.getProjectBoardId());
		rttr.addAttribute("projectPostId", projectPost.getProjectPostId());
		service.removeProjectPost(projectPost.getProjectBoardId(), projectPost.getProjectPostId());
		return "redirect:/project/projectpostlist";
	}
	
	
	
	

}
