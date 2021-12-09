package org.easyway.service.project;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.ProjectPostDTO;
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
	public List<Project> getListProject() { // 프로젝트 목록
		return mapper.getListProject();
	}
	
	@Override
	public boolean modifyProject(Project project) { // 프로젝트 수정
		return mapper.updateProject(project) == 1;
	}
	
	@Override
	public void registerProjectBoard(ProjectBoard projectBoard) { // 게시판 등록
		mapper.insertProjectBoard(projectBoard);
	}

	@Override
	public List<ProjectBoard> getListProjectBoard(Long projectId) { // 게시판 목록
		return mapper.getListProjectBoard(projectId);
	}
	
	@Override
	public ProjectBoard getProjectBoard(Long projectId, Long projectBoardId) { // 게시판 상세
		return mapper.readProjectBoard(projectId, projectBoardId);
	}
	
	@Override
	public boolean modifyProjectBoard(ProjectBoard projectBoard) { // 게시판 수정
		return mapper.updateProjectBoard(projectBoard) == 1;
	}

	@Override
	public boolean removeProjectBoard(ProjectBoard projectBoard) { // 게시판 삭제
		return mapper.deleteProjectBoard(projectBoard) == 1;
	}
	
	@Override
	public void registerProjectPost(ProjectPost projectPost) { // 게시물 등록
		mapper.insertProjectPost(projectPost);
	}
	
	@Override
	public List<ProjectPost> getListProjectPost(Long projectBoardId) { // 게시물 목록
		return mapper.getListProjectPost(projectBoardId);
	}

	@Override
	public ProjectPost getProjectPost(Long projectBoardId, Long projectPostId) { // 게시물 상세
		return mapper.readProjectPost(projectBoardId, projectPostId);
	}

	@Override
	public boolean modifyProjectPost(ProjectPost projectPost) { // 게시물 수정
		return mapper.updateProjectPost(projectPost) == 1;
	}
	
	@Override
	public boolean removeProjectPost(Long projectBoardId, Long projectPostId) { // 게시물 삭제
		return mapper.deleteProjectPost(projectBoardId, projectPostId) == 1;
	}

	@Override
	public List<ProjectPostDTO> getListProjectPostDTO(Long projectId, Long projectBoardId) { // 게시물DTO 목록
		return mapper.getListProjectPostDTO(projectId, projectBoardId);
	}

	@Override
	public ProjectPostDTO getProjectPostDTO(Long projectBoardId, Long projectPostId) { // 게시물DTO 상세
		return mapper.readProjectPostDTO(projectBoardId, projectPostId);
	}






}
