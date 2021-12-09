package org.easyway.domain.chat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessageDTO {
	
    private Long departmentId;
    private Long employeeId;
    private String employeeName;
    private String message;
    
}
