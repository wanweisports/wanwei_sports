package com.park.platform.service.impl;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.*;
import com.park.common.util.*;
import com.park.platform.dao.IBaseDao;
import com.park.platform.service.IDataService;
import com.park.platform.service.IGoodService;
import com.park.platform.service.IMemberService;
import com.park.platform.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GoodServiceImpl extends BaseService implements IGoodService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IDataService dataService;
	
	@Override
	public Integer saveGood(GoodInfo goodInfo, MultipartHttpServletRequest multipartRequest) throws IOException {
		Integer goodId = goodInfo.getGoodId();
		String nowDate = DateUtil.getNowDate();
		if(goodId == null){ //添加
			 //商品的预售和在售   商品刚添加完就是预售状态   上架后就是在售状态  下架后又是预售状态
			if(goodInfo.getGoodCount() == null || goodInfo.getGoodCount() <= 0){
				goodInfo.setGoodCount(0);
				goodInfo.setGoodStatus(IDBConstant.GOOD_STATE_BOOKING); //新：库存小于等于0
			}else{
				goodInfo.setGoodStatus(IDBConstant.GOOD_STATE_ING); //新：库存大于等于0
			}
			goodInfo.setCreateTime(nowDate);
			baseDao.save(goodInfo, null);
			goodId = goodInfo.getGoodId();
			
			//新建商品-库存日志
			GoodInventoryLog inventoryLog = new GoodInventoryLog();
			inventoryLog.setCountChange(goodInfo.getGoodCount());
			inventoryLog.setGoodId(goodId);
			inventoryLog.setOpType(IDBConstant.INVENTORY_OP_TYPE_ADD);
			inventoryLog.setRemark("新商品初始化库存" + goodInfo.getGoodCount());
			inventoryLog.setSalesId(goodInfo.getSalesId());
			inventoryLog.setCreateTime(nowDate);
			baseDao.save(inventoryLog, null);
			
		}else{ //修改
			GoodInfo goodInfoDB = getGoodInfo(goodId);
			if(goodInfoDB == null) throw new MessageException("商品信息不存在！");
			goodInfoDB.setGoodName(goodInfo.getGoodName());
			goodInfoDB.setGoodPrice(goodInfo.getGoodPrice());
			goodInfoDB.setGoodDiscount(goodInfo.getGoodDiscount());
			goodInfoDB.setGoodRemark(goodInfo.getGoodRemark());
			goodInfoDB.setGoodMoneyType(goodInfo.getGoodMoneyType()); //计费方式
			goodInfoDB.setUpdateTime(nowDate);
			goodInfoDB.setSalesId(goodInfo.getSalesId());
			baseDao.save(goodInfoDB, goodInfoDB.getGoodId());
			goodId = goodInfoDB.getGoodId();
		}
		List<MultipartFile> multipartFiles = FileUtil.getMultipartFiles(multipartRequest);
		if(multipartFiles.size() > 0){ //保存商品图片
			GoodInfo goodInfoDB = getGoodInfo(goodId);
			goodInfoDB.setGoodPic(FileUtil.saveFile(multipartFiles.get(0), multipartRequest).toString());
			baseDao.save(goodInfoDB, goodInfoDB.getGoodId());
		}
		return goodId;
	}

	@Override
	public PageBean getGoods(GoodInputView goodInputView){
		String goodTypeId = goodInputView.getGoodType();
		String goodName = goodInputView.getGoodName();
		String goodStatus = goodInputView.getGoodStatus();
		
		StringBuilder headSql = new StringBuilder("SELECT goodId, goodNo, goodName, goodCount, goodPrice, goodDiscount, goodStatus, operatorName, gi.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM good_info gi, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE gi.salesId = uo.id");
		if(StrUtil.isNotBlank(goodName)){
			whereSql.append(" AND goodName = :goodName");
		}
		if(StrUtil.isNotBlank(goodStatus)){
			whereSql.append(" AND goodStatus = :goodStatus");
		}
		if(StrUtil.isNotBlank(goodTypeId)){
			whereSql.append(" AND goodTypeId = :goodType");
		}
        whereSql.append(" ORDER BY gi.createTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, goodInputView);
	}
	
	@Override
	public GoodInfo getGoodInfo(int goodId) {
		return baseDao.getToEvict(GoodInfo.class, goodId);
	}
	
	@Override
	public void addGoodCount(GoodInfo goodInfo){
		GoodInfo goodInfoDB = this.getGoodInfo(goodInfo.getGoodId());
		if(goodInfoDB == null) throw new MessageException("商品信息不存在！");
		goodInfoDB.setGoodCount(goodInfoDB.getGoodCount()+goodInfo.getGoodCount());
		//有库存：在售
		//if(IDBConstant.GOOD_STATE_BOOKING.equals(goodInfoDB.getGoodStatus()) && goodInfoDB.getGoodCount() > 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_ING);
		baseDao.save(goodInfoDB, goodInfoDB.getGoodId());
		
		//入库商品-库存日志
		GoodInventoryLog inventoryLog = new GoodInventoryLog();
		inventoryLog.setCountChange(goodInfo.getGoodCount());
		inventoryLog.setGoodId(goodInfo.getGoodId());
		inventoryLog.setOpType(IDBConstant.INVENTORY_OP_TYPE_IN);
		inventoryLog.setRemark("商品增加库存" + goodInfo.getGoodCount());
		inventoryLog.setSalesId(goodInfo.getSalesId());
		inventoryLog.setCreateTime(DateUtil.getNowDate());
		baseDao.save(inventoryLog, null);
	}

	@Override
	public void minusGoodCount(GoodInfo goodInfo){
		GoodInfo goodInfoDB = this.getGoodInfo(goodInfo.getGoodId());
		if(goodInfoDB == null) throw new MessageException("商品信息不存在！");
		int minus = goodInfoDB.getGoodCount() - goodInfo.getGoodCount();
        if(minus < 0) throw new MessageException("损耗数量超过当前库存量！");
		goodInfoDB.setGoodCount(minus);
		//有库存：在售
		//if(IDBConstant.GOOD_STATE_BOOKING.equals(goodInfoDB.getGoodStatus()) && goodInfoDB.getGoodCount() > 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_ING);
		if (minus == 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_BOOKING);
        baseDao.save(goodInfoDB, goodInfoDB.getGoodId());

		//入库商品-库存日志
		GoodInventoryLog inventoryLog = new GoodInventoryLog();
		inventoryLog.setCountChange(0 - goodInfo.getGoodCount());
		inventoryLog.setGoodId(goodInfo.getGoodId());
		inventoryLog.setOpType(IDBConstant.INVENTORY_OP_TYPE_MINUS);
		inventoryLog.setRemark("商品损耗库存" + goodInfo.getGoodCount());
		inventoryLog.setSalesId(goodInfo.getSalesId());
		inventoryLog.setCreateTime(DateUtil.getNowDate());
		baseDao.save(inventoryLog, null);
	}
	
	@Override
	public void updateGoodInOrOut(int goodId, boolean up){
		GoodInfo goodInfoDB = this.getGoodInfo(goodId);
		if(goodInfoDB == null) throw new MessageException("商品信息不存在！");
		if(!up){ //下架[变为预售]
			goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_BOOKING);
		}else{
			//有库存：在售
			if(goodInfoDB.getGoodCount() > 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_ING);
			//无库存：报错提示无库存不能上架
			//if(goodInfoDB.getGoodCount() <= 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_BOOKING);
			else throw new MessageException("当前库存为0，不能上架");
		}
		baseDao.save(goodInfoDB, goodInfoDB.getGoodId());
	}
	
	public String getGoodNo() {
		do {
			StringBuffer no = new StringBuffer("GD");
			for(int i = 0; i < 6; i++){
				no.append((int)(Math.random()*10));
			}
			if(baseDao.getUniqueResult("SELECT 1 FROM good_info WHERE goodNo = ?", no) == null) return no.toString(); 
		} while (true);
	}
	
	@Override
	public List<Map<String, Object>> getGoodsMarket(GoodInputView goodInputView){
		String goodType = goodInputView.getGoodType();
		
		StringBuilder sql = new StringBuilder("SELECT goodId, goodName, goodPic, goodPrice FROM good_info");
		sql.append(" WHERE goodStatus = :goodStatus");
		if(StrUtil.isNotBlank(goodType)){
			sql.append(" AND goodTypeId = :goodType");
		}
		goodInputView.setGoodStatus(IDBConstant.GOOD_STATE_ING);
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(goodInputView));
	}
	
	@Override
	public String getGoodsCartCount(int salesId){
        List<Map<String, Object>> list = baseDao.queryBySql("SELECT SUM(shoppingGoodAmount) cartCount FROM good_shopping WHERE salesId = ?", salesId);

        return StrUtil.objToStr(list.get(0).get("cartCount"));
	}

    @Override
    public List<Map<String, Object>> getGoodsCart(int salesId){
        return baseDao.queryBySql("SELECT gi.goodId, gi.goodPic, gi.goodNo, gi.goodName, gi.goodPrice, gsi.shoppingId, gsi.shoppingGoodAmount, ROUND(gi.goodPrice*gsi.shoppingGoodAmount, 2) goodTotal FROM good_info gi, good_shopping gsi WHERE gi.goodId = gsi.goodId AND gsi.salesId = ?", salesId);
    }
	
	@Override
	public Integer saveGoodShopping(GoodShopping goodShopping, int amount){
		Integer goodId = goodShopping.getGoodId();
		if(goodId == null) throw new MessageException("参数错误：goodId");
		GoodInfo goodInfo = getGoodInfo(goodId);
		if(goodInfo == null) throw new MessageException("商品不存在");
		goodShopping.setShoppingName(goodInfo.getGoodName());
		GoodShopping goodShoppingDB = getGoodShoppingByGood(goodId, goodShopping.getSalesId());
		String nowDate = DateUtil.getNowDate();
		if(goodShoppingDB == null){
			goodShopping.setShoppingGoodAmount(1);
			goodShopping.setCreateTime(nowDate);
			baseDao.save(goodShopping, null);
			return goodShopping.getShoppingId();
		}else{
			int addAmount = goodShoppingDB.getShoppingGoodAmount() + amount;
			if(addAmount > 0){
				goodShoppingDB.setShoppingGoodAmount(addAmount);
				goodShoppingDB.setUpdateTime(nowDate);
				baseDao.save(goodShoppingDB, goodId);
			}
			return goodShoppingDB.getShoppingId();
		}
	}
	
	@Override
	public void deleteCart(int shoppingId, int salesId){
		GoodShopping goodShopping = getGoodShopping(shoppingId, salesId);
		if(goodShopping == null) throw new MessageException("该购物商品不存在");
		baseDao.delete(goodShopping);
	}
	
	@Override
	public GoodShopping getGoodShoppingByGood(int goodId, int salesId){
		return baseDao.queryByHqlFirst("FROM GoodShopping WHERE goodId = ? AND salesId = ?", goodId, salesId);
	}
	
	@Override
	public GoodShopping getGoodShopping(int shoppingId, int salesId){
		return baseDao.queryByHqlFirst("FROM GoodShopping WHERE shoppingId = ? AND salesId = ?", shoppingId, salesId);
	}
	
	@Override
	public List<Map<String, Object>> getGoodTypeNames(){
		return baseDao.queryBySql("SELECT goodTypeId, goodTypeName FROM good_type WHERE goodTypeStatus = ?", IDBConstant.LOGIC_STATUS_YES);
	}
	
	@Override
	public PageBean getGoodTypes(GoodInputView goodInputView){
		StringBuilder headSql = new StringBuilder("SELECT goodTypeId, goodTypeName, goodTypeDescribe, gt.createTime, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM good_type gt, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE gt.salesId = uo.id");
		return super.getPageBean(headSql, bodySql, whereSql, goodInputView);
	}
	
	@Override
	public Integer saveGoodType(GoodType goodType){
		String nowDate = DateUtil.getNowDate();
		Integer goodTypeId = goodType.getGoodTypeId();
		String goodTypeStatus = goodType.getGoodTypeStatus() == null ? IDBConstant.LOGIC_STATUS_YES : goodType.getGoodTypeStatus();
		if(goodTypeId == null){
			goodType.setCreateTime(nowDate);
			goodType.setGoodTypeStatus(goodTypeStatus);
			baseDao.save(goodType, null);
			return goodType.getGoodTypeId();
		}else{
			GoodType goodTypeDB = getGoodType(goodTypeId);
			if(goodTypeDB == null) throw new MessageException("商品类型不存在");
			goodTypeDB.setGoodTypeName(goodType.getGoodTypeName());
			goodTypeDB.setGoodTypeDescribe(goodType.getGoodTypeDescribe());
			goodTypeDB.setGoodTypeStatus(goodTypeStatus);
			goodTypeDB.setUpdateTime(nowDate);
			baseDao.save(goodTypeDB, goodTypeId);
			return goodTypeId;
		}
	}
	
	@Override
	public GoodType getGoodType(int goodTypeId){
		return baseDao.getToEvict(GoodType.class, goodTypeId);
	}
	
	@Override
	public Map<String, Object> calculateShoppingMoney(GoodInputView goodInputView){
		List<GoodShopping> shoppingList = getShoppings(goodInputView.getShoppingIds(), goodInputView.getSalesId());

		double memberDiscount = memberService.getMemberDiscount(goodInputView.getMemberId(), goodInputView.getOpType());
		
		Double originalPriceSum = 0.0; //原价
		for(GoodShopping goodShopping : shoppingList){
			GoodInfo goodInfo = getGoodInfo(goodShopping.getGoodId());
			originalPriceSum += (goodInfo.getGoodPrice() * goodShopping.getShoppingGoodAmount());
		}
		
		Double presentPriceSum = originalPriceSum * (memberDiscount/100); //打折后的价格
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("originalPrice", originalPriceSum);
		resultMap.put("presentPrice", presentPriceSum);
		resultMap.put("memberDiscount", memberDiscount);
		return resultMap;
	}

	private List<GoodShopping> getShoppings(String shoppingIds, int salesId) {
		Map<String, Object> paramMap = SQLUtil.getInToSQL("shoppingIds", shoppingIds);
		paramMap.put("salesId", salesId);
		List<GoodShopping> shoppingList = baseDao.queryByHql("FROM GoodShopping WHERE shoppingId IN(:shoppingIds) AND salesId = :salesId", paramMap);
		return shoppingList;
	}
	
	@Override
	public Integer saveOrder(GoodInputView goodInputView){
		List<GoodShopping> shoppingList = getShoppings(goodInputView.getShoppingIds(), goodInputView.getSalesId());
		if(shoppingList.size() == 0) throw new MessageException("请选择购物车商品");
		OrderInfo orderInfo = goodInputView.getOrderInfo();
		orderInfo.setOrderServiceType(IDBConstant.ORDER_SERVICE_TYPE_GOODS);
		orderInfo.setOrderStatus(IDBConstant.LOGIC_STATUS_NO); //未完成
		orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_NO); //未支付
		orderInfo.setSalesId(goodInputView.getSalesId());
		UserMember member = null;
		if(IDBConstant.LOGIC_STATUS_YES.equals(goodInputView.getOpType())){
			member = memberService.getUserMember(goodInputView.getMemberId());
			orderInfo.setMemberId(member.getMemberId());
		}else{
			orderInfo.setMemberId(0); //散客
			orderInfo.setName(goodInputView.getName());
			orderInfo.setMobile(goodInputView.getMobile());
		}
		Map<String, Object> priceMap = calculateShoppingMoney(goodInputView); //计算价格
		orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("originalPrice")));
		orderInfo.setOrderDiscount(StrUtil.objToInt(priceMap.get("memberDiscount"))); //折扣
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		
		for(GoodShopping goodShopping : shoppingList){
			GoodInfo goodInfo = getGoodInfo(goodShopping.getGoodId());
			//查看库存是否够
			Integer shoppingGoodAmount = goodShopping.getShoppingGoodAmount();
			Integer goodCount = goodInfo.getGoodCount();
			if(shoppingGoodAmount > goodCount) throw new MessageException(goodInfo.getGoodName()+"库存不够，目前库存"+goodCount+"，购买数量"+shoppingGoodAmount);
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setItemId(goodInfo.getGoodId());
			orderDetail.setItemPrice(goodInfo.getGoodPrice()*shoppingGoodAmount);
			orderDetail.setItemMoneyType(goodInfo.getGoodMoneyType());
			orderDetail.setItemName(goodInfo.getGoodName());
			orderDetail.setItemAmount(shoppingGoodAmount);
			orderDetail.setOrderDetailStatus(IDBConstant.LOGIC_STATUS_NO);
			orderDetails.add(orderDetail);
			//购买后，删除购物车的商品
			baseDao.delete(goodShopping);
		}
		
		Integer orderId = orderService.saveOrderInfo(orderInfo, orderDetails);
		
		return orderId;
	}
	
	@Override
	public void updateConfirmOrder(OrderInfo orderInfo, String memberCardPay) throws Exception{
		if(orderInfo.getOrderId() == null) throw new MessageException("订单id为空");
        orderInfo.setOrderStatus(IDBConstant.LOGIC_STATUS_YES); //商品支付后，直接已完成
		orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_YES); //商品支付后，直接已完成
		Integer orderId = orderService.updateConfirmOrder(orderInfo, memberCardPay);
		baseDao.updateBySql("UPDATE order_detail SET orderDetailStatus = ? WHERE orderId = ?", IDBConstant.LOGIC_STATUS_YES, orderId);
		
		List<OrderDetail> orderDetails = orderService.getOrderDetails(orderId);
		if(orderDetails != null && orderDetails.size() > 0){
			for(OrderDetail orderDetail : orderDetails){
				GoodInfo goodInfo = getGoodInfo(orderDetail.getItemId());
				//入库商品-库存日志
				GoodInventoryLog inventoryLog = new GoodInventoryLog();
				inventoryLog.setCountChange(0 - orderDetail.getItemAmount());
				inventoryLog.setGoodId(goodInfo.getGoodId());
				inventoryLog.setOpType(IDBConstant.INVENTORY_OP_TYPE_OUT);
				inventoryLog.setSalesId(goodInfo.getSalesId());
				inventoryLog.setRemark("商品销售库存" + orderDetail.getItemAmount());
				inventoryLog.setCreateTime(DateUtil.getNowDate());
				baseDao.save(inventoryLog, null);

                //购买后，库存减少
                goodInfo.setGoodCount(goodInfo.getGoodCount() - orderDetail.getItemAmount());
                baseDao.save(goodInfo, goodInfo.getGoodId());
			}
		}
	}
	
	@Override
	public PageBean getGoodsStockDetails(GoodInputView goodInputView){
		
		Integer countNum = goodInputView.getCountNum();
		String createTimeStart = goodInputView.getCreateTimeStart();
		String createTimeEnd = goodInputView.getCreateTimeEnd();
		String goodNo = goodInputView.getGoodNo();
		
		StringBuilder headSql = new StringBuilder("SELECT gi.goodNo, gi.goodName, log.opType, log.countChange, log.remark, uo.operatorName, log.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM good_inventory_log log, good_info gi, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE log.goodId = gi.goodId AND log.salesId = uo.id");

		if(StrUtil.isNotBlank(goodNo)){
			whereSql.append(" AND gi.goodNo = :goodNo");
		}
		if(StrUtil.isNotBlank(createTimeStart)){
			whereSql.append(" AND DATE(log.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			whereSql.append(" AND DATE(log.createTime) <= :createTimeEnd");
		}

		whereSql.append(dataService.getCountSql(countNum, "log.createTime"));
		whereSql.append(" ORDER BY log.createTime DESC");

		return super.getPageBean(headSql, bodySql, whereSql, goodInputView);
	}
	
	@Override
	public List<Map<String, Object>> getGoodOutInfo(GoodInputView goodInputView){
		
		Integer countNum = goodInputView.getCountNum();
		String createTimeStart = goodInputView.getCreateTimeStart();
		String createTimeEnd = goodInputView.getCreateTimeEnd();
		String goodNo = goodInputView.getGoodNo();
		
		StringBuilder sql = new StringBuilder("SELECT gt.goodTypeName, SUM(log.countChange) count FROM good_type gt");
		sql.append(" LEFT JOIN good_info gi ON(gi.goodTypeId = gt.goodTypeId)");
		sql.append(" LEFT JOIN good_inventory_log log ON(log.goodId = gi.goodId AND log.opType = ").append(IDBConstant.INVENTORY_OP_TYPE_OUT);
		
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(log.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(log.createTime) <= :createTimeEnd");
		}

		sql.append(dataService.getCountSql(countNum, "log.createTime"));
		
		sql.append(") WHERE 1=1");
		if(StrUtil.isNotBlank(goodNo)){
			sql.append(" AND gi.goodNo = :goodNo");
		}
		sql.append(" GROUP BY gt.goodTypeId");
		List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(goodInputView));
		int sumCount = 0;
		for(Map<String, Object> map : list){
			if(map.get("count") != null){
				sumCount += StrUtil.objToInt(map.get("count"));
			} else {
				map.put("count", 0);
			}
		}
		Map sumMap = new HashMap();
		sumMap.put("goodTypeName", "全部类别");
		sumMap.put("count", sumCount);
		list.add(0, sumMap);
		return list;
	}

    /*@Override
    public PageBean countGoodsStock(GoodInputView goodInputView){
        String goodNo = goodInputView.getGoodNo();
        String goodName = goodInputView.getGoodName();

        StringBuilder headSql = new StringBuilder("SELECT gi.goodId, goodNo, goodName, goodCount, goodPrice, operatorName, gi.createTime, SUM(log.countChange) countGoods, log.opType");
        StringBuilder bodySql = new StringBuilder(" FROM good_info gi INNER JOIN user_operator uo ON gi.salesId = uo.id");
        bodySql.append(" LEFT JOIN good_inventory_log log ON log.goodId = gi.goodId");
        StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
        if(StrUtil.isNotBlank(goodNo)){
            whereSql.append(" AND goodNo = :goodNo");
        }
        if(StrUtil.isNotBlank(goodName)){
            whereSql.append(" AND goodName = :goodName");
        }
        whereSql.append("  GROUP BY gi.goodId, log.opType ORDER BY gi.createTime DESC");
        return super.getPageBean(headSql, bodySql, whereSql, goodInputView);
    }*/

    @Override
    public List<Map<String, Object>> countGoodsStock(GoodInputView goodInputView){
        Integer countNum = goodInputView.getCountNum();
        String goodNo = goodInputView.getGoodNo();
        String goodName = goodInputView.getGoodName();
        String createTimeStart = goodInputView.getCreateTimeStart();
        String createTimeEnd = goodInputView.getCreateTimeEnd();

        StringBuilder sql = new StringBuilder("SELECT gi.goodId, goodNo, goodName, goodCount, ROUND(goodPrice*SUM(log.countChange), 2) goodTotal, goodPrice, operatorName, gi.createTime, SUM(log.countChange) countGoods, log.opType");
        sql.append(" FROM good_info gi INNER JOIN user_operator uo ON gi.salesId = uo.id");
        sql.append(" LEFT JOIN good_inventory_log log ON log.goodId = gi.goodId");
        sql.append(" WHERE 1=1");
        if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(log.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(log.createTime) <= :createTimeEnd");
        }
        if(StrUtil.isNotBlank(goodNo)){
            sql.append(" AND goodNo = :goodNo");
        }
        if(StrUtil.isNotBlank(goodName)){
            sql.append(" AND goodName = :goodName");
        }
        sql.append(dataService.getCountSql(countNum, "log.createTime"));
        sql.append("  GROUP BY gi.goodId, log.opType ORDER BY gi.createTime DESC");

        List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(goodInputView));
        Map gMap = new HashMap();
        List<Map<String, Object>> arrList = new ArrayList<Map<String, Object>>();
        int index = 0;

        Double goodTotal = 0.00;
        int typeIn = 0;
        int typeAdd = 0;
        int typeOut = 0;
        int typeMinus = 0;
        int goodCount = 0;

        for(Map<String, Object> map : list){
            String key = "good_" + map.get("goodId");

            if (gMap.get(key) != null) {
                int mapIndex = StrUtil.objToInt(gMap.get(key));

                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_ADD)) {
                    arrList.get(mapIndex).put("typeAdd", StrUtil.objToStr(map.get("countGoods")));
                    typeAdd += StrUtil.objToInt(map.get("countGoods"));
                }
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_IN)) {
                    arrList.get(mapIndex).put("typeIn", StrUtil.objToStr(map.get("countGoods")));
                    typeIn += StrUtil.objToInt(map.get("countGoods"));
                }
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_MINUS)) {
                    arrList.get(mapIndex).put("typeMinus", StrUtil.objToStr(map.get("countGoods")));
                    typeMinus += StrUtil.objToInt(map.get("countGoods"));
                }
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_OUT)) {
                    arrList.get(mapIndex).put("typeOut", StrUtil.objToStr(map.get("countGoods")));
                    typeOut += StrUtil.objToInt(map.get("countGoods"));
                    arrList.get(mapIndex).put("typeOutTotal", StrUtil.objToStr(map.get("goodTotal")));
                    goodTotal += StrUtil.objToDouble(map.get("goodTotal"));
                }
            } else {
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_ADD)) {
                    map.put("typeAdd", StrUtil.objToStr(map.get("countGoods")));
                    typeAdd += StrUtil.objToInt(map.get("countGoods"));
                }
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_IN)) {
                    map.put("typeIn", StrUtil.objToStr(map.get("countGoods")));
                    typeIn += StrUtil.objToInt(map.get("countGoods"));
                }
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_MINUS)) {
                    map.put("typeMinus", StrUtil.objToStr(map.get("countGoods")));
                    typeMinus += StrUtil.objToInt(map.get("countGoods"));
                }
                if (StrUtil.objToStr(map.get("opType")).equals(IDBConstant.INVENTORY_OP_TYPE_OUT)) {
                    map.put("typeOut", StrUtil.objToStr(map.get("countGoods")));
                    typeOut += StrUtil.objToInt(map.get("countGoods"));
                    map.put("typeOutTotal", StrUtil.objToStr(map.get("goodTotal")));
                    goodTotal += StrUtil.objToDouble(map.get("goodTotal"));
                }

                goodCount += StrUtil.objToInt(map.get("goodCount"));
                gMap.put(key, index);
                arrList.add(map);
                index++;
            }
        }
        Map totalMap = new HashMap();
        totalMap.put("goodCount", goodCount);
        totalMap.put("typeAdd", typeAdd);
        totalMap.put("typeIn", typeIn);
        totalMap.put("typeMinus", typeMinus);
        totalMap.put("typeOut", typeOut);
        totalMap.put("typeOutTotal", String.format("%.2f", goodTotal));
        totalMap.put("goodName", "商品合计");
        arrList.add(totalMap);

        return arrList;
    }
	
}





