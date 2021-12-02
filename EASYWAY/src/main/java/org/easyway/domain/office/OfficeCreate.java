package org.easyway.domain.office;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OfficeCreate {
	
	private Long ocId;
	private Long memberId;
	private Long officeId;
	
}
