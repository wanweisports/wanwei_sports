package com.park.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.park.common.po.ParkBusiness;

public interface IParkService {

	public ParkBusiness getBusiness();
	
	public List<Map<String, Object>> getTimePeriod(ParkBusiness parkBusiness) throws ParseException;
	
	public ParkBusiness getParkBusiness(int businessId);
	
	public Integer saveParkBusiness(ParkBusiness parkBusiness);
	
}
