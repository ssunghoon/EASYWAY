package org.easyway.domain.office;
import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PositionVO{
	
	private Long positionId;
	private String positionName;
	private Long officeId;
	private int positionLevel;
}
