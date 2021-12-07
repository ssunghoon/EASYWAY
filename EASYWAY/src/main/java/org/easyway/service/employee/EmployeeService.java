package org.easyway.service.employee;

import java.util.List;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;

public interface EmployeeService {
	
	public EmployeeVO getEmployee(Long employeeId);
	public List<EmployeeDTO> getListEmployee(Long officeId);
	public int resiter(EmployeeVO employee);
	public void registerEmployees(List<EmployeeDTO> employees, Long officeId);
	public EmployeeVO getEmployee2(Long nowMemberId, Long officeId);
}
