package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.member.MemberVO;
import org.easyway.domain.sign.BasicSignVO;
import org.easyway.domain.sign.Criteria;
import org.easyway.domain.sign.SignListVO;
import org.easyway.domain.sign.SignVO;
import org.easyway.domain.sign.SpendSignVO;
import org.easyway.domain.sign.VacationSignVO;

public interface SignMapper {
	
	public int insert(SignVO sign);
	
	// 기본 기안서 등록
	public int insertBasic(BasicSignVO basic);
	
	// 지출 결의서 등록
	public int insertSpend(SpendSignVO spend);
	
	// 휴가 신청서 등록
	public int insertVacation(VacationSignVO vacation);	
	
	// 기안함 목록
	public List<SignVO> getListDraft();
	
	// 기안함 페이징 
	public List<SignVO> getListWithPaging(Criteria cri);
	
	// 기안함 상세(기본기안서)
	public BasicSignVO getDraftBasic(Long signId);
	// 기안함 상세(지출결의서)
	public SpendSignVO getDraftSpend(Long signId);
	// 기안함 상세(휴가신청서)
	public VacationSignVO getDraftVacation(Long signId);
	
	// 결재함 상세(기본기안서)
	public BasicSignVO getPaymentBasic(Long signId);
	// 결재함 상세(지출결의서)
	public SpendSignVO getPaymentSpend(Long signId);
	// 결재함 상세(휴가신청서)
	public VacationSignVO getPaymentVacation(Long signId);
		
	
	// 기안 갯수
	public int getTotalCountDraft(Criteria cri);
	
	// 직원 목록
	//public List<EmployeeVO> getListEmployee();
	
	// 결재선 등록(1,2,3,4번째)
	public int insertLineFirst(SignListVO list);
	public int insertLineSecond(SignListVO list);
	public int insertLineThird(SignListVO list);
	public int insertLineFourth(SignListVO list);
	
	// 결재함 목록
	public List<SignListVO> getListPayment();

	// 결재함 페이징 
	public List<SignVO> getListPaymentWithPaging(Criteria cri);
	// 결재 갯수
	public int getTotalCountPayment(Criteria cri);
	// 결재함 결재
	public int payment(SignListVO list);
	
	// 결재완료여부 변경
	public int updateSignCheck(SignVO sign);
	
	// 직원 검색
	public EmployeeVO get(String enteredName);
	
}
