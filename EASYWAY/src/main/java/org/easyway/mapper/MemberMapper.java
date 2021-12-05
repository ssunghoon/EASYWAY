package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.member.MemberVO;
import org.easyway.domain.office.OfficeVO;



public interface MemberMapper {
	
	public Long readEmail(String tempEmail);	
	public int insertMember(MemberVO member);
	public MemberVO get(String enteredEmail);
	public MemberVO getById(Long memberId);
	public MemberVO login(String memberEmail);

}
