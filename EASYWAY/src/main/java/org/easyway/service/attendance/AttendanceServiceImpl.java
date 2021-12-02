package org.easyway.service.attendance;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.easyway.domain.attendance.AttendanceVO;
import org.easyway.mapper.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceMapper mapper;
	
	@Override
	public AttendanceVO main() {
		
		log.info("main---------------------------------------------");
		
		return mapper.main();
	}

	@Override
	public void add() {
		
		log.info("add------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendance_start(sdf.format(timestamp));
		mapper.add(attendance);
		
	}

	@Override
	public void updateAttendanceOut() {
		
		log.info("attendanceOut------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendance_out(sdf.format(timestamp));
		mapper.updateAttendanceOut(attendance);
		
	}

	@Override
	public void updateAttendanceEnd() {

		log.info("attendanceEnd------------------------------------------------");
		
		AttendanceVO attendance = new AttendanceVO();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		attendance.setAttendance_end(sdf.format(timestamp));
		mapper.updateAttendanceEnd(attendance);
		
	}

}
