package com.park.service;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.GoodInfo;

public interface IGoodService {
	
	public Integer saveGood(GoodInfo goodInfo);

	public GoodInfo getGoodInfo(int goodId);
	
	public PageBean getGoods(GoodInputView goodInputView);
	
	public void addGoodCount(GoodInfo goodInfo);
	
	public void updateGoodInOrOut(int goodId, boolean up);
	
}
