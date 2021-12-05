package org.easyway.service.office;

import java.util.List;

import org.easyway.domain.office.WidgetCustom;
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

	@Transactional
	@Override
	public int save(List<WidgetVO> widgetList, WidgetCustom widgetCustom) {
		// 처리 순서
		// 1. insetWidgetCustom
		mapper.insertWidgetCustom(widgetCustom);
		Long wsId = widgetCustom.getWsId();
		log.info("wsId------------------------------" + wsId);
		
		widgetList.forEach(widget -> {
			
			log.info("widget---------------------------" + widget);
			widget.setWsId(wsId);
			
			// 2. insetWidget
			mapper.insertWidget(widget);
			
		});
		return 1;
	}

	@Override
	public List<WidgetVO> getListWidget(WidgetCustom widgetCustom) {
		
		log.info("widgetCustom------------------------" + widgetCustom);
		
		return mapper.getListWidget(widgetCustom);
	}
	
	
	
	

}
