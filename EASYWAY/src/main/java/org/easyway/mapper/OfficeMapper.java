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
	public List<OfficeVO> getList(Long memberId); //어드민 계정의 오피스 리스트
	public OfficeVO detail(Long officeId); //오피스 하나에 대한 정보
	public int delete(Long officeId); // 오피스 삭제
	public OfficeVO getOffice(Long officeId); // 오피스 하나에 대한 정보
	public List<PositionVO> getPositionList(Long officeId); // 오피스별 직위 리스트
	public List<DepartmentVO> getDepartmentList(Long officeId);//오피스별 부서리스트
	public AnnualVacation getAnnualVacation(@Param("annual")int annual, @Param("officeId")Long officeId); // 연차(몇년차)별 연차테이블
	public List<AnnualVacation> getAnnualVacationList(Long officeId); // 오피스별 연차정보 리스트
	public int updateVacation(AnnualVacation vacation); //휴가일수 업데이트
	public List<OfficeVO> getListByEmployee(Long memberId); //일반member계정의 오피스 리스트 (사원 id로 찾음)
	public int updatePosition(PositionVO position);
}
