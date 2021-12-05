package org.easyway.domain.sign;


import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasicSignVO implements Serializable{
	
	private int signBasicId; // SB_ID
	private int signFormId; // SF_ID
	private String signBasicRange; // SB_RANGE
	private String signBasicStart; // SB_START
	private String signBasicEnd; // SB_END

	private long signId; // SIGN_ID
	private String signTitle; // SIGN_TITLE
	private String signContent; // SIGN_CONTENT
	private String signImportance; // SIGN_IMPORTANCE
	private String signListCheck; // SL_CHECK
	
	
}
