package org.easyway.domain.department;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepartmentVO {
	
	private Long departmentId;
	private Long officeId;
	private String departmentName;

}
