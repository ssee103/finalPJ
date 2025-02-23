package kr.or.ddit.education.service;

import java.util.List;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EducationVO;
import kr.or.ddit.education.vo.EmpEdcVO;

public interface IEducationService {

	public int insertBook(BookVO book);

	public int selectEducationListCount(EducationVO education);
	public List<EducationVO> selectEducationList(PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO);

	/* 유저-교육 Detail 조회 */
	public EducationVO getEducationDetail(String edcNo);
	public List<CurriculumVO> getCurriculumByEdcNo(String edcNo);
	public List<BookVO> getBooksByEdcNo(String edcNo);

	/* 유저 - 나의 교육 조회*/
	public int selectEducationMyListCount(EducationVO educationVO);
	public List<EducationVO> selectEducationMyList(PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO);

	/* ADMIN - 교육신청자 관리*/
	public int selectEduApplicationListCount(EducationVO educationVO);
	public List<EducationVO> selectEduApplicationList(String emplNo, PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO);

}
