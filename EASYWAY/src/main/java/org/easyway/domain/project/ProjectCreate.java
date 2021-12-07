package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectCreate { // 프로젝트 생성
	
	private long projectCreateId; //프로젝트 생성 번호
	private long employeeId; // 사원 번호
	private long projectId; // 프로젝트 번호
	private String projectCreateRole; // 프로젝트 권한

}
