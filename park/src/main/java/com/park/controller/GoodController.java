package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.GoodInfo;
import com.park.common.po.GoodShopping;
import com.park.common.po.GoodType;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.service.IGoodService;

@Controller
@RequestMapping("good")
public class GoodController extends BaseController {
	
	@Autowired
	private IGoodService goodService;

    // 商品类别设置
    @RequestMapping("typeGood")
    public String typeGood(GoodInputView goodInputView, Model model){
    	try {
    		model.addAllAttributes(JsonUtils.fromJsonDF(goodInputView));
			PageBean pageBean = goodService.getGoodTypes(goodInputView);
			System.out.println(JsonUtils.toJson(pageBean.getList()));
			super.setPageInfo(model, pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Goods/GoodsTypeSettings";
    }
	
	@RequestMapping("settingGood")
	public String settingGood(Model model){
		model.addAttribute("goodTypeNames", goodService.getGoodTypeNames());
		return "Goods/GoodsSettings";
	}

	@RequestMapping("viewGood")
	public String viewGood(Integer goodId, Model model){
        model.addAllAttributes(JsonUtils.fromJsonDF(goodService.getGoodInfo(goodId)));
        model.addAttribute("goodTypeNames", goodService.getGoodTypeNames());
		return "Goods/GoodsViews";
	}

	@ResponseBody
	@RequestMapping("saveGood")
	public ResponseBean saveGood(GoodInfo goodInfo, MultipartHttpServletRequest multipartRequest){
		try {
			UserOperator userOperator = super.getUserInfo();
			goodInfo.setSalesId(userOperator.getId());
			Integer goodId = goodService.saveGood(goodInfo, multipartRequest);
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
		return "Goods/GoodsStockManagement";
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
	
	@ResponseBody
	@RequestMapping(value = "addGoodsToCart")
	public ResponseBean addGoodsToCart(GoodShopping goodShopping, int amount){
		try {
			UserOperator userOperator = super.getUserInfo();
			goodShopping.setSalesId(userOperator.getId());
			Integer shoppingId = goodService.saveGoodShopping(goodShopping, amount);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("shoppingId", shoppingId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteCart")
	public ResponseBean deleteCart(int shoppingId){
		try {
			UserOperator userOperator = super.getUserInfo();
			goodService.deleteCart(shoppingId, userOperator.getId());
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@RequestMapping(value = "getGoodsCart")
	public String getGoodsCart(Model model) {
		try {
			//获取登录销售员下的所有购物车商品
			UserOperator userOperator = super.getUserInfo();
			model.addAttribute("goods", goodService.getGoodsCart(userOperator.getId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Goods/GoodsCarts";
	}

	@RequestMapping(value = "getGoodsStockDetails")
	public String getGoodsStockDetails() {
		return "Goods/GoodStockDetails";
	}

	// 商品类别设置
	@ResponseBody
	@RequestMapping("goodTypes")
	public ResponseBean goodTypes(GoodInputView goodInputView){
		try {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("list", goodService.getGoodTypes(goodInputView));
			return new ResponseBean(data);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}

	@ResponseBody
	@RequestMapping(value = "goodTypeInfo")
	public ResponseBean goodTypeInfo(int goodTypeId) {
		try {
			return new ResponseBean(JsonUtils.fromJson(goodService.getGoodType(goodTypeId)));
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "saveGoodType")
	public ResponseBean saveGoodType(GoodType goodType) {
		try {
			UserOperator userInfo = super.getUserInfo();
			goodType.setSalesId(userInfo.getId());
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("goodTypeId", goodService.saveGoodType(goodType));
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
}
