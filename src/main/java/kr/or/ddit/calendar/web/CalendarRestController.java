package kr.or.ddit.calendar.web;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import kr.or.ddit.calendar.service.ICalendarService;
import kr.or.ddit.calendar.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
@RequestMapping("/api/events")
public class CalendarRestController {

	@Autowired
	private ICalendarService service;

	//일정추가
	@PostMapping
	public ResponseEntity<?> insertCalendar(@RequestBody CalendarVO cal){
		
		if(cal.isSchAllDay()) {
			cal.setSchSDate(convertToMidnight(cal.getSchSDate()));
			cal.setSchEDate(cal.getSchEDate() != null ? convertToEndOfDay(cal.getSchEDate()) : cal.getSchSDate()) ;
		}
		service.insert(cal);
		return ResponseEntity.ok("성공적으로 저장되었습니다.");
	}

	//조회
	@PostMapping("/selectById")
	public List<Map<String, Object>> selectAll(@RequestBody Map<String, String> empMap){
		log.info("emplNo : " + empMap.get("emplNo"));
		List<CalendarVO> cals = service.selectAll(empMap.get("emplNo"));
		return cals.stream().map(event -> {
			Map<String, Object> map = new HashMap<>();
			map.put("id", event.getSchNo());
			map.put("title", event.getSchTitle());
			map.put("start", event.getSchSDate());
			map.put("end", event.getSchEDate());
			map.put("color", event.getSchColor());
			map.put("textColor", event.getSchTextColor());
			map.put("allDay", event.isSchAllDay());
			return map;
		}).collect(Collectors.toList());
	}
	
	//수정
	@PutMapping("/{schNo}")
	public ResponseEntity<String> updateCalendar(@PathVariable int schNo, @RequestBody CalendarVO cal){
		
		CalendarVO isCal = service.selectSchNo(schNo);
		
		isCal.setSchSDate(cal.getSchSDate());
		isCal.setSchEDate(cal.getSchEDate());
		
		cal.setSchNo(schNo);
		service.update(isCal);
		
		return ResponseEntity.ok("일정 업데이트 성공");
	}
	
	//삭제
	public ResponseEntity<?> deleteCalendar(@PathVariable int schNo){
		CalendarVO cal = service.selectSchNo(schNo);
		
		service.delete(schNo);
		return ResponseEntity.ok("성공적으로 삭제 되었습니다.");		
	}
	
	// ✅ `allDay` 일정에서 `endDate`가 하루 뒤로 증가하는 문제 해결
	private Date correctAllDaySchEDate(Date schSDate, Date schEDate) {
		 if (schSDate == null || schEDate == null) return schEDate;
	        LocalDate startLocalDate = schSDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        LocalDate endLocalDate = schEDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

	        if (endLocalDate.isAfter(startLocalDate)) {
	            return convertToEndOfDay(schSDate);
	        }
	        return schEDate;
	}

	private Date convertToEndOfDay(Date date) {
		if (date == null) return null;
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		return Date.from(localDate.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant().minusSeconds(1));
	}

	private Date convertToMidnight(Date date) {
		if (date == null) return null;
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
	}
}