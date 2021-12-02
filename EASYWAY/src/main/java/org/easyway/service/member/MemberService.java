package org.easyway.service.member;

import org.easyway.domain.member.MemberDTO;
import org.easyway.domain.member.MemberVO;

public interface MemberService {
	public int register(MemberVO member);
	public MemberDTO get(String enteredEmail);
	public Long checkEmail(String tempEmail);
}
