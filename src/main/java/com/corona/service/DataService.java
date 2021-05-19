package com.corona.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.mapper.DataMapper;
import com.corona.vo.DataVO;

@Service
public class DataService {
	@Autowired
	DataMapper mapper;
	public Map<String, Object> getAreaList(Integer limit) {
		return mapper.selectAreaList(limit);
	}
	public Integer getDailyNewPatientSum(Integer limit) {
		return mapper.selectDailyNewPatientSum(limit);
	}
	public Integer getPatientSum() {
		return mapper.selectPatientSum();
	}
	public List<Map<String, Object>> getDailyPatientSumList(Integer limit){
		return mapper.selectDailyPatientSumList(limit);
	}

	public DataVO getAreaDeadList(Integer limit) {
		return mapper.selectAreaDeadList(limit);
	}
	public Integer getDailyNewDeadSum(Integer limit) {
		return mapper.selectDailyNewDeadSum(limit);
	}
	public Integer getDeadSum() {
		return mapper.selectDeadSum();
	}
	public List<Map<String, Object>> getDailyDeadSumList(Integer limit){
		return mapper.selectDailyDeadSumList(limit);
	}
	
	public DataVO getAreaQuarantineList(Integer limit) {
		return mapper.selectAreaQuarantineList(limit);
	}
	public Integer getDailyNewQuarantineSum(Integer limit) {
		return mapper.selectDailyNewQuarantineSum(limit);
	}
	public Integer getQuarantineSum() {
		return mapper.selectQuarantineSum();
	}
	public List<Map<String, Object>> getDailyQuarantineSumList(Integer limit){
		return mapper.selectDailyQuarantineSumList(limit);
	}
	
	public DataVO AreaSuspicionList(Integer limit) {
		return mapper.selectAreaSuspicionList(limit);
	}
	public Integer getDailyNewSuspicionSum(Integer limit) {
		return mapper.selectDailyNewSuspicionSum(limit);
	}
	public Integer getSuspicionSum() {
		return mapper.selectSuspicionSum();
	}

}
