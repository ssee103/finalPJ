package kr.or.ddit.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChartMapper {

	public Map<String, Object> getLateData();

}
