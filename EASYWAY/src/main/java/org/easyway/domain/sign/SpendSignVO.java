package org.easyway.domain.sign;


import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SpendSignVO implements Serializable{
	
	private Long singSpendId; //SS_ID
	private Long signFormId; // SF_ID
	private String signSpendRange; // SS_RANGE

	private Long signId; // SIGN_ID
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private String signImportance; // SIGN_IMPORTANCE
	private String signListCheck; // SL_CHECK
	
	private String fileName; // FILE_NAME
	private String employeeName; // EMPLOYEE_NAME
}
