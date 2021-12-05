package org.easyway.service.employee;


import java.util.List;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;
import org.easyway.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	//서비스 구현하면됨. 구현하고 메인컨트롤러 수정
	@Override
	public EmployeeVO getEmployee(Long employeeId) {
		
		log.info(employeeId + "get!");
		return employeeMapper.getEmployee(employeeId);
	}

	@Override
	public List<EmployeeDTO> getListEmployee(Long officeId) {
		
		return employeeMapper.getListEmployee(officeId);
	}

	@Override
	public int resiter(EmployeeVO employee) {
		
		return employeeMapper.insertEmployee(employee);
	}

	@Override
	public EmployeeVO getEmployee2(Long nowMemberId, Long officeId) {
		return employeeMapper.getEmployee2(nowMemberId, officeId);
	}	
}
