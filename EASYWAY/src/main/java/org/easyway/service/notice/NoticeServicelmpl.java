package org.easyway.service.notice;

import java.util.List;

import org.easyway.domain.notice.NoticeVO;
import org.easyway.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServicelmpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public void register(NoticeVO notice) {
		mapper.insert(notice);

	}

	@Override
	public List<NoticeVO> getListAll() {
		log.info("getList!!!!!!!!!!!!!!!!!!!!!All!!!!!!!!!!!");
		return mapper.getListAll();
	}

	@Override
	public NoticeVO detail(int obId) {
		log.info("read!!!!!!!!!!!!!!!!!!!!!!!!!!1dk!!!!");
		return mapper.read(obId);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify" + notice);
		return mapper.update(notice);
	}

	@Override
	public boolean remove(int obId) {
		return mapper.delete(obId);
	}


}
