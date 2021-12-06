package org.easyway.domain.employee;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDTO {
	
	private Long memberId;
	private String employeeName; 
	private String employeeEmail;
	private String employeePosition;
	private String employeeDepartment;
	private String employeeWorkType;
	private String employeePhone;
	private Date employeeHireDate;
}
