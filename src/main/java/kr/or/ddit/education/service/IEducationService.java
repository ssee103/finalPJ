package kr.or.ddit.education.service;

import java.util.List;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EdcRequestVO;
import kr.or.ddit.education.vo.EducationVO;

public interface IEducationService {

	public int insertBook(BookVO book);

	public int selectEducationListCount(EducationVO education);
	public List<EducationVO> selectEducationList(PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO);

	/* 유저-교육 Detail 조회 */
	public EducationVO getEducationDetail(int edcNo);
	public List<CurriculumVO> getCurriculumByEdcNo(int edcNo);
	public List<BookVO> getBooksByEdcNo(int edcNo);

	/* 유저 - 나의 교육 조회*/
	public int selectEducationMyListCount(EducationVO educationVO);
	public List<EducationVO> selectEducationMyList(PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO);

	/* ADMIN - 교육신청자 관리*/
	public int selectEduApplicationListCount(EducationVO educationVO);
	public List<EducationVO> selectEduApplicationList(String emplNo, PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO);

	/* ADMIN - 신규 교육 생성*/
	/* 책 제목 조회 */
	public List<BookVO> getAllBooks();
	/* 교육분류 조회 */
	public List<EducationVO> getAllSort();
	/* 교육대상부서 조회 */
	public List<EducationVO> getAllTarget();

	public List<EducationVO> getAllGrade();

	/* 커리큘럼 데이터를 위한 */
	/*
	 * public int insertEducation(EducationVO educationVO); 
	 * public int insertCurriculum(CurriculumVO curriculum);
	 */

	public int insertEducationWithCurriculum(EducationVO educationVO);

	public int insertEdcReqeust(EdcRequestVO edcRequestVO);

	/* 관리자 -교육 Detail 조회 */
	public EducationVO getEducationAdminDetail(int edcNo);
	public List<CurriculumVO> getCurriculumAdminByEdcNo(int edcNo);
	public List<BookVO> getBooksAdminByEdcNo(int edcNo);

	/* 유저 -나의 교육 조회 */
	public EducationVO getEducationMyLectureDetail(int edcNo);
	public List<CurriculumVO> getCurriculumMyLectureByEdcNo(int edcNo);
	public List<BookVO> getBooksMyLectureByEdcNo(int edcNo);

	/* 관리자 - 교육신청 수락, 반려 버튼 */
	public int updateEdcRequestStatus(EdcRequestVO edcRequestVO);

	/* 관리자 - 교육 삭제 버튼 */
	public int deactivateEducation(int edcNo);

	
}
