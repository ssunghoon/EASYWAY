package org.easyway.mapper;

import org.easyway.domain.attendance.AttendanceVO;

public interface AttendanceMapper {

	public AttendanceVO getList(Long employeeId); // 출근, 외근, 퇴근 시간 불러오기
	public void insert(AttendanceVO attendance); // 출근 시간 입력
	public void updateAttendanceOut(AttendanceVO attendance); // 외근 시간 입력
	public void updateAttendanceEnd(AttendanceVO attendance); // 퇴근 시간 입력

}
