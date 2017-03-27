package com.park.common.bean.out;

import java.util.List;

public class MenuOutputView {

	private String id;
	private String text;
	private com.park.common.bean.out.MenuState state;
	private List<MenuOutputView> children;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public com.park.common.bean.out.MenuState getState() {
		return state;
	}
	public void setState(com.park.common.bean.out.MenuState state) {
		this.state = state;
	}
	public List<MenuOutputView> getChildren() {
		return children;
	}
	public void setChildren(List<MenuOutputView> children) {
		this.children = children;
	}
	
}
