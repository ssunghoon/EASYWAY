package org.easyway.service.schedule;

import java.util.List;

import org.easyway.domain.schedule.ScheduleVO;
import org.easyway.mapper.ScheduleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleMapper mapper;

	@Override//목록보기
	public List<ScheduleVO> getListDo(Long employeeId) {
		log.info("list......");
		
		return mapper.getList(employeeId);
	}

	@Override//일정생성
	public void register(ScheduleVO schedule) {
		log.info("register........");
		mapper.insert(schedule);
		//mapper.insertSelectKey(schedule);
	}
	@Override//조회
	public ScheduleVO detail(Long scheduleId) {
		log.info("detail");
		return mapper.read(scheduleId);
	}

	@Override//수정
	public boolean modify(ScheduleVO schedule) {
		log.info("modify........");
		mapper.modify(schedule);
		return mapper.modify(schedule)==1;
	}

	@Override//제거
	public boolean remove(Long scheduleId) {
		log.info("remove........");
		mapper.remove(scheduleId);
		return mapper.remove(scheduleId) == 1;
	}
	
	
	
}