package com.park.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.GoodInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.GoodInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IGoodService;

@Service
public class GoodServiceImpl extends BaseService implements IGoodService {

	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public Integer saveGood(GoodInfo goodInfo) {
		Integer goodId = goodInfo.getGoodId();
		String nowDate = DateUtil.getNowDate();
		if(goodId == null){ //添加
			//goodInfo.setGoodNo(getGoodNo()); //商品编号[手动输入]
			goodInfo.setGoodStatus(IDBConstant.GOOD_STATE_ING); //添加默认在售【有预售：再定】
			if(goodInfo.getGoodCount() == null){
				goodInfo.setGoodCount(0);
			}
			goodInfo.setCreateTime(nowDate);
			baseDao.save(goodInfo, null);
			return goodInfo.getGoodId();
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
			baseDao.save(goodInfo, goodInfoDB.getGoodId());
			return goodInfoDB.getGoodId();
		}
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
		baseDao.save(goodInfoDB, goodInfoDB.getGoodId());
	}
	
	@Override
	public void updateGoodInOrOut(int goodId, boolean up){
		GoodInfo goodInfoDB = this.getGoodInfo(goodId);
		if(goodInfoDB == null) throw new MessageException("商品信息不存在！");
		if(!up){ //下架
			goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_OUT);
		}else{
			//有库存：在售
			if(goodInfoDB.getGoodCount() > 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_ING);
			//无库存：预售
			if(goodInfoDB.getGoodCount() <= 0) goodInfoDB.setGoodStatus(IDBConstant.GOOD_STATE_BOOKING);
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
	
}
