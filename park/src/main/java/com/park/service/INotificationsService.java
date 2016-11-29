package com.park.service;

import com.park.common.bean.NotificationsInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.NotificationsInfo;

public interface INotificationsService {

	public PageBean getNotifications(NotificationsInputView notificationsInputView);

    public PageBean getNotificationsReceiver(NotificationsInputView notificationsInputView);

    public NotificationsInfo getNotificationInfo(int noteId);
	
	public Integer setNotification(NotificationsInfo notificationInfo);

    public Integer sendNotification(int noteId);

    public void markNotificationRead(int noteId);

    public void deleteNotification(int noteId);
}
