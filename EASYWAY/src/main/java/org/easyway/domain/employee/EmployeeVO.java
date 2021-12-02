package org.easyway.domain.employee;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeVO {
	
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
	private Date employeeBirth;
	private String employeeMaster;
	private int employeeLeftDay;
	
}
