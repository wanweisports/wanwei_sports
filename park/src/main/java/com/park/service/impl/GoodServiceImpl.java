package com.park.service.impl;

import java.io.IOException;
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
import com.park.common.po.GoodShopping;
import com.park.common.po.GoodType;
import com.park.common.util.DateUtil;
import com.park.common.util.FileUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IGoodService;

@Service
public class GoodServiceImpl extends BaseService implements IGoodService {

	@Autowired
	private IBaseDao baseDao;
	
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
			sql.append(" AND goodType = :goodType");
		}
		goodInputView.setGoodStatus(IDBConstant.GOOD_STATE_ING);
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(goodInputView));
	}
	
	@Override
	public List<Map<String, Object>> getGoodsCart(int salesId){
		return baseDao.queryBySql("SELECT gi.goodId, gi.goodNo, gi.goodName, gi.goodPrice, gsi.shoppingGoodAmount FROM good_info gi, good_shopping gsi WHERE gi.goodId = gsi.goodId AND gsi.salesId = ?", salesId);
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
			goodShoppingDB.setShoppingGoodAmount(goodShoppingDB.getShoppingGoodAmount()+amount);
			goodShoppingDB.setUpdateTime(nowDate);
			baseDao.save(goodShoppingDB, goodId);
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
	
}





