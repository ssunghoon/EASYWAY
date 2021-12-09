package org.easyway.domain.sign;

import java.io.Serializable;
import java.sql.Date;

import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.employee.EmployeeVO.EmployeeVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignListVO implements Serializable{
	private Long signListId; // SL_ID
	private Long employeeId; //EMPLOYEE_ID
	private Long employeeId1; //EMPLOYEE_ID
	private Long employeeId2; //EMPLOYEE_ID
	private Long employeeId3; //EMPLOYEE_ID
	private Long employeeId4; //EMPLOYEE_ID
	private Long signId; // SIGN_ID
	private Long signListOrder; // SL_ORDER
	private String signListCheck; // SL_CHECK
	
	
	// sql문 추가
	private Long rownum;
	private String employeeName; // EMPLOYEE_NAME
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private Date signDate; // SIGN_DATE
	private String signFormId; // SF_ID
	private String signImportance; // SIGN_IMPORTANCE

	

}
