package org.easyway.domain.attendance;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceVO implements Serializable {

	private Long attendanceId;
	private Long employeeId;
	private String attendanceStart; // 출근
	private String attendanceOut; // 외근
	private String attendanceEnd; // 퇴근
	
}
