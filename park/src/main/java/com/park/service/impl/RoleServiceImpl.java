package com.park.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.PageBean;
import com.park.common.bean.RoleInputView;
import com.park.common.bean.out.MenuOutputView;
import com.park.common.po.SystemMenu;
import com.park.common.po.SystemRole;
import com.park.common.po.SystemRoleOperator;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMenuService;
import com.park.service.IRoleService;

@Service
public class RoleServiceImpl extends BaseService implements IRoleService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMenuService menuService;
	
	@Override
	public SystemRoleOperator getOperatorRole(String operatorId){
		return baseDao.queryByHqlFirst("FROM SystemRoleOperator WHERE id.operatorId = ?", operatorId);
	}
	
	@Override
	public SystemRole getSystemRole(int roleId){
		return baseDao.queryByHqlFirst("FROM SystemRole WHERE roleId = ?", roleId);
	}
	
	@Override
	public List<Map<String, Object>> getRoleNames(int minRoleId){
		return baseDao.queryBySql("SELECT roleId, roleName FROM system_role WHERE roleId >= ? ORDER BY roleLevel", minRoleId);
	}
	
	@Override
	public PageBean getRoles(RoleInputView roleInputView){
		String status = roleInputView.getStatus();
		StringBuilder headSql = new StringBuilder("SELECT roleId, roleName, roleStatus, roleDescribe, operatorName, sr.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM system_role sr, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE sr.salesId = uo.id AND roleId >= :minRoleId");
		if(StrUtil.isNotBlank(status)){
			whereSql.append(" AND roleStatus = :status");
		}
		whereSql.append(" ORDER BY sr.roleLevel");
		return super.getPageBean(headSql, bodySql, whereSql, roleInputView);
	}
	
	@Override
	public Map<String, Object> getRolesView(int roleId){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<MenuOutputView> menuOutputViews = new ArrayList<MenuOutputView>();
		
		resultMap.put("role", getSystemRole(roleId));
		resultMap.put("roleMenuList", getRoleMenu(menuOutputViews, 0));
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getAllRoles(int roleId){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<MenuOutputView> menuOutputViews = new ArrayList<MenuOutputView>();

		resultMap.put("roleMenuList", getRoleMenu(menuOutputViews, roleId));
		return resultMap;
	} 
	
	//相同1【支持无限级】
	private List<MenuOutputView> getRoleMenu(List<MenuOutputView> menuOutputViews, int parentId){
		List<SystemMenu> menus = menuService.getMenusByParentId(parentId); //查询子菜单
		if(menus != null && menus.size() > 0){
			List<MenuOutputView> childrenmenuOutputViews = new ArrayList<MenuOutputView>();
			for(SystemMenu systemMenu : menus){
				MenuOutputView menuOutputView = new MenuOutputView();
				menuOutputView.setText(systemMenu.getMenuName());
				menuOutputView.setId(systemMenu.getMenuId().toString());
				if(parentId == systemMenu.getParentMenuId()){ //全部查询菜单出来List，这里加一句这个就搞定
					List<MenuOutputView> roleMenu = getRoleMenu(menuOutputViews, systemMenu.getMenuId());
					menuOutputView.setChildren(roleMenu);
					childrenmenuOutputViews.add(menuOutputView);
				}
			}
			return childrenmenuOutputViews;
		}
		return null; 
	}
	
}



