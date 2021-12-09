package org.easyway.domain.sign;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignVO implements Serializable{
	
	private Long signId; // SIGN_ID
	private Long signFormId; // SF_ID
	private Long employeeId; // EMPLOYEE_ID
	private Date signDate; // SIGN_DATE
	private Long rownum;
	private String signTitle; // SIGN_TITLE
	
	private String signContent; // SIGN_CONTENT
	private String signCheck; // SIGN_CHECK
	private String signImportance; // SIGN_IMPORTANCE
	
	private String fileName;
	private MultipartFile signFilePath; // SIGN_FILE 파일이름
	
}
