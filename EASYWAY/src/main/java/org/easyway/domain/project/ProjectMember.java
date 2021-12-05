package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectMember { // 프로젝트 멤버
	
	private long projectMemberId; //프로젝트 멤버 번호
	private long employeeId; // 사원 번호
	private long projectId; // 프로젝트 번호
	private String projectMemberRole; // 프로젝트 권한

}
