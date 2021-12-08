package org.easyway.service.project;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.Project;

public interface ProjectService {
	
	public void create(Project project); // 프로젝트 생성
	
	public List<Project> getListProject(); // 프로젝트 목록
	
	public boolean modifyProject(Project project); // 프로젝트 수정
	
	public void registerProjectBoard(ProjectBoard projectBoard); // 게시판 등록
	
	public List<ProjectBoard> getListProjectBoard(Long projectId); // 게시판 목록
	
	public ProjectBoard getProjectBoard(Long projectId, Long projectBoardId); // 게시판 상세
	
	public boolean modifyProjectBoard(ProjectBoard projectBoard); // 게시판 수정
	
	public boolean removeProjectBoard(ProjectBoard projectBoard); // 게시판 삭제
	
	public void registerProjectPost(ProjectPost projectPost); // 게시물 등록
	
	public List<ProjectPost> getListProjectPost(Long projectBoardId); // 게시물 목록
	
	public ProjectPost getProjectPost(Long projectBoardId, Long projectPostId); // 게시물 상세
	
	public boolean modifyProjectPost(ProjectPost projectPost); // 게시물 수정
	
	public boolean removeProjectPost(Long projectBoardId, Long projectPostId); // 게시물 삭제
	
}
