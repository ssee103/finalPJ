package kr.or.ddit.promotion.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.vo.EmployeeVO;

@Controller
@RequestMapping("hrms/prom")
public class PromotionController {

	@GetMapping("/promotion")
	public String promotion() {
		return "/promotion/promotion";
	}
	
	
	public String promList() {
		return "promotion/promotion";
	}
}
