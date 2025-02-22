package kr.or.ddit.education.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.education.service.IEducationService;
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
	@GetMapping("/adminTrainingDetail")
	public String adminTrainingDetail() {
		return "education/adminTrainingDetail";
	}



}