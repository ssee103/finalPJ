package kr.or.ddit.calendar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.calendar.vo.CalendarVO;




@Mapper
public interface ICalendarMapper {

	public List<CalendarVO> findAll();

	public void insert(CalendarVO cal);

	public void delete(int schNo);

	public void update(CalendarVO cal);

	public CalendarVO selectSchNo(int schNo);

	public List<CalendarVO> selectAll(String emplNo);


	
}
