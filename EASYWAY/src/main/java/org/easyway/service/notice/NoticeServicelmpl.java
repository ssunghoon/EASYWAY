package org.easyway.service.notice;

import java.util.List;

import org.easyway.domain.employee.EmployeeVO;
import org.easyway.domain.notice.DepartmentDTO;
import org.easyway.domain.notice.NoticeCriteria;
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

//	페이징 처리 구현으로 기존 getlist 교체
	@Override
	public List<NoticeVO> getListAll() {
		log.info("getList!!!!!!!!!!!!!!!!!!!!!All!!!!!!!!!!!");
		return mapper.getListAll();
	}

	@Override
	public NoticeVO detail(Long obId) {
		log.info("read!!!!!!!!!!!!!!!!!!!!!!!!!!1dk!!!!");
		return mapper.read(obId);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify" + notice);
		return mapper.update(notice);
	}

	@Override
	public boolean remove(Long obId) {
		return mapper.delete(obId);
	}

	@Override
	public List<NoticeVO> getListAll(NoticeCriteria cri) {
		log.info("페이징 처리합니다^^^^" + cri);
		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal(NoticeCriteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean modifyViewCount(Long obId) {
		return mapper.updateViewCount(obId);
	}

	@Override
	public List<DepartmentDTO> getListDepartment(Long departmentId) {
		return mapper.getListDepartment(departmentId);
	}

	@Override
	public List<DepartmentDTO> getDepartmentListPaging(NoticeCriteria cri) {
			log.info("페이징처리한 부서 리스트 납시오" + cri);
			return mapper.getDepartmentListPaging(cri);
	}


}
