package org.easyway.domain.employee;



import java.io.Serializable;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmployeeVO implements Serializable {
	
	private Long employeeId;
	private Long officeId;
	private Long memberId;
	private Long departmentId;
	private Long positionId;
	
	private String employeeName;
	private String employeeCall;
	private String employeePhone;
	private Date employeeHireDate;
	private String employeeWorkType;
	private String employeeMaster;
	private int employeeLeftDay;
	
}
