package com.park.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.GoodInfo;
import com.park.common.po.UserOperator;
import com.park.common.util.FileUtil;
import com.park.common.util.JsonUtils;
import com.park.service.IGoodService;

@Controller
@RequestMapping("good")
public class GoodController extends BaseController {
	
	@Autowired
	private IGoodService goodService;
	
	@RequestMapping("updateGood")
	public String updateGood(Integer goodId, Model model){
		if(goodId != null){
			model.addAllAttributes(JsonUtils.fromJsonDF(goodService.getGoodInfo(goodId)));
		}
		return "Goods/GoodsInfo";
	}

	@ResponseBody
	@RequestMapping("saveGood")
	public ResponseBean saveGood(GoodInfo goodInfo, MultipartHttpServletRequest multipartRequest){
		try {
			UserOperator userOperator = super.getUserInfo();
			goodInfo.setSalesId(userOperator.getId());
			Integer goodId = goodService.saveGood(goodInfo, FileUtil.getMultipartFiles(multipartRequest));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("goodId", goodId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@RequestMapping(value = "getGoods")
	public String getGoods(GoodInputView goodInputView, Model model) {
		try {
			model.addAllAttributes(JsonUtils.fromJsonDF(goodInputView));
			PageBean pageBean = goodService.getGoods(goodInputView);
			super.setPageInfo(model, pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Goods/GoodsList";
	}
	
	@ResponseBody
	@RequestMapping("addGoodCount")
	public ResponseBean addGoodCount(GoodInfo goodInfo){
		try {
			goodService.addGoodCount(goodInfo);
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping("goodInOrOut")
	public ResponseBean goodInOrOut(Integer goodId, Boolean up){
		try {
			goodService.updateGoodInOrOut(goodId, up);
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@RequestMapping(value = "getGoodsMarket")
	public String getGoodsMarket(GoodInputView goodInputView, Model model) {
		try {
			model.addAttribute("goods", goodService.getGoodsMarket(goodInputView));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Goods/GoodsMarket";
	}
	
	@RequestMapping(value = "getGoodsCart")
	public String getGoodsCart(GoodInputView goodInputView, Model model) {
		try {
			model.addAttribute("goods", goodService.getGoodsCart(goodInputView));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Goods/GoodsCarts";
	}
	
}
