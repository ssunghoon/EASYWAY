package org.easyway.service.attendance;

import org.easyway.domain.attendance.AttendanceVO;

public interface AttendanceService {

	public AttendanceVO getList();  // 메인에 출근, 퇴근, 외근 시간 출력
	public void registerAttendanceStart();  // 출근 시간 등록
	public void registerAttendanceOut(); // 외근 시간 등록
	public void registerAttendanceEnd(); // 퇴근 시간 등록
}
