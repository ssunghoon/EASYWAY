package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.office.AnnualVacation;
import org.easyway.domain.office.OfficeCreate;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.office.PositionVO;

public interface OfficeMapper {
	
	//insert
	public Long insertOffice(OfficeVO office);
	public int insertOfficeCreate(OfficeCreate officeCreate);
	public int insertPosition(PositionVO position);
	public int insertAnnualVacation(AnnualVacation annualVacation);
	
	
	//select	
	public List<OfficeVO> getList(Long memberId);
	public OfficeVO detail(Long officeId);
	public int delete(Long officeId);
	public OfficeVO get(Long officeId);
}
