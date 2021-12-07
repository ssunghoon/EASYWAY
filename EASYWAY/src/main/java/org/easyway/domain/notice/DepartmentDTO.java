package org.easyway.domain.notice;

import java.util.Date;
import java.util.List;

import org.easyway.domain.notice.DepartmentDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepartmentDTO {
	private Long obId;
	private Long employeeId;
	private String employeeName;
	private Long departmentId;
	private String departmentName;	//얘는 게시판 헤드에 띄울거라 히든으로 처리한다
	private String obFilePath;
	private String obTitle;
	private String obContent;
	private int obView;
	private Date obDate;
	private String obFixedCheck;
	private String obAccess;
	
	private List<NoticeVO> noticeVO;
	}
