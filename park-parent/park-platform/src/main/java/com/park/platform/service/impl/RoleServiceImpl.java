package com.park.platform.service.impl;

import com.park.common.bean.PageBean;
import com.park.common.bean.RoleInputView;
import com.park.common.bean.out.MenuOutputView;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.*;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.platform.dao.IBaseDao;
import com.park.platform.service.IMenuService;
import com.park.platform.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return baseDao.getToEvict(SystemRole.class, roleId);
	}
	
	@Override
	public List<Map<String, Object>> getRoleNames(int minRoleId){
		return baseDao.queryBySql("SELECT roleId, roleName FROM system_role WHERE roleId > ? ORDER BY roleLevel", minRoleId);
	}

	@Override
	public PageBean getRoles(RoleInputView roleInputView){
		String status = roleInputView.getStatus();
		StringBuilder headSql = new StringBuilder("SELECT roleId, roleName, roleStatus, roleDescribe, uo.operatorName, sr.createTime");
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
		
		resultMap.put("role", getSystemRole(roleId));
		List<SystemMenu> systemMenus = getRoleMenus(roleId);
		List<String> menuIds = new ArrayList<String>();
		if(systemMenus != null && systemMenus.size() > 0){
			for(SystemMenu systemMenu : systemMenus){
				menuIds.add(systemMenu.getMenuId().toString());
			}
		}
		resultMap.put("menuIds", StrUtil.join(menuIds.toArray(), ","));
		/*List<MenuOutputView> menuOutputViews = new ArrayList<MenuOutputView>();
		resultMap.put("roleMenuList", getRoleMenu(menuOutputViews, 0));*/
		return resultMap;
	}
	
	@Override
	public List<SystemMenu> getRoleMenus(int roleId){
		return baseDao.queryByHql("SELECT sm FROM SystemMenu sm, SystemRoleMenu srm WHERE sm.menuId = srm.id.menuId AND parentMenuId != 0 AND srm.id.roleId = ?", roleId);
	}

	@Override
	public Integer saveRole(SystemRole systemRole, String menuIds){
		
		Integer roleId = systemRole.getRoleId();
		String nowDate = DateUtil.getNowDate();
		if(systemRole.getRoleId() != null){
			SystemRole systemRoleDB = getSystemRole(systemRole.getRoleId());
			if(IDBConstant.LOGIC_STATUS_YES.equals(systemRoleDB.getReadOnly())) throw new MessageException("操作错误，只读");
			systemRoleDB.setRoleDescribe(systemRole.getRoleDescribe());
			systemRoleDB.setRoleLevel(systemRole.getRoleLevel());
			systemRoleDB.setRoleName(systemRole.getRoleName());
			systemRoleDB.setRoleStatus(systemRole.getRoleStatus());
			systemRoleDB.setSalesId(systemRole.getSalesId());
			systemRoleDB.setUpdateTime(nowDate);
			baseDao.save(systemRoleDB, roleId);
		}else{
			systemRole.setCreateTime(nowDate);
			systemRole.setReadOnly(IDBConstant.LOGIC_STATUS_NO);
			baseDao.save(systemRole, null);
			roleId = systemRole.getRoleId();
		}
		//先删除全部角色菜单
		baseDao.delete("system_role_menu", "roleId", roleId);
		if(StrUtil.isNotBlank(menuIds)){
			String menuArr[] = menuIds.split(",");
			for(String menuId : menuArr){
				baseDao.save(new SystemRoleMenu(new SystemRoleMenuId(roleId, StrUtil.objToInt(menuId))), null);
			}
		}
		return roleId;		
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



