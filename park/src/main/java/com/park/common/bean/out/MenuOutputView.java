package com.park.common.bean.out;

import java.util.List;

public class MenuOutputView {

	private String id;
	private String text;
	private MenuState state;
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
	public MenuState getState() {
		return state;
	}
	public void setState(MenuState state) {
		this.state = state;
	}
	public List<MenuOutputView> getChildren() {
		return children;
	}
	public void setChildren(List<MenuOutputView> children) {
		this.children = children;
	}
	
}
