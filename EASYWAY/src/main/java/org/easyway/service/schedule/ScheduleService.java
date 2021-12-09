package org.easyway.service.schedule;

import java.util.List;

import org.easyway.domain.schedule.ScheduleVO;

public interface ScheduleService {

		public List<ScheduleVO> getListDo(Long employeeId);//생성한 일정목록(후에 완료된 일정목록과 비교하기)
		
		public void register(ScheduleVO schedule);//일정등록성하기
		
		public ScheduleVO detail(Long scheduleId);//조회=상세보기 책에 get과같음
	
		public boolean modify(ScheduleVO schedule);//일정수정

		public boolean remove(Long scheduleId);//일정제거
		

		

}