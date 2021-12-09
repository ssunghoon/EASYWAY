package org.easyway.domain.sign;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VacationSignVO implements Serializable{
	
	private Long signVacationId; // SV_ID
	private Long signFormId; // SF_ID
	private String signVacationType; // SV_TYPE
	private Date signVacationStart; // SV_START
	private Date signVacationEnd; // SV_END
	private Long signId; // SIGN_ID
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private String signImportance; // SIGN_IMPORTANCE
	
	// 결재 때문에 추가
	private String signListCheck; // SL_CHECK
	
	private String fileName; // FILE_NAME
	private String employeeName; // EMPLOYEE_NAME
}
