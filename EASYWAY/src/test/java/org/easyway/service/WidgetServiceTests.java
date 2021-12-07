package org.easyway.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;
import org.easyway.mapper.WidgetMapperTests;
import org.easyway.service.office.WidgetService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WidgetServiceTests {
/*
	@Autowired
	private WidgetService service;
	
	@Test
	public void test() {
		
		List<WidgetVO> widgetList = new ArrayList<WidgetVO>();
		
		for (int i = 1; i <= 6; i++){

			WidgetVO widget = new WidgetVO();
			
			log.info("widget!!!!!!!!!!!!!!!!!!!!!------------" + widget);
			
			widget.setWidgetName(i);
			widget.setWidgetPositionX(100 + i);
			widget.setWidgetPositionY(100 + i);
			widget.setWidgetWidth(100 + i);
			widget.setWidgetHeight(100 + i);
			
			widgetList.add(widget);
			
			log.info("widgetList!!!!!!!!!!!!!!!!!!!!!!------------" + widgetList);
		}
		
		WidgetCustom widgetCustom = new WidgetCustom();
		widgetCustom.setMemberId(88L);
		widgetCustom.setOfficeId(88L);
		widgetCustom.setWsCustom(3);
		widgetCustom.setWsImport("N");
		
		service.save(widgetList, widgetCustom);
		
	}
*/
}
