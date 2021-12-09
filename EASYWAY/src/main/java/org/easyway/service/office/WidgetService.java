package org.easyway.service.office;

import java.util.List;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetGetMainDTO;
import org.easyway.domain.office.WidgetVO;

public interface WidgetService {

	// 위젯 위치 처음 저장하기. insertWidgetCustom + insertWidget. 성공시 1 반환
	public int save(List<WidgetVO> widgetList, WidgetCustom widgetCustom);
	// 기본 위젯 불러오기
	public WidgetGetMainDTO getListWidget(WidgetCustom widgetCustom) throws Exception;
	// 위젯 기본값 변경하기. updateDefaultCancel + updateDefault. 성공시 1 반환
	public int modifyDefault(WidgetCustom widgetCustom);
	//  위젯 리셋(전체 삭제)하기
	public int removeWidget(WidgetCustom widgetCustom);
}
