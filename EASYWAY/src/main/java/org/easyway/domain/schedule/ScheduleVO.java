package org.easyway.domain.schedule;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO implements Serializable{
	
	private Long scheduleId; //Long과 int둘다 문제없음
	private Long employeeId;
	private String scheduleTitle;
	
//private Date scheduleStart; //기존중간에는 날짜를 String<->Date으로했음
//	private Date scheduleEnd; //sql.date가 정답 time도 디비 새로운 컬럼생성하여 테스트해보기(알람할때)
	
	private String scheduleStart;
	private String scheduleEnd;
	
	private String scheduleContent;//내용
	private String scheduleImportance;//중요도
	private String schedulePrivate;//공사구분
}
