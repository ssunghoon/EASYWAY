package org.easyway.domain.office;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OfficeVO{
	
	private Long officeId;
	private String officeName;
	private String officeCode;
}
