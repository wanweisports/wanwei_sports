package com.park.service;

import java.util.List;

import com.park.common.bean.MenuInputView;
import com.park.common.po.SystemMenu;

public interface IMenuService {
	
	public List<SystemMenu> getAllParentMens();
	
	public List<SystemMenu> getMenus(MenuInputView menuInputView);

	public List<SystemMenu> getMenusByParentId(int parentId);
	
	public SystemMenu getMenu(int menuId);
	
}
