package org.easyway.service.notice;

import java.util.List;

import org.easyway.domain.notice.NoticeVO;

public interface NoticeService {

	public void register(NoticeVO notice);
	
	public List<NoticeVO> getListAll();
	
	public NoticeVO detail(int obId);
	
	public boolean modify(NoticeVO notice);

	public boolean remove(int obId);
}
