package kr.or.ddit.education.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.education.service.IEducationService;
import kr.or.ddit.education.vo.EducationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/hrms/education/user/rest")
public class UserEducationRestController {

    @Autowired
    private IEducationService eduService;

    @PostMapping("/getEducationAllList")
    public ResponseEntity<Map<String, Object>> getEducationAllList(@RequestBody Map<String, String> paramMap) {
        ResponseEntity<Map<String, Object>> entity;
        Map<String, Object> resultMap = new HashMap<>();

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

        PaginationInfoVO<EducationVO> pageVO = new PaginationInfoVO<>();
        pageVO.setCurrentPage(currentPage);
        int totalRecord = eduService.selectEducationListCount(educationVO);
        pageVO.setTotalRecord(totalRecord);
        List<EducationVO> eduAllList = eduService.selectEducationList(pageVO, educationVO);

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

    @PostMapping("/getEducationMyList")
    public ResponseEntity<Map<String, Object>> getEducationMyList(@AuthenticationPrincipal UserDetails userDetails, @RequestBody Map<String, String> paramMap) {
        
    	String emplNo = userDetails.getUsername();  // 로그인한 사용자의 ID
    	ResponseEntity<Map<String, Object>> entity;
        Map<String, Object> resultMap = new HashMap<>();

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
        educationVO.setEmplNo(emplNo);

        PaginationInfoVO<EducationVO> pageVO = new PaginationInfoVO<>();
        pageVO.setCurrentPage(currentPage);
        int totalRecord = eduService.selectEducationMyListCount(educationVO);
        pageVO.setTotalRecord(totalRecord);
        List<EducationVO> eduAllList = eduService.selectEducationMyList(pageVO, educationVO);

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


}
