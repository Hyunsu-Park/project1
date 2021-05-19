package com.corona.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.corona.service.DataService;
import com.corona.vo.DataVO;

@RestController
public class DataAPIController {
	@Autowired
	DataService dservice;
	@GetMapping("/patientDataList")
	@ResponseBody			//데이터 받아오기
	public Map<String, Object> getDataList(DataVO vo){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<Map<String, Object>> dailyPatient = dservice.getDailyPatientSumList(7);		
		for (int i = 0; i < dailyPatient.size(); i++) {
			//System.out.println(dailyPatient.get(i));
			
			int cldapDaejeon = 0;
			int cldapUlsan = 0;
			int cldapBusan = 0;
			int cldapGwangju = 0;
			int cldapSeoul = 0;
			int cldapIncheon = 0;
			int cldapDaegu = 0;
			int sumPatient = 0;				
			
			cldapDaejeon =  Integer.parseInt(dailyPatient.get(i).get("cldap_daejeon").toString());
			cldapUlsan = Integer.parseInt(dailyPatient.get(i).get("cldap_ulsan").toString());
			cldapBusan = Integer.parseInt(dailyPatient.get(i).get("cldap_busan").toString());
			cldapGwangju = Integer.parseInt(dailyPatient.get(i).get("cldap_gwangju").toString());
			cldapSeoul = Integer.parseInt(dailyPatient.get(i).get("cldap_seoul").toString());
			cldapIncheon = Integer.parseInt(dailyPatient.get(i).get("cldap_incheon").toString());
			cldapDaegu = Integer.parseInt(dailyPatient.get(i).get("cldap_daegu").toString());
			
			sumPatient = cldapDaejeon + cldapUlsan + cldapBusan + cldapGwangju + cldapSeoul + cldapIncheon + cldapDaegu;
			
			dailyPatient.get(i).put("sumPatient", sumPatient);
		}
		
		resultMap.put("dailyPatient", dailyPatient);
		
		return resultMap;
	}
	
	@GetMapping("/patientAreaData")
	@ResponseBody			
	public Map<String, Object> getAreaList(DataVO vo){
		Map<String, Object> resultMap = new HashMap<>();
		
		Map<String, Object> areaPatient = dservice.getAreaList(1);		
		resultMap.put("areaPatient", areaPatient);
		return resultMap;
	}
	
	@GetMapping("/deadDataList")
	@ResponseBody		
	public Map<String, Object> getDeadDataList(DataVO vo){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<Map<String, Object>> dailyDead = dservice.getDailyDeadSumList(7);		
		for (int i = 0; i < dailyDead.size(); i++) {
			//System.out.println(dailyDead.get(i));
			
			int cldadDaejeon = 0;
			int cldadUlsan = 0;
			int cldadBusan = 0;
			int cldadGwangju = 0;
			int cldadSeoul = 0;
			int cldadIncheon = 0;
			int cldadDaegu = 0;
			int sumDead = 0;				
			
			cldadDaejeon =  Integer.parseInt(dailyDead.get(i).get("cldad_daejeon").toString());
			cldadUlsan = Integer.parseInt(dailyDead.get(i).get("cldad_ulsan").toString());
			cldadBusan = Integer.parseInt(dailyDead.get(i).get("cldad_busan").toString());
			cldadGwangju = Integer.parseInt(dailyDead.get(i).get("cldad_gwangju").toString());
			cldadSeoul = Integer.parseInt(dailyDead.get(i).get("cldad_seoul").toString());
			cldadIncheon = Integer.parseInt(dailyDead.get(i).get("cldad_incheon").toString());
			cldadDaegu = Integer.parseInt(dailyDead.get(i).get("cldad_daegu").toString());
			
			sumDead = cldadDaejeon + cldadUlsan + cldadBusan + cldadGwangju + cldadSeoul + cldadIncheon + cldadDaegu;
			
			dailyDead.get(i).put("sumDead", sumDead);
		}

		resultMap.put("dailyDead", dailyDead);

		return resultMap;
	}
	
	@GetMapping("/quarantineDataList")
	@ResponseBody		
	public Map<String, Object> getQuarantineDataList(DataVO vo){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<Map<String, Object>> dailyQuarantine= dservice.getDailyQuarantineSumList(7);		
		for (int i = 0; i < dailyQuarantine.size(); i++) {
			//System.out.println(dailyQuarantine.get(i));
			
			int cldaqDaejeon = 0;
			int cldaqUlsan = 0;
			int cldaqBusan = 0;
			int cldaqGwangju = 0;
			int cldaqSeoul = 0;
			int cldaqIncheon = 0;
			int cldaqDaegu = 0;
			int sumQuarantine = 0;				
		
			cldaqDaejeon =  Integer.parseInt(dailyQuarantine.get(i).get("cldaq_daejeon").toString());
			cldaqUlsan = Integer.parseInt(dailyQuarantine.get(i).get("cldaq_ulsan").toString());
			cldaqBusan = Integer.parseInt(dailyQuarantine.get(i).get("cldaq_busan").toString());
			cldaqGwangju = Integer.parseInt(dailyQuarantine.get(i).get("cldaq_gwangju").toString());
			cldaqSeoul = Integer.parseInt(dailyQuarantine.get(i).get("cldaq_seoul").toString());
			cldaqIncheon = Integer.parseInt(dailyQuarantine.get(i).get("cldaq_incheon").toString());
			cldaqDaegu = Integer.parseInt(dailyQuarantine.get(i).get("cldaq_daegu").toString());
		
			sumQuarantine = cldaqDaejeon + cldaqUlsan + cldaqBusan + cldaqGwangju + cldaqSeoul + cldaqIncheon + cldaqDaegu;
			
			dailyQuarantine.get(i).put("sumQuarantine", sumQuarantine);
		}
		
		resultMap.put("dailyQuarantine", dailyQuarantine);
		
		return resultMap;
	}
}

