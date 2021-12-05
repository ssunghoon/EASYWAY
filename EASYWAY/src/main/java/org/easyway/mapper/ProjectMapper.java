package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.apache.ibatis.annotations.Param;
import org.easyway.domain.project.Project;

public interface ProjectMapper {
	
	public int insertProject(Project project); // 프로젝트 생성
	
	public int updateProject(Project project); // 프로젝트 수정
	
	public List<Project> getListProject(); // 프로젝트 목록
	
	public int insertProjectBoard(ProjectBoard projectBoard); // 프로젝트 게시판 등록
	
	public List<ProjectBoard> getListProjectBoard(Long projectId); // 프로젝트 게시판 목록
	
	public int insertProjectPost(ProjectPost projectPost); // 프로젝트 게시물 등록
	
	public List<ProjectPost> getListProjectPost(Long projectBoardId); // 프로젝트 게시물 목록
	
	public ProjectPost readProjectPost(@Param("projectBoardId") Long projectBoardId, @Param("projectPostId") Long projectPostId); // 프로젝트 게시물 상세 
	
}
