package org.easyway.domain.sign;

import java.io.File;
import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignVO implements Serializable{
	
	private long signId; // SIGN_ID
	private long signFormId; // SF_ID
	private long employeeId; // EMPLOYEE_ID
	private Date signDate; // SIGN_DATE
	private File signFilePath; // SIGN_FILE
	private long rownum;
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private String signCheck; // SIGN_CHECK
	private String signImportance; // SIGN_IMPORTANCE
	
}
