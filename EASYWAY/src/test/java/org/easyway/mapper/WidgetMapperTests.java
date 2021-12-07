package org.easyway.mapper;

import static org.junit.Assert.*;

import org.easyway.domain.office.WidgetCustom;
import org.easyway.domain.office.WidgetVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WidgetMapperTests {
	
	@Autowired
	private WidgetMapper mapper;
	
/*	@Test
	public void test() {
		log.info("이거 하면 뭐 나오는데...?-----------------------" + mapper);
	}

*/
	
/*	@Test
	public void test(){
		WidgetCustom widgetCustom = new WidgetCustom();
		
		widgetCustom.setMemberId(10L);
		widgetCustom.setOfficeId(10L);
		widgetCustom.setWsCustom(2);
		
		mapper.insertWidgetCustom(widgetCustom);
		
		log.info("테스트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + widgetCustom);
	}
*/
	
/*	
	@Test
	public void test(){
		WidgetVO widget = new WidgetVO();
		
		widget.setWsId(1L);
		widget.setWidgetName(3);
		widget.setWidgetPositionX(200);
		widget.setWidgetPositionY(500);
		widget.setWidgetWidth(100);
		widget.setWidgetHeight(80);
		
		mapper.insertWidget(widget);
		
		log.info("테스트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + widget);
		
	}*/
	
/*	@Test
	public void test(){
		
		mapper.updateDefaultCancel();
		mapper.updateDefault(3);
		
	}
*/
}
