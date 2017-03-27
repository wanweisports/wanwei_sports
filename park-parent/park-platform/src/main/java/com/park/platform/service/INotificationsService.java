package com.park.platform.service;

import com.park.common.bean.NotificationsReceiversInputView;
import com.park.common.bean.NotificationsSendersInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.NotificationsReceivers;
import com.park.common.po.NotificationsSenders;

import java.io.IOException;

public interface INotificationsService {

    public PageBean getNotificationsDraft(NotificationsSendersInputView notificationsSendersInputView);

	public PageBean getNotificationsBySender(NotificationsSendersInputView notificationsSendersInputView);

    public PageBean getNotificationsByReceiver(NotificationsReceiversInputView notificationsReceiversInputView);

    public NotificationsSenders getNotificationInfo(int noteId);

    public NotificationsReceivers getNotificationReceivers(int id);
	
	public Integer saveSetNotification(NotificationsSenders notificationInfo) throws IOException;

    public Integer saveSendNotification(NotificationsReceivers notificationsReceivers);

    public void saveMarkNotificationRead(int id);

    public void deleteNotification(int noteId);

    public void deleteNotificationReceiver(int id);
}
