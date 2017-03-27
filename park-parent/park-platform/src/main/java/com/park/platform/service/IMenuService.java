package com.park.platform.service;

import com.park.common.bean.MenuInputView;
import com.park.common.po.SystemMenu;

import java.util.List;

public interface IMenuService {
	
	public List<SystemMenu> getAllParentMens();
	
	public List<SystemMenu> getMenus(MenuInputView menuInputView);

	public List<SystemMenu> getMenusByParentId(int parentId);
	
	public SystemMenu getMenu(int menuId);
	
}
