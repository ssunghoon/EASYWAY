package org.easyway.domain.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	private Long memberId;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberAuth;
	private String memberPhone;
}
