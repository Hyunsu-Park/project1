package com.corona.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.corona.vo.DataVO;

@Mapper
public interface DataMapper {
	public Map<String, Object> selectAreaList(Integer limit);
	public Integer selectDailyNewPatientSum(Integer limit);
	public Integer selectPatientSum();
	public List<Map<String, Object>> selectDailyPatientSumList(Integer limit);

	public DataVO selectAreaDeadList(Integer limit);
	public Integer selectDailyNewDeadSum(Integer limit);
	public Integer selectDeadSum();
	public List<Map<String, Object>> selectDailyDeadSumList(Integer limit);
	
	public DataVO selectAreaQuarantineList(Integer limit);
	public Integer selectDailyNewQuarantineSum(Integer limit);
	public Integer selectQuarantineSum();
	public List<Map<String, Object>> selectDailyQuarantineSumList(Integer limit);
	
	public DataVO selectAreaSuspicionList(Integer limit);
	public Integer selectDailyNewSuspicionSum(Integer limit);
	public Integer selectSuspicionSum();

}
