package com.park.platform.service;

import com.park.common.po.ParkBusiness;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface IParkService {

	public ParkBusiness getBusiness();
	
	public List<Map<String, Object>> getTimePeriod(ParkBusiness parkBusiness) throws ParseException;
	
	public ParkBusiness getParkBusiness();
	
	public Integer saveParkBusiness(ParkBusiness parkBusiness);
	
	public Map<String, Object> getBusinessTime();

	public List<String> getBusinessTimePeriod();

    public List<Map<String, Object>> getPayTypeList();
	
}
