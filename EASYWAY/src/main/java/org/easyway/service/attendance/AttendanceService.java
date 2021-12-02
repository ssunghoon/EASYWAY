package org.easyway.service.attendance;

import org.easyway.domain.attendance.AttendanceVO;

public interface AttendanceService {

	public void add();
	public void updateAttendanceOut();
	public void updateAttendanceEnd();
	public AttendanceVO main();
}
