package com.park.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.MenuInputView;
import com.park.common.po.SystemMenu;
import com.park.common.po.SystemRoleOperator;
import com.park.dao.IBaseDao;
import com.park.service.IMenuService;
import com.park.service.IRoleService;

@Service
public class MenuServiceImpl extends BaseService implements IMenuService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IRoleService roleService;
	
	@Override
	public List<SystemMenu> getAllParentMens(){
		return baseDao.queryByHql("FROM SystemMenu WHERE parentMenuId = 0");
	}
	
	@Override
	public List<SystemMenu> getMenus(MenuInputView menuInputView){
		SystemRoleOperator operatorRole = roleService.getOperatorRole(menuInputView.getOperatorId());
		if(!super.isAdmin(menuInputView)) return getRoleMenuChilds((List)baseDao.queryByHql("SELECT sm FROM SystemMenu sm, SystemRoleMenu srm WHERE sm.menuId = srm.id.menuId AND parentMenuId != 0 AND srm.id.roleId = ?", operatorRole.getId().getRoleId()));
		else return getAdminMenuChilds((List)baseDao.queryByHql("FROM SystemMenu WHERE parentMenuId = 0"));
	}
	
	@Override
	public List<SystemMenu> getMenusByParentId(int parentId){ //查询子菜单
		return baseDao.queryByHql("FROM SystemMenu WHERE parentMenuId = ?", parentId);
	}
	
	@Override
	public SystemMenu getMenu(int menuId){
		return baseDao.getToEvict(SystemMenu.class, menuId);
	}
	
	private List<SystemMenu> getRoleMenuChilds(List<SystemMenu> menus){ //普通：根据子菜单，查询父菜单(子菜单相同的父菜单只查询一次)
		List<SystemMenu> parentMenus = new ArrayList<SystemMenu>();
		if(menus != null && menus.size() > 0){
			List<Integer> parentIds = new ArrayList<Integer>();
			for(SystemMenu systemMenu : menus){
				if(!parentIds.contains(systemMenu.getParentMenuId())){
					SystemMenu parentMenu = getMenu(systemMenu.getParentMenuId());
					parentMenu.setMenuList(getMenuByParentId(menus, parentMenu.getMenuId()));
					parentIds.add(parentMenu.getMenuId());
					parentMenus.add(parentMenu);
				}
			}
		}
		return parentMenus;
	}
	
	private List<SystemMenu> getMenuByParentId(List<SystemMenu> menus, int parentId){
		List<SystemMenu> childMenus = new ArrayList<SystemMenu>();
		for(SystemMenu systemMenu : menus){
			if(systemMenu.getParentMenuId() == parentId) childMenus.add(systemMenu);
		}
		return childMenus;
	}
	
	//相同2【只支持两级】
	private List<SystemMenu> getAdminMenuChilds(List<SystemMenu> menus){ //管理员：根据父菜单，查询子菜单
		if(menus != null && menus.size() > 0){
			for(SystemMenu systemMenu : menus){
				systemMenu.setMenuList(getMenusByParentId(systemMenu.getMenuId()));
			}
		}
		return menus;
	}
	
}
