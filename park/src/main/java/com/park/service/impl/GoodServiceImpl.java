package com.park.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.GoodInfo;
import com.park.common.po.GoodInventoryLog;
import com.park.common.po.GoodShopping;
import com.park.common.po.GoodType;
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.po.UserMember;
import com.park.common.util.DateUtil;
import com.park.common.util.FileUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.SQLUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IDataService;
import com.park.service.IGoodService;
import com.park.service.IMemberService;
import com.park.service.IOrderService;

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
			goodInfoDB.setGoodCount(goodInfo.getGoodCount());
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
		inventoryLog.setRemark(goodInfo.getGoodRemark());
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
	public List<Map<String, Object>> getGoodsCart(int salesId){
		return baseDao.queryBySql("SELECT gi.goodId, gi.goodPic, gi.goodNo, gi.goodName, gi.goodPrice, gsi.shoppingId, gsi.shoppingGoodAmount FROM good_info gi, good_shopping gsi WHERE gi.goodId = gsi.goodId AND gsi.salesId = ?", salesId);
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
		}
		Map<String, Object> priceMap = calculateShoppingMoney(goodInputView); //计算价格
		orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("originalPrice")));
		orderInfo.setOrderDiscount(StrUtil.objToInt(priceMap.get("memberDiscount"))); //折扣
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		
		for(GoodShopping goodShopping : shoppingList){
			GoodInfo goodInfo = getGoodInfo(goodShopping.getGoodId());
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setItemId(goodInfo.getGoodId());
			orderDetail.setItemPrice(goodInfo.getGoodPrice()*goodShopping.getShoppingGoodAmount());
			orderDetail.setItemMoneyType(goodInfo.getGoodMoneyType());
			orderDetail.setItemName(goodInfo.getGoodName());
			orderDetail.setItemAmount(goodShopping.getShoppingGoodAmount());
			orderDetail.setOrderDetailStatus(IDBConstant.LOGIC_STATUS_NO);
			orderDetails.add(orderDetail);
			//购买后，删除购物车的商品
			baseDao.delete(goodShopping);
		}
		
		Integer orderId = orderService.saveOrderInfo(orderInfo, orderDetails);
		
		return orderId;
	}
	
	@Override
	public void updateConfirmOrder(OrderInfo orderInfo) throws Exception{
		if(orderInfo.getOrderId() == null) throw new MessageException("订单id为空");
		orderInfo.setOrderStatus(IDBConstant.LOGIC_STATUS_YES); //商品支付后，直接已完成
		Integer orderId = orderService.updateConfirmOrder(orderInfo);
		baseDao.updateBySql("UPDATE order_detail SET orderDetailStatus = ? WHERE orderId = ?", IDBConstant.LOGIC_STATUS_YES, orderId);
		
		List<OrderDetail> orderDetails = orderService.getOrderDetails(orderId);
		if(orderDetails != null && orderDetails.size() > 0){
			for(OrderDetail orderDetail : orderDetails){
				GoodInfo goodInfo = getGoodInfo(orderDetail.getItemId());
				//入库商品-库存日志
				GoodInventoryLog inventoryLog = new GoodInventoryLog();
				inventoryLog.setCountChange(orderDetail.getItemAmount());
				inventoryLog.setGoodId(goodInfo.getGoodId());
				inventoryLog.setOpType(IDBConstant.INVENTORY_OP_TYPE_OUT);
				inventoryLog.setSalesId(goodInfo.getSalesId());
				inventoryLog.setCreateTime(DateUtil.getNowDate());
				baseDao.save(inventoryLog, null);
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
			}
		}
		Map sumMap = new HashMap();
		sumMap.put("goodTypeName", "全部");
		sumMap.put("count", sumCount);
		list.add(0, sumMap);
		return list;
	}
	
}





