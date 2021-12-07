package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.notice.DepartmentDTO;
import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticeVO;

public interface NoticeMapper {
	
	//삽입
	public int insert(NoticeVO notice);

	//전체리스트
	public List<NoticeVO> getListAll();
	
	//페이징검색 포함한 리스트
	public List<NoticeVO> getListPaging(NoticeCriteria cri);

	//상세조회
	public NoticeVO read(Long obId);
	
	//수정
	public boolean update(NoticeVO notice);

	//삭제
	public boolean delete(Long obId);
	
	//페이징 개수
	public int getTotalCount(NoticeCriteria cri);

	//조회수 증가
	public boolean updateViewCount(Long obId);
	
	public List<DepartmentDTO> getListDepartment(Long departmentId);
	

}
