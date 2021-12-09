package org.easyway.service.notice;

import java.util.List;

import org.easyway.domain.notice.DepartmentDTO;
import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticeVO;

public interface NoticeService {

	public void register(NoticeVO notice);
	
	//페이징 처리 구현으로 기존 리스트 교체
	public List<NoticeVO> getListAll();
	
	public NoticeVO detail(Long obId);
	
	public boolean modify(NoticeVO notice);

	public boolean remove(Long obId);
	
	public List<NoticeVO> getListAll(NoticeCriteria cri);
	
	public int getTotal(NoticeCriteria cri);
	
	public boolean modifyViewCount(Long obId);
	
	//부서 공지사항 서비스 메서드
	
	//부서별 리스트 출력
	public List<DepartmentDTO> getListDepartment(Long departmentId);
	
	//페이징 추가한 부서별 리스트 출력
	public List<DepartmentDTO> getDepartmentListPaging(NoticeCriteria cri);
	
	
}
