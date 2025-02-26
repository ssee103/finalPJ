package kr.or.ddit.education.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.service.IEducationService;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EdcRequestVO;
import kr.or.ddit.education.vo.EducationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/hrms/education/admin/rest")
public class AdminEducationRestController {

    @Autowired
    private IEducationService eduService;

    
    @PostMapping(value = "/insertBook")
    public ResponseEntity<String> insertBook(@RequestBody BookVO bookVO) {
        log.info("받은 도서 정보: {}", bookVO); 
        
        int result = eduService.insertBook(bookVO);
        
        if (result > 0) {
            return ResponseEntity.ok("책 등록 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("책 등록 실패");
        }
    }
    
	
    @PostMapping("/getEducationAllList")
    public ResponseEntity<Map<String, Object>> getEducationAllList(@RequestBody Map<String, String> paramMap) {
        ResponseEntity<Map<String, Object>> entity;
        Map<String, Object> resultMap = new HashMap<>();

        // 뷰에서 전달받은 데이터 가져오기
        String edcTarget = paramMap.get("edcTarget");
        String educator = paramMap.get("educator");
        String edcTitle = paramMap.get("edcTitle");
        String edcSort = paramMap.get("edcSort");
        int currentPage = Integer.parseInt(paramMap.get("page"));
        log.info("edcTarget, educator, edcTitle, edcSort, currentPage " + currentPage + edcTarget + educator + edcTitle + edcSort);

        EducationVO educationVO = new EducationVO();
        educationVO.setEdcTarget(edcTarget);
        educationVO.setEducator(educator);
        educationVO.setEdcTitle(edcTitle);
        educationVO.setEdcSort(edcSort);

        // 페이지와 검색어를 위한 데이터 세팅
        PaginationInfoVO<EducationVO> pageVO = new PaginationInfoVO<>();
        pageVO.setCurrentPage(currentPage);
        int totalRecord = eduService.selectEducationListCount(educationVO);
        pageVO.setTotalRecord(totalRecord);
        List<EducationVO> eduAllList = eduService.selectEducationList(pageVO, educationVO);

        // 날짜 변환 적용
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (EducationVO edu : eduAllList) {
            if (edu.getRecruitSdate() != null) {
                edu.setRecruitSdateFormatted(sdf.format(edu.getRecruitSdate())); 
            }
            if (edu.getRecruitEdate() != null) {
                edu.setRecruitEdateFormatted(sdf.format(edu.getRecruitEdate())); 
            }
            if (edu.getEdcSdate() != null) {
                edu.setEdcSdateFormatted(sdf.format(edu.getEdcSdate())); 
            }
            if (edu.getEdcEdate() != null) {
                edu.setEdcEdateFormatted(sdf.format(edu.getEdcEdate())); 
            }
        }
        if (!eduAllList.isEmpty()) {
            resultMap.put("eduAllList", eduAllList);
        }
        resultMap.put("pageVO", pageVO);
        entity = new ResponseEntity<>(resultMap, HttpStatus.OK);
        return entity;
    }
    
    
    @PostMapping("/getEduApplicationAllList")
    public ResponseEntity<Map<String, Object>> getEduApplicationAllList(@AuthenticationPrincipal UserDetails userDetails, @RequestBody Map<String, String> paramMap) {
        ResponseEntity<Map<String, Object>> entity;
        Map<String, Object> resultMap = new HashMap<>();

        // 뷰에서 전달받은 데이터 가져오기
        String edcTarget = paramMap.get("edcTarget");
        String educator = paramMap.get("educator");
        String edcTitle = paramMap.get("edcTitle");
        String edcSort = paramMap.get("edcSort");
        int currentPage = Integer.parseInt(paramMap.get("page"));
        log.info("edcTarget, educator, edcTitle, edcSort, currentPage " + currentPage + edcTarget + educator + edcTitle + edcSort);

        EducationVO educationVO = new EducationVO();
        educationVO.setEdcTarget(edcTarget);
        educationVO.setEducator(educator);
        educationVO.setEdcTitle(edcTitle);
        educationVO.setEdcSort(edcSort);
        String emplNo = userDetails.getUsername();
        log.info("로그인된 사용자의 사원번호: {}------------------------------", emplNo);


        // 페이지와 검색어를 위한 데이터 세팅
        PaginationInfoVO<EducationVO> pageVO = new PaginationInfoVO<>();
        pageVO.setCurrentPage(currentPage);
        int totalRecord = eduService.selectEduApplicationListCount(educationVO);
        pageVO.setTotalRecord(totalRecord);
        
        List<EducationVO> eduAllList = eduService.selectEduApplicationList(emplNo, pageVO, educationVO);
        
        // 날짜 변환 적용
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (EducationVO edu : eduAllList) {
            if (edu.getRecruitSdate() != null) {
                edu.setRecruitSdateFormatted(sdf.format(edu.getRecruitSdate())); 
            }
            if (edu.getRecruitEdate() != null) {
                edu.setRecruitEdateFormatted(sdf.format(edu.getRecruitEdate())); 
            }
            if (edu.getEdcSdate() != null) {
                edu.setEdcSdateFormatted(sdf.format(edu.getEdcSdate())); 
            }
            if (edu.getEdcEdate() != null) {
                edu.setEdcEdateFormatted(sdf.format(edu.getEdcEdate())); 
            }
        }
        if (!eduAllList.isEmpty()) {
            resultMap.put("eduAllList", eduAllList);
        }
        resultMap.put("pageVO", pageVO);
        entity = new ResponseEntity<>(resultMap, HttpStatus.OK);
        return entity;
    }

    /* 책 제목 조회 */
    @GetMapping("/getBookList")
    @ResponseBody
    public List<BookVO> getBookList() {
        return eduService.getAllBooks();
    }
    
    /* 교육분류 조회 */
    @GetMapping("/getSortList")
    @ResponseBody
    public List<EducationVO> getSortList() {
        return eduService.getAllSort();
    }
    
    /* 교육대상자 조회 */
    @GetMapping("/getTargetList")
    @ResponseBody
    public List<EducationVO> getTargetList() {
        return eduService.getAllTarget();
    }
    
    /* 교육대상자 직급 조회 */
    @GetMapping("/getGradeList")
    @ResponseBody
    public List<EducationVO> getGradeList() {
        return eduService.getAllGrade();
    }

    @PostMapping("/insertEducationWithCurriculum")
    @ResponseBody
    public ResponseEntity<String> insertEducationWithCurriculum(@RequestBody EducationVO educationVO){
    	log.info("받은 education 등록 정보 : {}", educationVO);
    	
    	int result = eduService.insertEducationWithCurriculum(educationVO);
    	if (result > 0) {
            return ResponseEntity.ok("교육 등록 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("교육 등록 실패");
        }
    }
    
    @PostMapping("/updateEdcRequestStatus")
    @ResponseBody
    public ResponseEntity<String> updateEdcRequestStatus(@RequestBody EdcRequestVO edcRequestVO) {
        log.info("교육 신청 상태 변경 요청: {}", edcRequestVO);

        int result = eduService.updateEdcRequestStatus(edcRequestVO);
        if (result > 0) {
            return ResponseEntity.ok("요청이 성공적으로 처리되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("요청 처리 실패");
        }
    }
    
    @PostMapping("/updateEdcActive")
    @ResponseBody
    public ResponseEntity<String> updateEdcActive(@RequestBody Map<String, Integer> requestData) {
        int edcNo = requestData.get("edcNo");
        
        int result = eduService.deactivateEducation(edcNo);
        
        if (result > 0) {
            return ResponseEntity.ok("강의가 비활성화되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("비활성화 실패");
        }
    }



}

    

