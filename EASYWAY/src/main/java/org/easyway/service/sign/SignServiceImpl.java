package org.easyway.service.sign;

import java.util.List;

import org.easyway.domain.sign.BasicSignVO;
import org.easyway.domain.sign.Criteria;
import org.easyway.domain.sign.EmployeeVO;
import org.easyway.domain.sign.SignListVO;
import org.easyway.domain.sign.SignVO;
import org.easyway.domain.sign.SpendSignVO;
import org.easyway.domain.sign.VacationSignVO;
import org.easyway.mapper.SignMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SignServiceImpl implements SignService {
	
	@Autowired
	private SignMapper mapper;
	
/*	@Override
	public void add(SignVO sign) {
		log.info("add..............." + sign);
		mapper.insert(sign);
	}*/
	
	@Override
	public void applySpend(SpendSignVO spend, SignVO sign) {
		log.info("applySpend..............." + spend);
		
		mapper.insert(sign);
		// sign 테이블의 signId를 넣어줌
		long signId = sign.getSignId();
		spend.setSignId(signId);
		mapper.insertSpend(spend);
		
	}
	

	@Override
	public void applyBasic(BasicSignVO basic, SignVO sign) {
		log.info("applyBasic..............." + basic);
		mapper.insert(sign);
		// sign 테이블의 signId를 넣어줌
		long signId = sign.getSignId();
		basic.setSignId(signId);
		mapper.insertBasic(basic);
		
	}
	
	@Override
	public void applyVacation(VacationSignVO vacation, SignVO sign) {
		log.info("applyVacation..............." + vacation);
		mapper.insert(sign);
		// sign 테이블의 signId를 넣어줌
		long signId = sign.getSignId();
		vacation.setSignId(signId);
		mapper.insertVacation(vacation);
	}
	
	/*@Override
	public List<SignVO> getListDraft() {
		log.info("getDraftList..............");
		
		return mapper.getListDraft();
	}*/
	
	@Override
	public List<SignVO> getListDraft(Criteria cri){
		log.info("getList with Criteria" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 기안함 상세(기본기안서)
	@Override
	public BasicSignVO getDraftBasic(Long signId, Long signFormId){
									
		log.info("getDraftBasic............... signId = " + signId + "signFormId = " + signFormId );
		return mapper.getDraftBasic(signId);

	}
	// 기안함 상세(지출결의서)
	@Override
	public SpendSignVO getDraftSpend(Long signId, Long signFormId){
									
		log.info("getDraftSpend............... signId = " + signId + "signFormId = " + signFormId );
		return mapper.getDraftSpend(signId);

	}
	// 기안함 상세(휴가신청서)
	@Override
	public VacationSignVO getDraftVacation(Long signId, Long signFormId){
									
		log.info("getDraftBasic............... signId = " + signId + "signFormId = " + signFormId );
		return mapper.getDraftVacation(signId);

	}
	
	// 기안 갯수
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	// 직원 목록
	public List<EmployeeVO> getListEmployee() {
		log.info("getListEmployee..............");
		
		return mapper.getListEmployee();
	}
	
	// 결재선 등록 
	@Override
	public void applyLineFirst(SignListVO list, SignVO sign) {
		log.info("applyLineFirst..............." + list);
		// sign 테이블의 signId를 넣어줌
		System.out.println("안녕 나는 김나현이야");
		long signId = sign.getSignId();
		list.setSignId(signId);
		mapper.insertLineFirst(list);
		
	}
	// 결재함 목록
	@Override
	public List<SignListVO> getListPayment() {
		log.info("getDraftList..............");
		
		return mapper.getListPayment();
	}
}
