package org.easyway.service.sign;

import java.util.List;

import org.easyway.domain.sign.BasicSignVO;
import org.easyway.domain.sign.Criteria;
import org.easyway.domain.sign.EmployeeVO;
import org.easyway.domain.sign.SignListVO;
import org.easyway.domain.sign.SignVO;
import org.easyway.domain.sign.SpendSignVO;
import org.easyway.domain.sign.VacationSignVO;

public interface SignService {
	
//	public void add(SignVO sign);
	
	// 지출결의서 등록
	public void applySpend(SpendSignVO spend, SignVO sign);
	
	// 기본기안서 등록
	public void applyBasic(BasicSignVO basic, SignVO sign);
	
	// 휴가신청서 등록
	public void applyVacation(VacationSignVO vacation,SignVO sign);

//	public List<SignVO> getListDraft();
	
	// 기안함 목록
	public List<SignVO> getListDraft(Criteria cri);
	
	// 기안함 상세
	public BasicSignVO getDraftBasic(Long signId,Long signFormId);
	public SpendSignVO getDraftSpend(Long signId,Long signFormId);
	public VacationSignVO getDraftVacation(Long signId,Long signFormId);
	// 기안함 상세
	public BasicSignVO getPaymentBasic(Long signId,Long signFormId);
	public SpendSignVO getPaymentSpend(Long signId,Long signFormId);
	public VacationSignVO getPaymentVacation(Long signId,Long signFormId);
	// 기안 갯수
	public int getTotalDraft(Criteria cri);
	
	// 직원 목록
	public List<EmployeeVO> getListEmployee();
	
	// 결재선 등록(1,2,3,4 번째)
	public void applyLineFirst(SignListVO list, SignVO sign);
//	public void applyLineSecond(SignListVO list, SignVO sign);
//	public void applyLineThird(SignListVO list, SignVO sign);
//	public void applyLineFourth(SignListVO list, SignVO sign);
	
	// 결재함 목록
	public List<SignListVO> getListPayment();
	
	// 결재함 결재
	public boolean modify(SignListVO list);
	
	// 결재 갯수
	public int getTotalPayment(Criteria cri);
}
