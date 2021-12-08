package org.easyway.service.employee;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.office.AnnualVacation;
import org.easyway.mapper.EmployeeMapper;
import org.easyway.mapper.OfficeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Autowired
	private OfficeMapper officeMapper;
	
	//서비스 구현하면됨. 구현하고 메인컨트롤러 수정
	@Override
	public EmployeeDTO getEmployee(Long employeeId) {
		
		log.info(employeeId + "get!");
		return employeeMapper.getEmployeeByEmployeeId(employeeId);
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
	public EmployeeDTO getEmployeeByMemberId(Long nowMemberId, Long officeId) {
		return employeeMapper.getEmployeeByMemberId(nowMemberId, officeId);
	}
	
	@Override
	public void registerEmployees(List<EmployeeDTO> employees, Long officeId) {
		
		AnnualVacation av = officeMapper.getAnnualVacation(1, officeId);
		
		employees.forEach((employee)->{
			java.sql.Date sqlDate = employee.getEmployeeHireDate();
			
			Calendar getToday = Calendar.getInstance();
			getToday.setTime(new Date()); //금일 날짜
			
			Calendar cmpDate = Calendar.getInstance();
			cmpDate.setTime(sqlDate);
			long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
			long difYear = diffSec / (365*24*60*60); //몇년차인지 계산
			if(difYear == 0){
				difYear = 1L;
			}
			int vacations = officeMapper.getAnnualVacation((int)difYear, officeId).getVacations();
			
			log.info(employee.getEmployeeHireDate());
			EmployeeVO employeeVO = EmployeeVO.builder()
							.officeId(officeId)
							.memberId(employee.getMemberId())
							.departmentId(Long.parseLong(employee.getEmployeeDepartment()))
							.positionId(Long.parseLong(employee.getEmployeePosition()))
							.employeeLeftDay(av.getAnnual())
							.employeeCall("010-000-000")
							.employeeMaster("n")
							.employeeName(employee.getEmployeeName())
							.employeePhone(employee.getEmployeePhone())
							.employeeWorkType(employee.getEmployeeWorkType())
							.employeeHireDate(employee.getEmployeeHireDate())
							.employeeLeftDay(vacations)
							.build();
							
			employeeMapper.insertEmployee(employeeVO);
		});
	}
}
