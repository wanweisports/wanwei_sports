package com.park.service;

import com.park.common.bean.NotificationsInputView;
import com.park.common.bean.NotificationsUsersInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.NotificationsInfo;
import com.park.common.po.NotificationsUsers;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;

public interface INotificationsService {

	public PageBean getNotificationsBySender(NotificationsInputView notificationsInputView,
                                             NotificationsUsersInputView notificationsUsersInputView);

    public PageBean getNotificationsByReceiver(NotificationsInputView notificationsInputView,
                                               NotificationsUsersInputView notificationsUsersInputView);

    public NotificationsInfo getNotificationInfo(int noteId);
	
	public Integer saveSetNotification(NotificationsInfo notificationInfo, NotificationsUsers notificationsUsers) throws IOException;

    public Integer saveSendNotification(int noteId);

    public void saveMarkNotificationRead(int noteId);

    public void deleteNotification(int noteId);
}
