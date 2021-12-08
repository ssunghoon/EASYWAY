package org.easyway.service.employee;

import java.util.List;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;

public interface EmployeeService {
	
	public EmployeeDTO getEmployee(Long employeeId);
	public List<EmployeeDTO> getListEmployee(Long officeId);
	public int resiter(EmployeeVO employee);
	public void registerEmployees(List<EmployeeDTO> employees, Long officeId);
	public EmployeeDTO getEmployeeByMemberId(Long nowMemberId, Long officeId);
}
