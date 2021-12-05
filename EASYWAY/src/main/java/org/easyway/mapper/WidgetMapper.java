package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;

public interface WidgetMapper {

	public Long insertWidgetCustom(WidgetCustom widgetCustom); // 위젯 커스텀 테이블 모든 컬럼에 데이터 삽입
	public int insertWidget(WidgetVO widget); // 위젯 테이블 모든 컬럼에 데이터 삽입
	public List<WidgetVO> getListWidget(WidgetCustom widgetCustom); // 위젯 커스텀 데이터로 위젯 데이터 불러오기
	
}
