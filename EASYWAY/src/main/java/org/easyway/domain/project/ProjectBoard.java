package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectBoard { // 프로젝트 게시판
	
	private long projectBoardId; // 프로젝트 게시판 번호
	private long projectId;	// 프로젝트 번호
	private String projectBoardName; // 프로젝트 게시판 명

}
