package com.park.service;

import com.park.common.bean.NotificationsInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.NotificationsInfo;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;

public interface INotificationsService {

	public PageBean getNotifications(NotificationsInputView notificationsInputView);

    public PageBean getNotificationsReceiver(NotificationsInputView notificationsInputView);

    public NotificationsInfo getNotificationInfo(int noteId);
	
	public Integer saveSetNotification(NotificationsInfo notificationInfo) throws IOException;

    public Integer saveSendNotification(int noteId);

    public void saveMarkNotificationRead(int noteId);

    public void deleteNotification(int noteId);
}
