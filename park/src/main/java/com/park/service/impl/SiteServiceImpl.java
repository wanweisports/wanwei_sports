package com.park.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.PageBean;
import com.park.common.bean.SiteInputView;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.SiteInfo;
import com.park.common.po.SiteSport;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.ISiteService;

@Service
public class SiteServiceImpl extends BaseService implements ISiteService {

	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public Integer saveSiteSport(SiteSport siteSport) {
		Integer sportId = siteSport.getSportId();
		String nowDate = DateUtil.getNowDate();
		if(sportId != null){ //修改
			SiteSport siteSportDB = this.getSiteSport(sportId);
			if(this.getSiteSport(sportId) == null) throw new MessageException("该场地类型不存在！");
			siteSportDB.setSportName(siteSport.getSportName());
			siteSportDB.setSportDeposit(siteSport.getSportDeposit());
			siteSportDB.setStartTime(siteSport.getStartTime());
			siteSportDB.setEndTime(siteSport.getEndTime());
			siteSportDB.setSportCustom(siteSport.getSportCustom());
			siteSportDB.setSportMoney(siteSport.getSportMoney());
			siteSportDB.setSportStatus(siteSport.getSportStatus());
			siteSportDB.setUpdateTime(nowDate);
			baseDao.save(siteSportDB, sportId);
			return siteSportDB.getSportId();
		}else{ //新增
			siteSport.setCreateTime(nowDate);
			baseDao.save(siteSport, null);
		}
		if(IDBConstant.LOGIC_STATUS_YES.equals(siteSport.getSportCustom())){
			//处理自定义时间价格（改为单独接口）
			
		}
		return siteSport.getSportId();
	}
	
	@Override
	public Integer saveSiteInfo(SiteInfo siteInfo) {
		Integer siteId = siteInfo.getSiteId();
		String nowDate = DateUtil.getNowDate();
		if(this.getSiteSport(siteInfo.getSiteType()) == null) throw new MessageException("该场地类型不存在！");
		if(siteId != null){ //修改
			SiteInfo siteInfoDB = this.getSiteInfo(siteId);
			if(this.getSiteInfo(siteId) == null) throw new MessageException("该场地不存在！");
			siteInfoDB.setSiteName(siteInfo.getSiteName());
			siteInfoDB.setSiteRemark(siteInfo.getSiteRemark());
			siteInfoDB.setSiteType(siteInfo.getSiteType());
			siteInfoDB.setSiteStatus(siteInfo.getSiteStatus());
			siteInfoDB.setUpdateTime(nowDate);
			baseDao.save(siteInfoDB, siteId);
			return siteInfoDB.getSiteId();
		}else{ //新增
			siteInfo.setSiteNo(getSiteNo());
			siteInfo.setCreateTime(nowDate);
			baseDao.save(siteInfo, null);
		}
		return siteInfo.getSiteId();
	}
	
	@Override
	public SiteSport getSiteSport(int sportId) {
		return baseDao.getToEvict(SiteSport.class, sportId);
	}
	
	@Override
	public SiteInfo getSiteInfo(int siteId) {
		return baseDao.getToEvict(SiteInfo.class, siteId);
	}
	
	@Override
	public Map<String, Object> getSiteInfoMap(int siteId) {
		return baseDao.queryBySqlFirst("SELECT si.*, ss.sportName FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId AND si.siteId = ?", siteId);
	}
	
	@Override
	public List<Map<String, Object>> getSiteNames(SiteInputView siteInputView) {
		String siteStatus = siteInputView.getSiteStatus();
		
		StringBuilder sql = new  StringBuilder("SELECT siteId, siteName, siteStatus FROM site_info WHERE 1=1");
		if(StrUtil.isNotBlank(siteStatus)){
			sql.append(" AND siteStatus = :siteStatus");
		}
		Map<String, Object> paramMap = JsonUtils.fromJson(siteInputView);
		return baseDao.queryBySql(sql.toString(), paramMap);
	}
	
	@Override
	public List<Map<String, Object>> getSiteSportNames(SiteInputView siteInputView) {
		String sportStatus = siteInputView.getSportStatus();
		
		StringBuilder sql = new  StringBuilder("SELECT sportId, sportName, sportStatus FROM site_sport WHERE 1=1");
		if(StrUtil.isNotBlank(sportStatus)){
			sql.append(" AND sportStatus = :sportStatus");
		}
		Map<String, Object> paramMap = JsonUtils.fromJson(siteInputView);
		return baseDao.queryBySql(sql.toString(), paramMap);
	}
	
	@Override
	public PageBean getSiteInfos(SiteInputView siteInputView) {
		Integer sportId = siteInputView.getSportId();
		String siteName = siteInputView.getSiteName();
		
		StringBuilder headSql = new StringBuilder("SELECT siteId, siteName, sportName, siteRemark, siteStatus, operatorName, si.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM site_info si, site_sport ss, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE si.siteType = ss.sportId AND si.salesId = uo.id");
		if(sportId != null){
			whereSql.append(" AND ss.sportId = :sportId");
		}
		if(StrUtil.isNotBlank(siteName)){
			whereSql.append(" AND si.siteName = :siteName");
		}
		return super.getPageBean(headSql, bodySql, whereSql, siteInputView);
	}
	
	@Override
	public PageBean getSiteSports(SiteInputView siteInputView) {
		StringBuilder headSql = new StringBuilder("SELECT sportId, sportName, sportMoney, sportDeposit, startTime, endTime, sportStatus, operatorName, ss.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM site_sport ss, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE ss.salesId = uo.id");
		return super.getPageBean(headSql, bodySql, whereSql, siteInputView);
	}
	
	@Override
	public List<Map<String, Object>> getSiteReservationInfo(SiteInputView siteInputView){
		
		return null;
	}
	
	private String getSiteNo() {
		do {
			StringBuffer no = new StringBuffer();
			for(int i = 0; i < 6; i++){
				no.append((int)(Math.random()*10));
			}
			if(baseDao.getUniqueResult("SELECT 1 FROM site_info WHERE siteNo = ?", no) == null) return no.toString(); 
		} while (true);
	}
	
}
