package org.easyway.service.sign;

import java.util.List;

import org.easyway.domain.employee.EmployeeDTO;
import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.sign.BasicSignVO;
import org.easyway.domain.sign.Criteria;
import org.easyway.domain.sign.SignListVO;
import org.easyway.domain.sign.SignVO;
import org.easyway.domain.sign.SpendSignVO;
import org.easyway.domain.sign.VacationSignVO;

public interface SignService {
	
//	public void add(SignVO sign);
	
	// 지출결의서 등록
	public void applySpend(SpendSignVO spend, SignVO sign, SignListVO list);

	
	// 기본기안서 등록
	public void applyBasic(BasicSignVO basic, SignVO sign, SignListVO list);
	
	// 휴가신청서 등록
	public void applyVacation(VacationSignVO vacation,SignVO sign, SignListVO list);

//	public List<SignVO> getListDraft();
	
	// 기안함 목록
	public List<SignVO> getListDraft(Criteria cri);
	
	// 기안함 상세
	public BasicSignVO getDraftBasic(Long signId,Long signFormId);
	public SpendSignVO getDraftSpend(Long signId,Long signFormId);
	public VacationSignVO getDraftVacation(Long signId,Long signFormId);
	// 기안함 상세
	public BasicSignVO getPaymentBasic(Long signId,Long signFormId, Long employeeId);
	public SpendSignVO getPaymentSpend(Long signId,Long signFormId, Long employeeId);
	public VacationSignVO getPaymentVacation(Long signId,Long signFormId, Long employeeId);
	// 기안 갯수
	public int getTotalDraft(Criteria cri);
	
	// 직원 목록
	//public List<EmployeeVO> getListEmployee();
	
	// 결재함 목록
	public List<SignListVO> getSignList(Long employeeId);
	
	// 결재함 페이징
	public List<SignVO> getListPayment(Criteria cri);
	
	// 결재함 결재
	public boolean modify(SignListVO list);
	
	// 결재 갯수
	public int getTotalPayment(Criteria cri);
	
	// 결재완료여부 변경
	public boolean modifySignCheck(SignVO sign);
	
	// 직원 검색
	EmployeeVO get(String enteredName);
	
	// (기안함 상세) 결재직원 목록
	public List<SignListVO> getSignListBySignId(Long signId);

}
