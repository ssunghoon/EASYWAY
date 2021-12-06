package org.easyway.service.office;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.easyway.domain.employee.EmployeeDTO;

import org.easyway.domain.office.DepartmentVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.office.PositionVO;

public interface OfficeService {
	public OfficeVO getOffice(Long officeId);
	public int create(String officeName, Long memberId);
	
	public void sendEmail(List<EmployeeDTO> members, Long officeId);
	public List<OfficeVO> getList(Long memberId);
	public List<PositionVO> getPosition(Long officeId);
	public List<DepartmentVO> getDepartment(Long officeId);
	public void registerEmployees(List<EmployeeDTO> employees, Long officeId);
}
