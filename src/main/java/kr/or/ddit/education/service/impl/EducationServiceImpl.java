package kr.or.ddit.education.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.mapper.IEducationMapper;
import kr.or.ddit.education.service.IEducationService;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EducationVO;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
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
	public EducationVO getEducationDetail(String edcNo) {
		return eduMapper.getEducationDetail(edcNo);
	}
	
	/* 교육 Detail 조회 */
	@Override
	public List<CurriculumVO> getCurriculumByEdcNo(String edcNo) {
		return eduMapper.getCurriculumByEdcNo(edcNo);
	}
	
	/* 교육 Detail 조회 */
	@Override
	public List<BookVO> getBooksByEdcNo(String edcNo) {
		return eduMapper.getBooksByEdcNo(edcNo);
	}

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


}
