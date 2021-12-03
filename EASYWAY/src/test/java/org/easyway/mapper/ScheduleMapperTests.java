package org.easyway.mapper;

import java.sql.Date;
import java.util.List;

import org.easyway.domain.schedule.ScheduleVO;
import org.easyway.mapper.ScheduleMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration ("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ScheduleMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ScheduleMapper mapper;
	
//	@Test
//	public void testGetList(){//목록불러오기 test
//    
//		mapper.getList().forEach(schedule ->log.info(schedule));
//	}
//	@Test
//	public void testInsert(){//일정 추가 tset
//    
//		ScheduleVO schedule = new ScheduleVO();
//		
//		schedule.setScheduleTitle("test코드 제목sk");
//		schedule.setScheduleContent("test코드 내용sk");
//		schedule.setScheduleStart(new Date(2021, 12, 2));
//		schedule.setScheduleEnd(new Date(2021, 12, 3));
//		schedule.setScheduleImportance("상");
//		schedule.setSchedulePrivate("Y");
//		
//		mapper.insertSelectKey(schedule);
//		
//		log.info(schedule);
//	}
//	@Test
//	public void testRead(){//일정 추가 tset
//    
//		ScheduleVO schedule = new ScheduleVO();
//		
//		schedule.setScheduleTitle("test코드 제목sk");
//		schedule.setScheduleContent("test코드 내용sk");
//		schedule.setScheduleStart(new Date(2021, 12, 2));
//		schedule.setScheduleEnd(new Date(2021, 12, 3));
//		schedule.setScheduleImportance("상");
//		schedule.setSchedulePrivate("Y");
//		
//		mapper.insertSelectKey(schedule);
//		
//		log.info(schedule);
//	}
	@Test
	public void testDelete(){//일정 추가 tset
		
		log.info("DELETE COUNT: " + mapper.remove(102L));
	}
	
	
	
}
