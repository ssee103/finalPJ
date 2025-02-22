package kr.or.ddit.calendar.service;

import java.util.List;

import kr.or.ddit.calendar.vo.CalendarVO;



public interface ICalendarService {

	public List<CalendarVO> findAll();
	public void insert(CalendarVO cal);
	public void delete(int schNo);
	public void update(CalendarVO cal);
	public CalendarVO selectSchNo(int schNo);
	public List<CalendarVO> selectAll(String emplNo);
	
}
