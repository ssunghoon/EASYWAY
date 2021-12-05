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
	private String obFilePath;
	private String obTitle;
	private String obContent;
	private int obView;
	private Date obDate;
	private String obFixedCheck;
}
