package com.park.common.constant;

import com.park.common.util.CustomizedPropertyConfigurer;


/*
 * 自定义常量
 */
public interface IPlatformConstant {
	
	public static final String SUCCESS_CODE = "1";
	
	public static final String SUCCESS_MESSAGE = "操作成功";
	
	public static final String FAIL_CODE = "-1";
	
	public static final String FAIL_MESSAGE = "操作失败";
	
	public static final String REQUEST_JSON = "request_json";
	
	public static final String APP_ID = (String) CustomizedPropertyConfigurer.getContextProperty("app_id"); //appid
	
	public static final String APP_SECRET = (String) CustomizedPropertyConfigurer.getContextProperty("appsecret"); //密钥
	
	public static final String BAIDU_WEATHER_URL = "http://api.map.baidu.com/telematics/v3/weather"; //百度天气预报URL
	
	public static final String BAIDU_API_AK = "f1Entx919quugy6d8A3ctaMC"; //百度API的AK
	
	/***********************************消息类型***********************************************/
	public static final String MESSAGE_CONTENT = "";
	public static final String MESSAGE_TEXT = "text";				//文本消息
	public static final String MESSAGE_IMAGE = "image";				//图片消息
	public static final String MESSAGE_VOICE = "voice";				//语音消息
	public static final String MESSAGE_VIDEO = "video";				//视频消息
	public static final String MESSAGE_SHORTVIDEO = "shortvideo";   //小视频消息
	public static final String MESSAGE_LOCATION = "location";		//地理位置消息
	public static final String MESSAGE_LINK = "link";				//链接消息
	public static final String MESSAGE_EVENT = "event";				//事件
	public static final String EVENT_SUBSCRIBE = "subscribe";		//关注事件
	public static final String EVENT_UNSUBSCRIBE = "unsubscribe";	//取消关注事件
	public static final String EVENT_SCAN = "SCAN";					//用户已关注时的事件推送
	public static final String MESSAGE_NEWS = "news";				//图文消息
	public static final String MESSAGE_MUSIC = "music";				//音乐消息  
	public static final String MESSAGE_TRANSFER = "transfer_customer_service"; //客服消息
	
	/*************************************事件类型***************************************************/
	/**
	 * 点击菜单拉取消息时的事件推送
	 */
	public static final String EVENT_CLICK = "CLICK";				
	
	/**
	 * 点击菜单跳转链接时的事件推送
	 */
	public static final String EVENT_VIEW = "VIEW";	
	
	/**
	 * 扫码推事件的事件推送
	 */
	public static final String EVENT_SCANCODE_PUSH = "scancode_push";
	
	/**
	 * 扫码推事件且弹出“消息接收中”提示框的事件推送
	 */
	public static final String EVENT_SCANCODE_WAITMSG = "scancode_waitmsg";
	
	/**
	 * 弹出系统拍照发图的事件推送
	 */
	public static final String EVENT_PIC_SYSPHOTO = "pic_sysphoto";
	
	/**
	 * 弹出拍照或者相册发图的事件推送
	 */
	public static final String EVENT_PIC_PHOTO_OR_ALBUM = "pic_photo_or_album";
	
	/**
	 * 弹出微信相册发图器的事件推送
	 */
	public static final String EVENT_PIC_WEIXIN = "pic_weixin";
	
	/**
	 * 弹出地理位置选择器的事件推送
	 */
	public static final String EVENT_LOCATION = "location";
	/*********************************************************************************************/
	
	
	/****************************************请求URL********************************************************/
	public static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	/**
	 * 新增临时素材
	 */
	public static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	
	/**
	 * 新增永久素材
	 */
	public static final String ADD_MATERIAL = "https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=ACCESS_TOKEN&type=TYPE";
	
	/**
	 * 自定义菜单创建接口
	 */
	public static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	/**
	 * 自定义菜单查询接口
	 */
	public static final String QUERY_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	
	/**
	 * 自定义菜单删除接口
	 */
	public static final String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
		
	/**
	 * 获取用户基本信息（包括UnionID机制）
	 */
	public static final String USER_INFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	

	/**
	 * 获取用户列表
	 */
	public static final String USER_LIST_URL = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
	
	/**
	 *  设置用户备注名
	 */
	public static final String UPDATE_REMARK_URL = "https://api.weixin.qq.com/cgi-bin/user/info/updateremark?access_token=ACCESS_TOKEN";
	
	/**
	 *  移动用户分组
	 */
	public static final String UPDATE_GROUPS_URL = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";
	
	/**
	 *  批量移动用户分组
	 */
	public static final String UPDATE_BATCH_GROUPS_URL = "https://api.weixin.qq.com/cgi-bin/groups/members/batchupdate?access_token=ACCESS_TOKEN";
	
	/**
	 *  批量移动用户分组
	 */
	public static final String DELETE_GROUPS_URL = "https://api.weixin.qq.com/cgi-bin/groups/delete?access_token=ACCESS_TOKEN";
	
		
	/**
	 *  请求二维码 ticket
	 */
	public static final String CREATE_QRCODE_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	
	/**
	 *  通过 ticket 生成二维码
	 */
	public static final String SHOW_QRCODE_URL = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";
	
	/**
	 *  模板消息发送
	 */
	public static final String TEMPLATE_SEND_URL = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
	
	public static final String GETTICKET_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
	
}