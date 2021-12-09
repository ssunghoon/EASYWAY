package org.easyway.mapper;

import java.util.List;

import org.easyway.domain.notice.DepartmentDTO;
import org.easyway.domain.notice.NoticeCriteria;
import org.easyway.domain.notice.NoticeVO;

public interface NoticeMapper {
	
	//삽입
	public int insert(NoticeVO notice);

	//전체리스트(페이징전)
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
	
	
	//부서 공지사항 메서드
	
	//부서별 리스트 출력(페이징 전)
	public List<DepartmentDTO> getListDepartment(Long departmentId);
	
	//페이징 추가한 부서공지사항
	public List<DepartmentDTO> getDepartmentListPaging(NoticeCriteria cri);
	
	
	

}
