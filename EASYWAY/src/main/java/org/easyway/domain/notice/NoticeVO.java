package org.easyway.domain.notice;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {

	private int obId;
	private int employeeId;
	private int departmentId;
	private String obTitle;
	private String obContent;
	private String obFilePath;
	private Date obDate;
	private int obView;
	private String obFixedCheck;
}
