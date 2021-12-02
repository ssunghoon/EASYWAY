package org.easyway.domain.sign;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignListVO implements Serializable{
	private long signListId; // SL_ID
	private long employeeId; //EMPLOYEE_ID
	private long signId; // SIGN_ID
	private String signListOrder; // SL_ORDER
	private String signListCheck; // SL_CHECK
	
	
	// sql문 추가
	private String employeeName; // EMPLOYEE_NAME
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private Date signDate; // SIGN_DATE
	private String signFormId; // SF_ID
	

}
