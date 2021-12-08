package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;

public interface WidgetMapper {

	// 위젯 커스텀 처음 저장하기 : WidgetCustom 테이블
	public Long insertWidgetCustom(WidgetCustom widgetCustom);
	// 위젯 커스텀 처음 저장하기 : Widget 테이블
	public int insertWidget(WidgetVO widget);
	// 마지막에 저장된 위젯리스트 불러오기
	public List<WidgetVO> getListWidget(WidgetCustom widgetCustom);
	// 마지막에 불러온 커스텀넘버 불러오기
	public String readCustomNow(WidgetCustom widgetCustom) throws Exception;
	// 위젯 기본값 변경하기 : 기존에 있던 기본값 취소
	public int updateDefaultCancel();
	// 위젯 기본값 변경하기 : 새로 기본값 설정
	public int updateDefault(int wsCustom);
	// 위젯 테이블 삭제 : 해당 커스텀번호 한정
	public int deleteWidget(WidgetCustom widgetCustom);
	// 위젯 커스텀 테이블 삭제 : 해당 커스텀번호 한정
	public int deleteWidgetCustom(WidgetCustom widgetCustom);
	
}
