package org.easyway.domain.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
	
	private Long memberId;
	private String memberEmail;
	private String memberName;
	private String memberPhone;	
}
