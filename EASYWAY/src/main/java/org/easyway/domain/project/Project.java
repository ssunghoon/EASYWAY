package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project { // 프로젝트
	
	private long projectId;	// 프로젝트 번호
	private String projectName; // 프로젝트 명
	private String projectStart; // 프로젝트 시작일
	private String projectEnd; // 프로젝트 종료일
	private String projectContent; // 프로젝트 설명

}
