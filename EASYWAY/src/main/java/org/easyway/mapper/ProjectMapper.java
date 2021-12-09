package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.project.ProjectBoard;
import org.easyway.domain.project.ProjectPost;
import org.easyway.domain.project.ProjectPostDTO;
import org.apache.ibatis.annotations.Param;
import org.easyway.domain.project.Project;

public interface ProjectMapper {
	
	public int insertProject(Project project); // 프로젝트 생성
	
	public List<Project> getListProject(); // 프로젝트 목록
	
	public int updateProject(Project project); // 프로젝트 수정
	
	public int insertProjectBoard(ProjectBoard projectBoard); // 게시판 등록
	
	public List<ProjectBoard> getListProjectBoard(Long projectId); // 게시판 목록
	
	public ProjectBoard readProjectBoard(@Param("projectId") Long projectId, @Param("projectBoardId") Long projectBoardId); // 게시판 상세
	
	public int updateProjectBoard(ProjectBoard projectBoard); // 게시판 수정 >> 안되면 @Param 으로 projectBoardId 와 projectId 넘겨줘야함
	
	public int deleteProjectBoard(ProjectBoard projectBoard); // 게시판 삭제 >> 안되면 @Param 으로 projectBoardId 와 projectId 넘겨줘야함
	
	public int insertProjectPost(ProjectPost projectPost); // 게시물 등록
	
	public List<ProjectPost> getListProjectPost(Long projectBoardId); // 게시물 목록
	
	public ProjectPost readProjectPost(@Param("projectBoardId") Long projectBoardId, @Param("projectPostId") Long projectPostId); // 게시물 상세
	
	public int updateProjectPost(ProjectPost projectPost); // 게시물 수정
	
	public int deleteProjectPost(@Param("projectBoardId") Long projectBoardId, @Param("projectPostId") Long projectPostId); // 게시물 삭제
	
	public List<ProjectPostDTO> getListProjectPostDTO(@Param("projectId") Long projectId, @Param("projectBoardId") Long projectBoardId); // 게시물DTO 목록 
	
	public ProjectPostDTO readProjectPostDTO(@Param("projectBoardId") Long projectBoardId, @Param("projectPostId") Long projectPostId); // 게시물DTO 상세
	
}
