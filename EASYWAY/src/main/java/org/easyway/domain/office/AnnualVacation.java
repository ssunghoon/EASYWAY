package org.easyway.domain.office;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnnualVacation {
	
	private Long annualVacationId;
	private Long officeId;
	private int annual;//몇년차인지
	private int vacations;
}
