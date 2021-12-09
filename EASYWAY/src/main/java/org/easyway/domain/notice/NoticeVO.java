package org.easyway.domain.notice;


import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {

	private Long obId;
	private Long employeeId;
	private Long departmentId;
	private MultipartFile obFilePath;
	private String obTitle;
	private String obContent;
	private int obView;
	private Date obDate;
	private String obFixedCheck;
	private String obAccess;
	private String fileName;
	
	//추가한 컬럼
	private String employeeName;
	private Long officeId;
//	private List<DepartmentDTO> departmentDto;
}
