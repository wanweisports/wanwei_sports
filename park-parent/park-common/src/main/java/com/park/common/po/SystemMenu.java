package com.park.common.po;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * SystemMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_menu", catalog = "park")
public class SystemMenu implements java.io.Serializable {

	// Fields

	private Integer menuId;
	private Integer parentMenuId;
	private String menuName;
	private String menuCode;
	private String menuUrl;
	private String menuStatus;
	private Integer menuSort;
    private String isQuick;

	@Transient
	private List<SystemMenu> menuList;
	// Constructors

	/** default constructor */
	public SystemMenu() {
	}

	/** minimal constructor */
	public SystemMenu(String menuName, String menuUrl) {
		this.menuName = menuName;
		this.menuUrl = menuUrl;
	}

	/** full constructor */
	public SystemMenu(Integer parentMenuId, String menuName, String menuCode,
			String menuUrl, String menuStatus, Integer menuSort, String isQuick) {
		this.parentMenuId = parentMenuId;
		this.menuName = menuName;
		this.menuCode = menuCode;
		this.menuUrl = menuUrl;
        this.menuStatus = menuStatus;
        this.menuSort = menuSort;
        this.isQuick = isQuick;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "menuId", unique = true, nullable = false)
	public Integer getMenuId() {
		return this.menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	@Column(name = "parentMenuId")
	public Integer getParentMenuId() {
		return this.parentMenuId;
	}

	public void setParentMenuId(Integer parentMenuId) {
		this.parentMenuId = parentMenuId;
	}

	@Column(name = "menuName", nullable = false, length = 32)
	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "menuCode", length = 32)
	public String getMenuCode() {
		return this.menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	@Column(name = "menuURL", nullable = false, length = 65535)
	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

    @Column(name = "menuStatus", length = 1)
    public String getMenuStatus() {
        return this.menuStatus;
    }

    public void setMenuStatus(String menuStatus) {
        this.menuStatus = menuStatus;
    }

    @Column(name = "menuSort", length = 11)
    public Integer getMenuSort() {
        return this.menuSort;
    }

    public void setMenuSort(Integer menuSort) {
        this.menuSort = menuSort;
    }

    @Column(name = "isQuick", length = 1)
    public String getIsQuick() {
        return this.isQuick;
    }

    public void setIsQuick(String isQuick) {
        this.isQuick = isQuick;
    }

	@Transient
	public List<SystemMenu> getMenuList() {
		return menuList;
	}

	@Transient
	public void setMenuList(List<SystemMenu> menuList) {
		this.menuList = menuList;
	}

}