package org.easyway.controller;

import java.util.List;

import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticeVO;
import org.easyway.mapper.NoticeMapper;
import org.easyway.service.notice.NoticeService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@WebAppConfiguration
public class NoticeControllerTests {

	 @Setter(onMethod_ = {@Autowired} )
	private NoticeMapper mapper;
	// private NoticeService service;
//	 private WebApplicationContext ctx;
//	 private MockMvc mockMvc;
//
//	 @Before
//	 public void setup(){
//	 this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
//	 }

	// 페이징처리1차 테스트
//	@Test
//	public void testPaging() {
//		NoticeCriteria cri = new NoticeCriteria();
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		List<NoticeVO> list = mapper.getListPaging(cri);
//		list.forEach(notice -> log.info(notice.getObId()));
//	}
	 
	 //페이징 처리 2차 테스트
//	 @Test
//	 public void testpsing2() throws Exception{
//		 log.info(mockMvc.perform(MockMvcRequestBuilders.get("/notice/noticelist")
//				.param("pageNum", "2")
//				.param("amount", "50"))
//				.andReturn().getModelAndView().getModelMap());
//	 }
	 
	 @Test
	 public void testsearch(){
		 NoticeCriteria cri = new NoticeCriteria();
		 cri.setKeyword("공지");
		 cri.setType("N");
		 
		 List<NoticeVO> list = mapper.getListPaging(cri);
		 list.forEach(notice -> log.info(notice));
	 }
}