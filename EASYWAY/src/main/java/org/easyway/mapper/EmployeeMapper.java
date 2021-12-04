package org.easyway.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.easyway.domain.employee.EmployeeVO;

public interface EmployeeMapper {
	
	//insert
	public int insertEmployee(EmployeeVO employee);	
	
	//select	
	public EmployeeVO getEmployee(Long employeeId);
	public EmployeeVO getEmployee2(@Param("memberId")Long nowMemberId, @Param("officeId")Long officeId);
	public List<EmployeeVO> getListEmployee(Long officeId);
}
