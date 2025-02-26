package kr.or.ddit.education.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EdcRequestVO;
import kr.or.ddit.education.vo.EducationVO;

@Mapper
public interface IEducationMapper {

	public int insertBook(BookVO book);

	public int selectEducationListCount(EducationVO educationVO);
	public List<EducationVO> selectEducationList(@Param("page") PaginationInfoVO<EducationVO> paginationInfoVO, @Param("education") EducationVO educationVO );

	/* 교육 Detail 조회 */
	public EducationVO getEducationDetail(@Param("edcNo") int edcNo);
	public List<CurriculumVO> getCurriculumByEdcNo(@Param("edcNo") int edcNo);
	public List<BookVO> getBooksByEdcNo(@Param("edcNo") int edcNo);

	/* 관리자 - 교육 Detail 조회 */
	public EducationVO getEducationAdminDetail(@Param("edcNo") int edcNo);
	public List<CurriculumVO> getCurriculumAdminByEdcNo(@Param("edcNo") int edcNo);
	public List<BookVO> getBooksAdminByEdcNo(@Param("edcNo") int edcNo);
	
	/* 나의 교육 내용 조회 */
	public EducationVO getEducationMyLectureDetail(int edcNo);
	public List<CurriculumVO> getCurriculumMyLectureByEdcNo(int edcNo);
	public List<BookVO> getBooksMyLectureByEdcNo(int edcNo);

	
	public int selectEducationMyListCount(EducationVO educationVO);
	public List<EducationVO> selectEducationMyList(@Param("page")PaginationInfoVO<EducationVO> pageVO, @Param("education") EducationVO educationVO, String empl);

	/* ADMIN - 교육신청자 조회 */
	public int selectEduApplicationListCount(EducationVO educationVO);
	public List<EducationVO> selectEduApplicationList(@Param("emplNo")String emplNo, @Param("page")PaginationInfoVO<EducationVO> pageVO, @Param("education") EducationVO educationVO);

	/* ADMIN - 신규 교육 생성*/
	public List<BookVO> selectAllBooks();
	public List<EducationVO> selectAllSort();
	public List<EducationVO> selectAllTarget();
	public List<EducationVO> selectAllGrade();


	/* ADMIN - 신규 교육 - 커리큘럼 생성*/
	/*
	 * public void insertEducation(EducationVO educationVO); 
	 * public void insertCurriculum(CurriculumVO curriculumVO);
	 */
	public int insertEducationWithCurriculum(EducationVO educationVO);

	public int insertEdcReqeust(EdcRequestVO edcRequestVO);

	/* 관리자 - 교육신청 수락, 반려 버튼 */
	public int updateEdcRequestStatus(EdcRequestVO edcRequestVO);

	/* 관리자 - 교육 삭제 버튼 */
	public int deactivateEducation(int edcNo);

}
