package com.park.service.impl;

import com.park.common.bean.NotificationsSendersInputView;
import com.park.common.bean.NotificationsReceiversInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.*;
import com.park.common.util.*;
import com.park.dao.IBaseDao;
import com.park.service.INotificationsService;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class NotificationsServiceImpl extends BaseService implements INotificationsService {

	@Autowired
	private IBaseDao baseDao;

    @Override
    public PageBean getNotificationsDraft(NotificationsSendersInputView notificationsSendersInputView){
        String noteTitle = notificationsSendersInputView.getNoteTitle();
        Integer senderId = notificationsSendersInputView.getSenderId();
        String sendStatus = notificationsSendersInputView.getSendStatus();

        StringBuilder headSql = new StringBuilder("SELECT ni.noteId, ni.noteTitle, ni.noteContent, uo.operatorName,uo.operatorMobile, ni.updateTime, ni.sendStatus");
        StringBuilder bodySql = new StringBuilder(" FROM notifications_senders ni");
        bodySql.append(" INNER JOIN user_operator uo ON uo.id = ni.senderId");
        StringBuilder whereSql = new StringBuilder(" WHERE ni.senderId=:senderId");
        whereSql.append(" AND sendStatus = :sendStatus");
        if(StrUtil.isNotBlank(noteTitle)){
            whereSql.append(" AND ni.noteTitle = :noteTitle");
        }
        whereSql.append(" ORDER BY ni.updateTime DESC");
        return super.getPageBean(headSql, bodySql, whereSql, notificationsSendersInputView);
    }

	@Override
	public PageBean getNotificationsBySender(NotificationsSendersInputView notificationsSendersInputView){
		String noteTitle = notificationsSendersInputView.getNoteTitle();
        Integer senderId = notificationsSendersInputView.getSenderId();
		String sendStatus = notificationsSendersInputView.getSendStatus();

        StringBuilder headSql = new StringBuilder("SELECT ni.*, uo.operatorName,uo.operatorMobile,nr.*");
        StringBuilder bodySql = new StringBuilder(" FROM notifications_senders ni");
        bodySql.append(" INNER JOIN notifications_receivers nr ON nr.noteId = ni.noteId ");
        bodySql.append(" INNER JOIN user_operator uo ON nr.receiverId = uo.id");
        StringBuilder whereSql = new StringBuilder(" WHERE ni.senderId = :senderId");
        whereSql.append(" AND ni.sendStatus = :sendStatus");
        if(StrUtil.isNotBlank(noteTitle)){
            whereSql.append(" AND ni.noteTitle = :noteTitle");
        }
        whereSql.append(" ORDER BY ni.sendTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, notificationsSendersInputView);
	}

	@Override
	public PageBean getNotificationsByReceiver(NotificationsReceiversInputView notificationsReceiversInputView){
        String receiverStatus = notificationsReceiversInputView.getReceiverStatus();
        Integer receiverId = notificationsReceiversInputView.getReceiverId();

        StringBuilder headSql = new StringBuilder("SELECT ni.*, uo.operatorName,uo.operatorMobile,nr.*");
        StringBuilder bodySql = new StringBuilder(" FROM notifications_senders ni");
        bodySql.append(" INNER JOIN notifications_receivers nr ON nr.noteId = ni.noteId ");
        bodySql.append(" INNER JOIN user_operator uo ON nr.receiverId = uo.id");
        StringBuilder whereSql = new StringBuilder(" WHERE nr.receiverId = :receiverId");
        if (StrUtil.isNotBlank(receiverStatus) && receiverStatus == IDBConstant.NOTIFICATIONS_RECEIVER_ALL) {
            notificationsReceiversInputView.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_DEL);
            whereSql.append(" AND nr.receiverStatus != :receiverStatus");
        }
        else if (StrUtil.isNotBlank(receiverStatus)) {
            whereSql.append(" AND nr.receiverStatus = :receiverStatus");
        }
        whereSql.append(" ORDER BY ni.sendTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, notificationsReceiversInputView);
	}

	@Override
	public NotificationsSenders getNotificationInfo(int noteId) {
		return baseDao.getToEvict(NotificationsSenders.class, noteId);
	}
	
	@Override
	public void deleteNotification(int noteId){
        NotificationsSenders notificationInfo = getNotificationInfo(noteId);
		if(notificationInfo == null) throw new MessageException("该通知消息不存在");

        notificationInfo.setSendStatus(IDBConstant.NOTIFICATIONS_SENDER_DEL);
        baseDao.save(notificationInfo, noteId);
	}
	
	@Override
	public Integer saveSetNotification(NotificationsSenders notificationsSenders) throws IOException {
		String nowDate = DateUtil.getNowDate();
        Integer noteId = notificationsSenders.getNoteId();

		if (noteId == null) {
            notificationsSenders.setCreateTime(nowDate);
            notificationsSenders.setUpdateTime(nowDate);
            notificationsSenders.setSendStatus(IDBConstant.NOTIFICATIONS_SENDER_NO);
			baseDao.save(notificationsSenders, null);
			noteId = notificationsSenders.getNoteId();
		} else {
            NotificationsSenders notificationsSendersDB = getNotificationInfo(noteId);
            if(notificationsSendersDB == null) throw new MessageException("该通知消息不存在");
            notificationsSendersDB.setNoteTitle(notificationsSenders.getNoteTitle());
            notificationsSendersDB.setNoteContent(notificationsSenders.getNoteContent());
            notificationsSendersDB.setUpdateTime(nowDate);
			baseDao.save(notificationsSendersDB, noteId);
		}

		return noteId;
	}

    @Override
    public Integer saveSendNotification(NotificationsReceivers notificationsReceivers) {
        String nowDate = DateUtil.getNowDate();
        Integer noteId = notificationsReceivers.getNoteId();

        NotificationsSenders notificationsSendersDB = getNotificationInfo(noteId);
        notificationsSendersDB.setSendStatus(IDBConstant.NOTIFICATIONS_SENDER_YES);
        notificationsSendersDB.setSendTime(nowDate);
        baseDao.save(notificationsSendersDB, noteId);

        notificationsReceivers.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_NO);
        baseDao.save(notificationsReceivers, null);
        Integer sendId = notificationsReceivers.getId();

        return sendId;
    }

    @Override
    public NotificationsReceivers getNotificationReceivers(int id) {
        return baseDao.getToEvict(NotificationsReceivers.class, id);
    }

    @Override
    public void deleteNotificationReceiver(int id){
        NotificationsReceivers notificationsReceivers = getNotificationReceivers(id);
        if(notificationsReceivers == null) throw new MessageException("该通知消息不存在");

        notificationsReceivers.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_DEL);
        baseDao.save(notificationsReceivers, id);
    }
	
	@Override
	public void saveMarkNotificationRead(int id){
        String nowDate = DateUtil.getNowDate();

        NotificationsReceivers notificationsReceivers = getNotificationReceivers(id);
        if(notificationsReceivers == null) throw new MessageException("该通知消息不存在");
        notificationsReceivers.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_YES);
        notificationsReceivers.setReadTime(nowDate);

        baseDao.save(notificationsReceivers, id);
	}
}

