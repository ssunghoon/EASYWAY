package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectPostDTO {
	
	private Long projectPostId; // 프로젝트 게시물 번호
	private Long projectBoardId; // 프로젝트 게시판 번호
	private Long projectId; // 프로젝트 번호
	private String employeeName; // 사원이름
	private String projectPostTitle; // 제목
	private String projectPostContent; // 내용
	private String projectPostFilePath; // 첨부파일
	private String projectPostDate; // 작성일
	private Long projectPostViews; // 조회 수

}
