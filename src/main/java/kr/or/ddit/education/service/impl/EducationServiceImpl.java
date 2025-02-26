package kr.or.ddit.education.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.mapper.IEducationMapper;
import kr.or.ddit.education.service.IEducationService;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EdcRequestVO;
import kr.or.ddit.education.vo.EducationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EducationServiceImpl implements IEducationService {

	@Autowired
	private IEducationMapper eduMapper;

	@Override
    public int insertBook(BookVO bookVO) {
        return eduMapper.insertBook(bookVO);
	}

	@Override
	public int selectEducationListCount(EducationVO educationVO) {
		return eduMapper.selectEducationListCount(educationVO);
	}

	@Override
	public List<EducationVO> selectEducationList(PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO) {
		return eduMapper.selectEducationList(pageVO, educationVO);
	}

	/* 교육 Detail 조회 */
	@Override
	public EducationVO getEducationDetail(int edcNo) {
		return eduMapper.getEducationDetail(edcNo);
	}
	@Override
	public List<CurriculumVO> getCurriculumByEdcNo(int edcNo) {
		return eduMapper.getCurriculumByEdcNo(edcNo);
	} 
	@Override
	public List<BookVO> getBooksByEdcNo(int edcNo) {
		return eduMapper.getBooksByEdcNo(edcNo);
	}

	/* 관리자 교육 Detail 조회 */
	@Override
	public EducationVO getEducationAdminDetail(int edcNo) {
		return eduMapper.getEducationAdminDetail(edcNo);
	}
	@Override
	public List<CurriculumVO> getCurriculumAdminByEdcNo(int edcNo) {
		return eduMapper.getCurriculumAdminByEdcNo(edcNo);
	}
	@Override
	public List<BookVO> getBooksAdminByEdcNo(int edcNo) {
		return eduMapper.getBooksAdminByEdcNo(edcNo);
	}
	
	/* 나의 교육 조회 */
	@Override
	public EducationVO getEducationMyLectureDetail(int edcNo) {
		return eduMapper.getEducationMyLectureDetail(edcNo);
	}
	@Override
	public List<CurriculumVO> getCurriculumMyLectureByEdcNo(int edcNo) {
		return eduMapper.getCurriculumMyLectureByEdcNo(edcNo);
	}
	@Override
	public List<BookVO> getBooksMyLectureByEdcNo(int edcNo) {
		return eduMapper.getBooksMyLectureByEdcNo(edcNo);
	}
	
	
	
	/* -------------------------------------------------------------------- */
	@Override
	public int selectEducationMyListCount(EducationVO educationVO) {
		return eduMapper.selectEducationMyListCount(educationVO);
	}

	@Override
	public List<EducationVO> selectEducationMyList(PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO) {
		log.info("Service - selectEducationMyList: emplNo = {}", educationVO.getEmplNo(),"-----------------------------------------------------------------");
	    return eduMapper.selectEducationMyList(pageVO, educationVO, educationVO.getEmplNo());
	}

	@Override
	public int selectEduApplicationListCount(EducationVO educationVO) {
		return eduMapper.selectEduApplicationListCount(educationVO);
	}

	@Override
	public List<EducationVO> selectEduApplicationList(String emplNo, PaginationInfoVO<EducationVO> pageVO, EducationVO educationVO) {
	    log.info("Service - selectEduApplicationList: emplNo = {}", emplNo);
	    educationVO.setEmplNo(emplNo); // ✅ emplNo를 EducationVO에 직접 세팅!
	    return eduMapper.selectEduApplicationList(emplNo, pageVO, educationVO);
	}

	/* ADMIN - 신규 교육 생성*/
	@Override
	public List<BookVO> getAllBooks() {
		return eduMapper.selectAllBooks();
	}

	@Override
	public List<EducationVO> getAllSort() {
		return eduMapper.selectAllSort();
	}

	@Override
	public List<EducationVO> getAllTarget() {
		return eduMapper.selectAllTarget();
	}

	@Override
	public List<EducationVO> getAllGrade() {
		return eduMapper.selectAllGrade();
	}

	@Override
	public int insertEducationWithCurriculum(EducationVO educationVO) {
		return eduMapper.insertEducationWithCurriculum(educationVO);
	}


	@Override
	public int insertEdcReqeust(EdcRequestVO edcRequestVO) {
	    if (edcRequestVO.getEdcAplc() == null || edcRequestVO.getEdcAplc().isEmpty()) {
	        throw new IllegalArgumentException("수강 신청자는 필수 입력값입니다.");
	    }
	    return eduMapper.insertEdcReqeust(edcRequestVO);
	}

	/* 관리자 - 교육신청 수락, 반려 버튼 */
	@Override
	public int updateEdcRequestStatus(EdcRequestVO edcRequestVO) {
		return eduMapper.updateEdcRequestStatus(edcRequestVO);
	}

	/* 관리자 - 교육 삭제 버튼 */
	@Override
	public int deactivateEducation(int edcNo) {
		return eduMapper.deactivateEducation(edcNo);
	}
}
