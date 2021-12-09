package org.easyway.service.office;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.office.AnnualVacation;
import org.easyway.domain.office.DepartmentVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.office.PositionVO;

public interface OfficeService {
	
	//insert
	public int create(String officeName, Long memberId);
	
	//select
	public OfficeVO getOffice(Long officeId);
	public void sendEmail(List<EmployeeDTO> members, Long officeId);
	public List<OfficeVO> getList(Long memberId);
	public List<PositionVO> getPosition(Long officeId);
	public List<DepartmentVO> getDepartment(Long officeId);
	public List<AnnualVacation> getAnnualVacation(Long officeId);

	public List<OfficeVO> getListByEmployee(Long memberId);
	public boolean checkOfficeCode(String officeCode, Long officeId);
	
	//update
	public int modifyPosition(List<PositionVO> positionInfos);
	public int modifyVacation(List<AnnualVacation> vacationInfos);

	public int modifyDepartment(List<DepartmentVO> departmentInfos);
}
