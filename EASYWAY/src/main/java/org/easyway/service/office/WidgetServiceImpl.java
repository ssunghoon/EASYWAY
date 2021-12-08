package org.easyway.service.office;

import java.util.ArrayList;
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
		
		// 2. 기존 저장되어있는 위젯들 지우기
		log.info("wsCustom : " + widgetCustom.getWsCustom());
		mapper.deleteWidget(widgetCustom);
		
		// 3. 기존 저장되어있는 위젯들 지우기
		mapper.deleteWidgetCustom(widgetCustom);
		
		// 4. 새로 저장될 멤버와 오피스와 위젯 매핑
		mapper.insertWidgetCustom(widgetCustom);
		Long wsId = widgetCustom.getWsId();
		log.info("wsId------------------------------" + wsId);
		
		// 5. 위젯 정보 저장
		widgetList.forEach(widget -> {
			log.info("widget---------------------------" + widget);
			widget.setWsId(wsId);
			mapper.insertWidget(widget);
			
		});
		return 1;
	}

	// 위젯 불러오기
	@Override
	public WidgetGetMainDTO getListWidget(WidgetCustom widgetCustom) throws Exception {
		
		WidgetGetMainDTO widgetGetMain = new WidgetGetMainDTO();
		log.info("widgetCustom------------------------" + widgetCustom);
		
		// wsCustom : 불러온 커스텀넘버, widgetList : 저장된 위젯리스트
		List<WidgetVO> widgetList =  mapper.getListWidget(widgetCustom);
		widgetGetMain.setWidgetList(widgetList);
		log.info("widgetGetMain---------------------" + widgetGetMain);
		
		// 위젯을 아직 저장한 적 없을 때 null 처리
		if( mapper.readCustomNow(widgetCustom) == "" ||
				mapper.readCustomNow(widgetCustom) == null ) { // null이면 기본값 1로 불러오기
			int setDefault = 1; 
			widgetGetMain.setWsCustom(setDefault);
		} else {																		// null이 아니면 저장된 값 불러오기
			log.info("저장된 위젯 정보 있음");
			int wsCustom =  Integer.parseInt(mapper.readCustomNow(widgetCustom));
			widgetGetMain.setWsCustom(wsCustom);
		}
		
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

	// 위젯 리셋(전체 삭제)하기
	@Override
	public int removeWidget(WidgetCustom widgetCustom) {
		
		log.info("서비스 widgetCustom: " + widgetCustom);
		
		return mapper.deleteWidget(widgetCustom);
	}

}
