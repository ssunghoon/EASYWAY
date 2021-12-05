package org.easyway.service.office;

import java.util.List;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;

public interface WidgetService {

	public int save(List<WidgetVO> widgetList, WidgetCustom widgetCustom); // insertWidgetCustom + insertWidget. 성공시 1 반환
	public List<WidgetVO> getListWidget(WidgetCustom widgetCustom); //저장한 커스텀 위젯 불러오기
}
