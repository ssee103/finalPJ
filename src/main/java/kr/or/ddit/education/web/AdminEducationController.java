package kr.or.ddit.education.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.education.service.IEducationService;
import kr.or.ddit.education.vo.BookVO;
import kr.or.ddit.education.vo.CurriculumVO;
import kr.or.ddit.education.vo.EducationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hrms/education/admin")
public class AdminEducationController {

	@Autowired
	private IEducationService eduService;
	
	// 페이지 이동
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')")
	@GetMapping("/adminAllTrainingListSearch")
	public String adminAllTrainingListSearch() {
		return "education/adminAllTrainingListSearch";
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_GENERAL', 'ROLE_ADMIN', 'ROLE_MANAGER')")
	@PostMapping("/adminNewTrainingRegistration")
	public String adminNewTrainingRegistration() {
		return "education/adminNewTrainingRegistration";
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_GENERAL', 'ROLE_ADMIN', 'ROLE_MANAGER')")
	@GetMapping("/adminAllTrainingApplication")
	public String adminAllTrainingApplication() {
		return "education/adminAllTrainingApplication";
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_GENERAL', 'ROLE_ADMIN', 'ROLE_MANAGER')")
	@GetMapping("/adminTrainingDetail/{edcNo}")
	public String adminTrainingDetail(@PathVariable("edcNo") int edcNo, Model model) {
		log.info("교육 상세 페이지 요청 - 교육번호: {}", edcNo);

	    // 교육 상세 정보 가져오기
	    EducationVO education = eduService.getEducationAdminDetail(edcNo);
	    // 교육 관련 커리큘럼 리스트 가져오기
	    List<CurriculumVO> curriculumList = eduService.getCurriculumAdminByEdcNo(edcNo);
	    // 교육 관련 도서 리스트 가져오기
	    List<BookVO> bookList = eduService.getBooksAdminByEdcNo(edcNo);

	    // JSP로 데이터 전달
	    model.addAttribute("education", education);
	    model.addAttribute("curriculumList", curriculumList);
	    model.addAttribute("bookList", bookList);
		return "education/adminTrainingDetail";
	}



}