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
	public AttendanceVO getList() { // 메인에 출근, 퇴근, 외근 시간 출력
		
		log.info("근무 현황 출력 --------------------------------------------");
		System.out.println("mapper: " + mapper.getList());
		
		return mapper.getList();
	}

	@Override
	public void registerAttendanceStart() { // 출근 시간 등록
		
		log.info("registerAttendanceStart 출근 시간 등록--------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendanceStart(sdf.format(timestamp));
		mapper.insert(attendance);
		
	}

	@Override
	public void registerAttendanceOut() { // 외근 시간 등록
		
		log.info("registerAttendanceOut 외근 시간 등록 ------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendanceOut(sdf.format(timestamp));
		mapper.updateAttendanceOut(attendance);
		
	}

	@Override
	public void registerAttendanceEnd() {  // 퇴근 시간 등록

		log.info("registerAttendanceEnd 퇴근 시간 등록 ------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendanceEnd(sdf.format(timestamp));
		mapper.updateAttendanceEnd(attendance);
		
	}


}
