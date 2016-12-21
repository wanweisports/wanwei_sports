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
import com.park.common.po.OrderInfo;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.service.IGoodService;

@Controller
@RequestMapping("good")
public class GoodController extends BaseController {

    @Autowired
    private IGoodService goodService;

    /**
     * 显示商品类别类型查询页面
     * @param goodInputView
     * @param model
     * @return
     */
    @RequestMapping("typeGood")
    public String typeGood(GoodInputView goodInputView, Model model){
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(goodInputView));
            PageBean pageBean = goodService.getGoodTypes(goodInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Goods/GoodsTypeSettings";
    }

    /**
     * 获取商品类型的数据列表
     * @param goodInputView
     * @return
     */
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

    /**
     * 根据商品类型的ID, 查询商品类型的详情
     * @param goodTypeId
     * @return
     */
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

    /**
     * 增加或者修改会员的信息的保存
     * @param goodType
     * @return
     */
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

    /**
     * 显示商品设置的界面
     * @param model
     * @return
     */
    @RequestMapping("settingGood")
    public String settingGood(Model model){
        model.addAttribute("goodTypeNames", goodService.getGoodTypeNames());
        return "Goods/GoodsSettings";
    }

    /**
     * 保存或者更新商品的信息, 包括商品的图片上传
     * @param goodInfo
     * @param multipartRequest
     * @return
     */
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

    /**
     * 根据商品ID, 显示商品详情页面
     * @param goodId
     * @param model
     * @return
     */
    @RequestMapping("viewGood")
    public String viewGood(Integer goodId, Model model){
        model.addAllAttributes(JsonUtils.fromJsonDF(goodService.getGoodInfo(goodId)));
        model.addAttribute("goodTypeNames", goodService.getGoodTypeNames());
        return "Goods/GoodsViews";
    }

    /**
     * 显示商品的进销存管理列表
     * @param goodInputView
     * @param model
     * @return
     */
    @RequestMapping(value = "getGoods")
    public String getGoods(GoodInputView goodInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(goodInputView));
            model.addAttribute("goodTypeNames", goodService.getGoodTypeNames());
            PageBean pageBean = goodService.getGoods(goodInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Goods/GoodsList";
    }

    /**
     * 添加商品的库存
     * @param goodInfo
     * @return
     */
    @ResponseBody
    @RequestMapping("addGoodCount")
    public ResponseBean addGoodCount(GoodInfo goodInfo){
        try {
            UserOperator userOperator = super.getUserInfo();
            goodInfo.setSalesId(userOperator.getId());
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

    /**
     * 损耗商品的库存
     * @param goodInfo
     * @return
     */
    @ResponseBody
    @RequestMapping("minusGoodCount")
    public ResponseBean minusGoodCount(GoodInfo goodInfo){
        try {
            UserOperator userOperator = super.getUserInfo();
            goodInfo.setSalesId(userOperator.getId());
            goodService.minusGoodCount(goodInfo);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    /**
     * 商品的上架和下架
     * @param goodId
     * @param up
     * @return
     */
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

    /**
     * 显示商品的销售列表
     * @param goodInputView
     * @param model
     * @return
     */
    @RequestMapping(value = "getGoodsMarket")
    public String getGoodsMarket(GoodInputView goodInputView, Model model) {
        try {
            model.addAttribute("goodTypeNames", goodService.getGoodTypeNames());
            model.addAttribute("goods", goodService.getGoodsMarket(goodInputView));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Goods/GoodsMarket";
    }

    /**
     * 添加商品到购物车
     * @param goodShopping
     * @param amount
     * @return
     */
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

    /**
     * 购物车中移除商品
     * @param shoppingId
     * @return
     */
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

    /**
     * 显示当前购物车列表
     * @param model
     * @return
     */
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

    /**
     * 显示商品库存变化明细记录
     * @return
     */
    @RequestMapping(value = "getGoodsStockDetails")
    public String getGoodsStockDetails(GoodInputView goodInputView, Model model) {
    	try {
            model.addAllAttributes(JsonUtils.fromJsonDF(goodInputView));
            PageBean pageBean = goodService.getGoodsStockDetails(goodInputView);
            super.setPageInfo(model, pageBean);
            //model.addAttribute("allCount", goodService.getGoodOutInfo(goodInputView));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Goods/GoodStockDetails";
    }
    
    @ResponseBody
    @RequestMapping("calculateShoppingMoney")
    public ResponseBean calculateShoppingMoney(GoodInputView goodInputView){
    	try {
            goodInputView.setSalesId(super.getUserInfo().getId());
            return new ResponseBean(goodService.calculateShoppingMoney(goodInputView));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }
    
    @ResponseBody
    @RequestMapping("saveOrder")
    public ResponseBean saveOrder(GoodInputView goodInputView, OrderInfo orderInfo){
    	try {
    		goodInputView.setSalesId(super.getUserInfo().getId());
            Map<String, Object> data = new HashMap<String, Object>();
            goodInputView.setOrderInfo(orderInfo);
            data.put("orderId", goodService.saveOrder(goodInputView));
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
    @RequestMapping("confirmOrder")
    public ResponseBean confirmOrder(OrderInfo orderInfo){
    	try {
            goodService.updateConfirmOrder(orderInfo);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    @RequestMapping(value = "getGoodsStock")
    public String getGoodsStock(GoodInputView goodInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(goodInputView));
            PageBean pageBean = goodService.countGoodsStock(goodInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Goods/GoodsStockManagement";
    }
    
}
