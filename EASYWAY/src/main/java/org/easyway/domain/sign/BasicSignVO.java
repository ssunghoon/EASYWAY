package org.easyway.domain.sign;


import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasicSignVO implements Serializable{
	
	private Long signBasicId; // SB_ID
	private Long signFormId; // SF_ID
	private String signBasicRange; // SB_RANGE
	private Date signBasicStart; // SB_START
	private Date signBasicEnd; // SB_END

	private Long signId; // SIGN_ID
	private Long employeeId;
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private String signImportance; // SIGN_IMPORTANCE
	private String signListCheck; // SL_CHECK
	
	private String fileName; // FILE_NAME
	
	
}
