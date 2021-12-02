package org.easyway.domain.sign;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// employeeVO가 없어서 임시로 sign 패키지에 만들었음
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeVO implements Serializable{
	private int employeeId;
	private int officeId;
	private int memberId;
	private int departmentId;
	private int positionId;
	private String employeeName;
}
