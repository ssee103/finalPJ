package kr.or.ddit.dclz.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.cmm.vo.PaginationInfoVO;
import kr.or.ddit.dclz.service.IDclzService;
import kr.or.ddit.sanction.vo.HistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/dclz")
public class DclzRestController {

	@Autowired
	IDclzService dclzService;
	
	@PostMapping("/getOvertimeList")
	public ResponseEntity<List<HistoryVO>> getOvertimeList(@RequestBody PaginationInfoVO<HistoryVO> pageVO){
		int totalRecord = dclzService.getOverTimeTotalRecord(pageVO);
		pageVO.setTotalRecord(totalRecord);
		List<HistoryVO> historyList = dclzService.getOvertimeList(pageVO);
		return new ResponseEntity<List<HistoryVO>>(historyList, HttpStatus.OK);
	}

}
