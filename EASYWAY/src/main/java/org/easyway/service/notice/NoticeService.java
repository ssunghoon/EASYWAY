package org.easyway.service.notice;

import java.util.List;

import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticeVO;

public interface NoticeService {

	public void register(NoticeVO notice);
	
	//페이징 처리 구현으로 기존 리스트 교체
	//public List<NoticeVO> getListAll();
	
	public NoticeVO detail(int obId);
	
	public boolean modify(NoticeVO notice);

	public boolean remove(int obId);
	
	public List<NoticeVO> getListAll(NoticeCriteria cri);
}
