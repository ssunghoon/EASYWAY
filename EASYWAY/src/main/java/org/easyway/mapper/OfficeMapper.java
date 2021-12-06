package org.easyway.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.easyway.domain.office.AnnualVacation;
import org.easyway.domain.office.DepartmentVO;
import org.easyway.domain.office.OfficeCreate;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.office.PositionVO;

public interface OfficeMapper {
	
	//insert
	public Long insertOffice(OfficeVO office);
	public int insertOfficeCreate(OfficeCreate officeCreate);
	public int insertPosition(PositionVO position);
	public int insertAnnualVacation(AnnualVacation annualVacation);
	public int insertDepartment(DepartmentVO department);
	
	
	//select	
	public List<OfficeVO> getList(Long memberId);
	public OfficeVO detail(Long officeId);
	public int delete(Long officeId);
	public OfficeVO getOffice(Long officeId);
	public List<PositionVO> getPositionList(Long officeId);
	public List<DepartmentVO> getDepartmentList(Long officeId);
	public AnnualVacation getAnnualVacation(@Param("annual")int annual, @Param("officeId")Long officeId);
}
