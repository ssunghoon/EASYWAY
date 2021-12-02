package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.schedule.ScheduleVO;

public interface ScheduleMapper {
	
		public List<ScheduleVO> getList();//일정목록출력
		
		public int insert(ScheduleVO schedule);//일정생성
		
		//public void insertSelectKey(ScheduleVO schedule);//일정pk를 알기위해
		
		public ScheduleVO read(Long scheduleId);//일정조회

		public void modify(ScheduleVO schedule);//일정수정

		public void remove(Long scheduleId);//일정제거

}
