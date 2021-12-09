package org.easyway.service.attendance;

import org.easyway.domain.attendance.AttendanceVO;

public interface AttendanceService {

	public AttendanceVO getList(Long employeeId);  // 메인에 출근, 퇴근, 외근 시간 출력
	public void registerAttendanceStart(Long employeeId);  // 출근 시간 등록
	public void registerAttendanceOut(Long employeeId); // 외근 시간 등록
	public void registerAttendanceEnd(Long employeeId); // 퇴근 시간 등록
}
