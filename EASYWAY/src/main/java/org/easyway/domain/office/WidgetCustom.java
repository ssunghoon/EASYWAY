package org.easyway.domain.office;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WidgetCustom {

	private Long wsId;
	private Long memberId;
	private Long officeId;
	private int wsCustom; // 커스텀 번호. 1~3번 중 저장 가능
	private String wsImport;
	
}
