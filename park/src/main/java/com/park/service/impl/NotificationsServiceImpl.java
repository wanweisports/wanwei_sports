package com.park.service.impl;

import com.park.common.bean.NotificationsInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.*;
import com.park.common.util.*;
import com.park.dao.IBaseDao;
import com.park.service.INotificationsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;

@Service
public class NotificationsServiceImpl extends BaseService implements INotificationsService {

	@Autowired
	private IBaseDao baseDao;


	@Override
	public PageBean getNotifications(NotificationsInputView notificationsInputView){
		String noteTitle = notificationsInputView.getNoteTitle();
        String noteSenderStatus = notificationsInputView.getNoteSenderStatus();
        Integer noteSender = notificationsInputView.getNoteSender();
		
		StringBuilder headSql = new StringBuilder("SELECT un.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM user_notifications un left join user_operator uo on un.noteReceiver=uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
        whereSql.append(" AND noteSender = :noteSender");
		if(StrUtil.isNotBlank(noteTitle)){
			whereSql.append(" AND noteTitle = :noteTitle");
		}
		if(StrUtil.isNotBlank(noteSenderStatus)){
			whereSql.append(" AND noteSenderStatus = :noteSenderStatus");
		}
        whereSql.append(" ORDER BY noteSendTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, notificationsInputView);
	}

	@Override
	public PageBean getNotificationsReceiver(NotificationsInputView notificationsInputView){
		String noteTitle = notificationsInputView.getNoteTitle();
		String noteReceiverStatus = notificationsInputView.getNoteReceiverStatus();
        Integer noteReceiver = notificationsInputView.getNoteReceiver();

		StringBuilder headSql = new StringBuilder("SELECT un.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM user_notifications un left join user_operator uo on un.noteReceiver=uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
        whereSql.append(" AND noteReceiver = :noteReceiver");
		if(StrUtil.isNotBlank(noteTitle)){
			whereSql.append(" AND noteTitle = :noteTitle");
		}
		if(StrUtil.isNotBlank(noteReceiverStatus)){
			whereSql.append(" AND noteReceiverStatus = :noteReceiverStatus");
		}
        whereSql.append(" ORDER BY noteSendTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, notificationsInputView);
	}
	
	@Override
	public NotificationsInfo getNotificationInfo(int noteId) {
		return baseDao.getToEvict(NotificationsInfo.class, noteId);
	}
	
	@Override
	public void deleteNotification(int noteId){
        NotificationsInfo notificationInfo = getNotificationInfo(noteId);
		if(notificationInfo == null) throw new MessageException("该通知消息不存在");
		baseDao.delete(notificationInfo);
	}
	
	@Override
	public Integer saveSetNotification(NotificationsInfo notificationInfo) throws IOException {
		String nowDate = DateUtil.getNowDate();
        Integer noteId = notificationInfo.getNoteId();

		if (noteId == null) {
            notificationInfo.setNoteCreateTime(nowDate);
			notificationInfo.setNoteUpdateTime(nowDate);
            notificationInfo.setNoteSenderStatus(IDBConstant.NOTIFICATIONS_SENDER_NO);
			notificationInfo.setNoteSendTime(nowDate);
			notificationInfo.setNoteReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_NO);
            notificationInfo.setNoteAttachments("");
			baseDao.save(notificationInfo, null);
			noteId = notificationInfo.getNoteId();
		} else {
            NotificationsInfo notificationInfoDB = getNotificationInfo(noteId);
			if(notificationInfoDB == null) throw new MessageException("该通知消息不存在");
            notificationInfoDB.setNoteTitle(notificationInfo.getNoteTitle());
            notificationInfoDB.setNoteContent(notificationInfo.getNoteContent());
            notificationInfoDB.setNoteReceiver(notificationInfo.getNoteReceiver());
            notificationInfo.setNoteSenderStatus(IDBConstant.NOTIFICATIONS_SENDER_YES);
            notificationInfo.setNoteReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_YES);
            notificationInfo.setNoteReadTime(nowDate);
			baseDao.save(notificationInfoDB, noteId);
		}

		return noteId;
	}

    @Override
    public Integer saveSendNotification(int noteId) {
        String nowDate = DateUtil.getNowDate();
        NotificationsInfo notificationInfoDB = getNotificationInfo(noteId);

        if(notificationInfoDB == null) throw new MessageException("该通知消息不存在");

        notificationInfoDB.setNoteSenderStatus(IDBConstant.NOTIFICATIONS_SENDER_NO);
        notificationInfoDB.setNoteReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_NO);
        notificationInfoDB.setNoteUpdateTime(nowDate);
        baseDao.save(notificationInfoDB, noteId);

        return noteId;
    }
	
	@Override
	public void saveMarkNotificationRead(int noteId){
        String nowDate = DateUtil.getNowDate();

        NotificationsInfo notificationInfo = getNotificationInfo(noteId);
        notificationInfo.setNoteSenderStatus(IDBConstant.NOTIFICATIONS_SENDER_YES);
        notificationInfo.setNoteReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_YES);
        notificationInfo.setNoteReadTime(nowDate);
        notificationInfo.setNoteUpdateTime(nowDate);

        baseDao.save(notificationInfo, noteId);
	}
}

