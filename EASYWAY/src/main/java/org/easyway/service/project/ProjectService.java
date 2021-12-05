package org.easyway.service.project;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.Project;

public interface ProjectService {
	
	public void create(Project project); // 프로젝트 생성
	
	public boolean modifyProject(Project project); // 프로젝트 수정
	
	public List<Project> getListProject(); // 프로젝트 목록
	
	public void registerProjectBoard(ProjectBoard projectBoard); // 프로젝트 게시판 등록
	
	public List<ProjectBoard> getListProjectBoard(Long projectId); // 프로젝트 게시판 목록
	
	public void registerProjectPost(ProjectPost projectPost); // 프로젝트 게시물 등록
	
	public List<ProjectPost> getListProjectPost(Long projectBoardId); // 프로젝트 게시물 목록
	
	public ProjectPost getProjectPost(Long projectBoardId, Long projectPostId); // 프로젝트 게시물 상세
	
}
