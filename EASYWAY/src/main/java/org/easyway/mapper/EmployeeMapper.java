package org.easyway.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;

public interface EmployeeMapper {
	
	//insert
	public int insertEmployee(EmployeeVO employee);	
	
	//select	
	public EmployeeDTO getEmployeeByEmployeeId(Long employeeId);
	public EmployeeDTO getEmployeeByMemberId(@Param("memberId")Long nowMemberId, @Param("officeId")Long officeId);
	public List<EmployeeDTO> getListEmployee(Long officeId);
	public void insertEmployee(EmployeeDTO employee);
}
