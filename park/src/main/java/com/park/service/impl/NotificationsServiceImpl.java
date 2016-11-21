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

@Service
public class NotificationsServiceImpl extends BaseService implements INotificationsService {

	@Autowired
	private IBaseDao baseDao;


	@Override
	public PageBean getNotifications(NotificationsInputView notificationsInputView){
		String noteTitle = notificationsInputView.getNoteTitle();
        String noteStatus = notificationsInputView.getNoteStatus();
		
		StringBuilder headSql = new StringBuilder("SELECT noteId, noteTitle, noteContent, noteReceiver, noteAttachments, noteReadTime, noteStatus, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM user_notifications un left join user_operator uo on un.noteReceiver=uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(StrUtil.isNotBlank(noteTitle)){
			whereSql.append(" AND noteTitle = :noteTitle");
		}
		if(StrUtil.isNotBlank(noteStatus)){
			whereSql.append(" AND noteStatus = :noteStatus");
		}
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
	public Integer setNotification(NotificationsInfo notificationInfo) {
		String nowDate = DateUtil.getNowDate();
        Integer noteId = notificationInfo.getNoteId();

		if (noteId == null) {
            notificationInfo.setNoteCreateTime(nowDate);
			baseDao.save(notificationInfo, null);
			return notificationInfo.getNoteId();
		} else {
            NotificationsInfo notificationInfoDB = getNotificationInfo(noteId);
			if(notificationInfoDB == null) throw new MessageException("该通知消息不存在");
            notificationInfoDB.setNoteTitle(notificationInfoDB.getNoteTitle());
            notificationInfoDB.setNoteContent(notificationInfoDB.getNoteContent());
            notificationInfoDB.setNoteAttachments(notificationInfoDB.getNoteAttachments());
            notificationInfoDB.setNoteReceiver(notificationInfoDB.getNoteReceiver());
            notificationInfoDB.setNoteUpdateTime(nowDate);
			baseDao.save(notificationInfoDB, noteId);
			return noteId;
		}
	}
	
	@Override
	public void markNotificationRead(int noteId){
        NotificationsInfo notificationInfo = getNotificationInfo(noteId);
        notificationInfo.setNoteStatus(IDBConstant.NOTIFICATIONS_STATE_YES);
		baseDao.updateBySql("UPDATE user_notifications SET noteStatus = ? WHERE noteId = ?", IDBConstant.LOGIC_STATUS_YES, noteId);
	}
}

