package org.easyway.domain.office;

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
