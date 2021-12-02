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
	public void create(Project project) {
		mapper.insertProject(project);
	}
	
	@Override
	public boolean modifyProject(Project project) {
		return mapper.updateProject(project) == 1;
	}

	@Override
	public List<Project> getListProject() {
		return mapper.getListProject();
	}
	
	@Override
	public void registerProjectBoard(ProjectBoard projectBoard) {
		mapper.insertProjectBoard(projectBoard);
	}

	@Override
	public List<ProjectBoard> getListProjectBoard(Long projectId) {
		return mapper.getListProjectBoard(projectId);
	}

	@Override
	public void registerProjectPost(ProjectPost projectPost) {
		mapper.insertProjectPost(projectPost);
	}
	
	@Override
	public List<ProjectPost> getListProjectPost(Long projectBoardId) {
		return mapper.getListProjectPost(projectBoardId);
	}

	
	

}
