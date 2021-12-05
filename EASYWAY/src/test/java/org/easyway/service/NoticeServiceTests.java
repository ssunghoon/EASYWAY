package org.easyway.service;

import java.util.List;

import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticeVO;
import org.easyway.service.notice.NoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@WebAppConfiguration

public class NoticeServiceTests {
	@Setter(onMethod_ = { @Autowired })

	private NoticeService service;
	@Test
	public void testList(){
		service.getListAll(new NoticeCriteria(2, 10))
		.forEach(notice -> log.info(notice));
}}