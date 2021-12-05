package org.easyway.service.office;

import java.util.List;

import org.easyway.domain.member.MemberDTO;
import org.easyway.domain.member.MemberVO;
import org.easyway.domain.office.DepartmentVO;
import org.easyway.domain.office.OfficeVO;
import org.easyway.domain.office.PositionVO;

public interface OfficeService {
	public OfficeVO getOffice(Long officeId);
	public int create(String officeName, Long memberId);
	
	public void sendEmail(List<MemberDTO> members, Long officeId);
	public List<OfficeVO> getList(Long memberId);
	public List<PositionVO> getPosition(Long officeId);
	public List<DepartmentVO> getDepartment(Long officeId);
}
