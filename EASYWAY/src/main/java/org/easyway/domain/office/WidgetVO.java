package org.easyway.domain.office;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WidgetVO {

	private Long widgetId;
	private Long wsId;
	private int widgetName; // 위젯명 (1~6)
	// 1.시계 2.공지사항 3.출퇴근 4.전자결재 5.프로젝트 6.캘린더
	private int widgetPositionX; // 위젯 X축 위치
	private int widgetPositionY; // 위젯 Y축 위치
	private int widgetWidth; // 위젯 너비
	private int widgetHeight; // 위젯 높이
	
}
