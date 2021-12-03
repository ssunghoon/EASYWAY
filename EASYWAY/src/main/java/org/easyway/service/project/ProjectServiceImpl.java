package org.easyway.service.project;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.Project;
import org.easyway.mapper.ProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	ProjectMapper mapper;

	@Override
	public void create(Project project) { // 프로젝트 생성
		mapper.insertProject(project);
	}
	
	@Override
	public boolean modifyProject(Project project) { // 프로젝트 수정
		return mapper.updateProject(project) == 1;
	}

	@Override
	public List<Project> getListProject() { // 프로젝트 목록
		return mapper.getListProject();
	}
	
	@Override
	public void registerProjectBoard(ProjectBoard projectBoard) { // 프로젝트 게시판 등록
		mapper.insertProjectBoard(projectBoard);
	}

	@Override
	public List<ProjectBoard> getListProjectBoard(Long projectId) { // 프로젝트 게시판 목록
		return mapper.getListProjectBoard(projectId);
	}

	@Override
	public void registerProjectPost(ProjectPost projectPost) { // 프로젝트 게시물 등록
		mapper.insertProjectPost(projectPost);
	}
	
	@Override
	public List<ProjectPost> getListProjectPost(Long projectBoardId) { // 프로젝트 게시물 목록
		return mapper.getListProjectPost(projectBoardId);
	}

	
	

}
