package com.park.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.GoodInfo;
import com.park.common.po.GoodShopping;
import com.park.common.po.GoodType;

public interface IGoodService {
	
	public Integer saveGood(GoodInfo goodInfo, MultipartHttpServletRequest multipartRequest) throws IOException;

	public GoodInfo getGoodInfo(int goodId);
	
	public PageBean getGoods(GoodInputView goodInputView);
	
	public void addGoodCount(GoodInfo goodInfo);
	
	public void updateGoodInOrOut(int goodId, boolean up);
	
	public List<Map<String, Object>> getGoodsMarket(GoodInputView goodInputView);
	
	public List<Map<String, Object>> getGoodsCart(int salesId);
	
	public Integer saveGoodShopping(GoodShopping goodShopping, int amount);
	
	public GoodShopping getGoodShoppingByGood(int goodId, int salesId);
	
	public GoodShopping getGoodShopping(int shoppingId, int salesId);
	
	public void deleteCart(int shoppingId, int salesId);
	
	public List<Map<String, Object>> getGoodTypeNames();
	
	public PageBean getGoodTypes(GoodInputView goodInputView);
	
	public Integer saveGoodType(GoodType goodType);
	
	public GoodType getGoodType(int goodTypeId);
	
}
