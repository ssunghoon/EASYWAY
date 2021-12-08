package org.easyway.domain.employee;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDTO {
	
	private Long employeeId;
	private Long officeId;
	private Long memberId;
	private Long departmentId;
	private Long positionId;
	
	private String employeeEmail;
	private String employeePosition;
	private String employeeDepartment;
	private String employeeName;
	private String employeeCall;
	private String employeePhone;
	private Date employeeHireDate;
	private String employeeWorkType;
	private String employeeMaster;
	private int employeeLeftDay;
}
