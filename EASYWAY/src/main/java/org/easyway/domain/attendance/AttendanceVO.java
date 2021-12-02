package org.easyway.domain.attendance;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceVO implements Serializable {

	private int attendance_id;
	private int employee_id;
	private String attendance_start;
	private String attendance_end;
	private String attendance_out;
	
}
