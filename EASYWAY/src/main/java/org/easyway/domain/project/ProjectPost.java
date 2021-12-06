package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectPost { // 프로젝트 게시물
	
	private long projectPostId; // 프로젝트 게시판 번호
	private long projectBoardId; // 프로젝트 게시물 번호
	private long projectMemberId; // 프로젝트 멤버 번호
	private String projectPostTitle; // 제목
	private String projectPostContent; // 내용
	private String projectPostFilePath; // 첨부파일
	private String projectPostDate; // 작성일
	private long projectPostViews; // 조회 수

}
