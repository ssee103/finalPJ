package kr.or.ddit.education.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EducationVO;

@Mapper
public interface IEducationMapper {

	public int insertBook(BookVO book);

	public int selectEducationListCount(EducationVO educationVO);
	public List<EducationVO> selectEducationList(@Param("page") PaginationInfoVO<EducationVO> paginationInfoVO, @Param("education") EducationVO educationVO );

	/* 교육 Detail 조회 */
	public EducationVO getEducationDetail(@Param("edcNo") String edcNo);
	public List<CurriculumVO> getCurriculumByEdcNo(@Param("edcNo") String edcNo);
	public List<BookVO> getBooksByEdcNo(@Param("edcNo") String edcNo);

	public int selectEducationMyListCount(EducationVO educationVO);
	public List<EducationVO> selectEducationMyList(@Param("page")PaginationInfoVO<EducationVO> pageVO, @Param("education") EducationVO educationVO, String string);



}
