package kr.or.ddit.education.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.attendance.vo.DiligenceAndLazinessVO;
import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.service.IEducationService;
import kr.or.ddit.education.vo.BookVO;
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

        // ✅ 날짜 변환 적용
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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

	
	/**
	  
	 // 20250213202427
	 // http://localhost:8060/hrms/education/admin/rest/getEducationAllList
     // get으로 호출하면 받는 정보임.
		{
		  "eduAllList": [
		    {
		      "edcNo": "11",
		      "edcSort": "기술",
		      "edcWay": "온라인",
		      "educator": "강감찬",
		      "edcTarget": "경력",
		      "edcGrade": "과장",
		      "edcPsncpa": 40,
		      "edcTitle": "교육 프로그램 11",
		      "edcContent": "이것은 교육 프로그램 11의 내용입니다.",
		      "recruitSdate": "2025-03-06T15:00:00.000+00:00",
		      "recruitEdate": "2025-03-14T15:00:00.000+00:00",
		      "edcSdate": "2025-03-21T15:00:00.000+00:00",
		      "edcEdate": "2025-04-05T15:00:00.000+00:00",
		      "edcActive": "Y"
		    }
		  ],
		  "pageVO": {
		    "emplNo": null,
		    "totalRecord": 1,
		    "totalPage": 1,
		    "currentPage": 1,
		    "screenSize": 10,
		    "blockSize": 3,
		    "startRow": 1,
		    "endRow": 10,
		    "startPage": 1,
		    "endPage": 3,
		    "dataList": null,
		    "searchType": null,
		    "searchWord": null,
		    "dateStart": null,
		    "dateEnd": null,
		    "pagingHTML": "<ul class='pagination pagination-sm m-0 float-right'><li class='page-item active'><span class='page-link'>1</span></li></ul>"
		  }
		}
	 */
}
