package kr.or.ddit.calendar.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.mapper.ICalendarMapper;
import kr.or.ddit.calendar.service.ICalendarService;
import kr.or.ddit.calendar.vo.CalendarVO;


@Service
public class CalendarServiceImpl implements ICalendarService{

	@Autowired
	private ICalendarMapper mapper;
	
	@Override
	public List<CalendarVO> findAll() {
		return mapper.findAll();
	}

	@Override
	public void insert(CalendarVO cal) {
		mapper.insert(cal);
		
	}

	@Override
	public void delete(int schNo) {
		mapper.delete(schNo);
		
	}

	@Override
	public void update(CalendarVO cal) {
		mapper.update(cal);
		
	}

	@Override
	public CalendarVO selectSchNo(int schNo) {
		return mapper.selectSchNo(schNo);
	}


	@Override
	public List<CalendarVO> selectAll(String emplNo) {
		return mapper.selectAll(emplNo);
	}

	
}
