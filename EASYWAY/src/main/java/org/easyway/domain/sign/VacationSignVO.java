package org.easyway.domain.sign;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VacationSignVO implements Serializable{
	
	private long signVacationId; // SV_ID
	private long signFormId; // SF_ID
	private String signVacationType; // SV_TYPE
	private String signVacationStart; // SV_START
	private String signVacationEnd; // SV_END
	private long signId; // SIGN_ID
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private String signImportance; // SIGN_IMPORTANCE
	
	// 결재 때문에 추가
	private String signListCheck; // SL_CHECK
	
	private String fileName; // FILE_NAME
}
