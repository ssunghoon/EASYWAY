package org.easyway.service.attendance;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.easyway.domain.attendance.AttendanceVO;
import org.easyway.mapper.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceMapper mapper;

	@Override
	public AttendanceVO getList(Long employeeId) { // 메인에 출근, 퇴근, 외근 시간 출력
		
		log.info("근무 현황 출력 --------------------------------------------");
		System.out.println("mapper: " + mapper.getList(employeeId));
		
		return mapper.getList(employeeId);
	}

	@Override
	public void registerAttendanceStart(Long employeeId) { // 출근 시간 등록
		
		log.info("registerAttendanceStart 출근 시간 등록--------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String startTime = sdf.format(timestamp);
		//지각 계산하기
		String onlyTime = startTime.substring(startTime.length()-8, startTime.length());
		log.info("stratTime : " + onlyTime);

		attendance.setAttendanceStart(startTime);
		attendance.setEmployeeId(employeeId);
		mapper.insert(attendance);
	}

	@Override
	public void registerAttendanceOut(Long employeeId) { // 외근 시간 등록
		
		log.info("registerAttendanceOut 외근 시간 등록 ------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendanceOut(sdf.format(timestamp));
		attendance.setEmployeeId(employeeId);
		mapper.updateAttendanceOut(attendance);
		
	}

	@Override
	public void registerAttendanceEnd(Long employeeId) {  // 퇴근 시간 등록

		log.info("registerAttendanceEnd 퇴근 시간 등록 ------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendanceEnd(sdf.format(timestamp));
		attendance.setEmployeeId(employeeId);
		mapper.updateAttendanceEnd(attendance);
		
	}


}
