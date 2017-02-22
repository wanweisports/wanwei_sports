package com.park.service;

import com.park.common.po.ParkBusiness;
import com.park.common.po.UserOperator;

public interface IInitService {
	
	public void saveInit(ParkBusiness parkBusiness, UserOperator operator);

}
