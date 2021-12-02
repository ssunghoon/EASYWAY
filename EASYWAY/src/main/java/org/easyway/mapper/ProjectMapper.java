package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.Project;

public interface ProjectMapper {
	
	//프로젝트 생성
	int insertProject(Project project);
	
	//프로젝트 수정
	int updateProject(Project project);
	
	//프로젝트 목록
	List<Project> getListProject();
	
	//프로젝트 게시판 등록
	int insertProjectBoard(ProjectBoard projectBoard);
	
	//프로젝트 게시판 목록
	List<ProjectBoard> getListProjectBoard(long projectId);
	
	//프로젝트 게시물 등록
	int insertProjectPost(ProjectPost projectPost);
	
	//프로젝트 게시물 목록
	List<ProjectPost> getListProjectPost(long projectBoardId);
	
}
