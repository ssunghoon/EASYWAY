package org.easyway.service.office;

import java.util.List;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetGetMainDTO;
import org.easyway.domain.office.WidgetVO;
import org.easyway.mapper.WidgetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class WidgetServiceImpl implements WidgetService {
	
	@Autowired
	private WidgetMapper mapper;

	// 위젯 위치 저장하기
	@Transactional
	@Override
	public int save(List<WidgetVO> widgetList, WidgetCustom widgetCustom) {
		// 처리 순서
		// 1. 기존에 저장된 기본 불러오기 취소 
		mapper.updateDefaultCancel();
		
		// 2. 새로 저장될 멤버와 오피스와 위젯 매핑
		mapper.insertWidgetCustom(widgetCustom);
		Long wsId = widgetCustom.getWsId();
		log.info("wsId------------------------------" + wsId);
		
		// 3. 위젯 정보 저장
		widgetList.forEach(widget -> {
			log.info("widget---------------------------" + widget);
			widget.setWsId(wsId);
			mapper.insertWidget(widget);
			
		});
		return 1;
	}

	// 위젯 불러오기
	@Override
	public WidgetGetMainDTO getListWidget(WidgetCustom widgetCustom) {
		
		WidgetGetMainDTO widgetGetMain = new WidgetGetMainDTO();
		log.info("widgetCustom------------------------" + widgetCustom);
		log.info("widgetGetMain---------------------" + widgetGetMain);
		
		// wsCustom : 불러온 커스텀넘버, widgetList : 저장된 위젯리스트
		int wsCustom = mapper.readCustomNow();
		List<WidgetVO> widgetList =  mapper.getListWidget(widgetCustom);
		widgetGetMain.setWsCustom(wsCustom);
		widgetGetMain.setWidgetList(widgetList);
		
		return widgetGetMain;
	}

	// 위젯 기본값 변경하기
	//@Transactional
	@Override
	public int modifyDefault(int wsCustom) {
		
		log.info("wsCustom : " + wsCustom);
		mapper.updateDefaultCancel();
		mapper.updateDefault(wsCustom);
		//log.info("cancel : " + cancel);
		//log.info("modifyDefault : " + modifyDefault);
		
		return 1;
	}

	@Override
	public int removeWidget(WidgetVO widget, WidgetCustom widgetCustom) {
		
		log.info("widget: " + widget);
		log.info("widget: " + widgetCustom);
		
		
		return 1;
	}

}
