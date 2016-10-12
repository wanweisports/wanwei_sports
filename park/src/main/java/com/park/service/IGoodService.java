package com.park.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.GoodInfo;

public interface IGoodService {
	
	public Integer saveGood(GoodInfo goodInfo, MultipartHttpServletRequest multipartRequest) throws IOException;

	public GoodInfo getGoodInfo(int goodId);
	
	public PageBean getGoods(GoodInputView goodInputView);
	
	public void addGoodCount(GoodInfo goodInfo);
	
	public void updateGoodInOrOut(int goodId, boolean up);
	
	public List<Map<String, Object>> getGoodsMarket(GoodInputView goodInputView);
	
	public List<Map<String, Object>> getGoodsCart(GoodInputView goodInputView);
	
}
