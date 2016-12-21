package com.park.service.impl;

import com.park.common.bean.NotificationsInputView;
import com.park.common.bean.NotificationsUsersInputView;
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
	public PageBean getNotificationsBySender(NotificationsInputView notificationsInputView,
                                             NotificationsUsersInputView notificationsUsersInputView){
		String noteTitle = notificationsInputView.getNoteTitle();
		String noteStatus = notificationsUsersInputView.getStatus();
        Integer noteSenderId = notificationsUsersInputView.getSenderId();

		StringBuilder headSql = new StringBuilder("SELECT ni.noteTitle, ni.noteContent, uo.operatorName,uo.operatorMobile, nu.status, nu.sendTime, nu.readTime");
		StringBuilder bodySql = new StringBuilder(" FROM notifications_info ni");
		bodySql.append(" INNER JOIN notificaitons_users nu ON ni.noteId = nu.noteId INNER JOIN user_operator uo ON nu.receiverId = uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
        whereSql.append(" AND nu.senderId = :noteSenderId");
		if(StrUtil.isNotBlank(noteTitle)){
			whereSql.append(" AND noteTitle = :noteTitle");
		}
		if(StrUtil.isNotBlank(noteStatus)){
			whereSql.append(" AND nu.status = :noteStatus");
		}
        whereSql.append(" ORDER BY nu.sendTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, notificationsInputView);
	}

	@Override
	public PageBean getNotificationsByReceiver(NotificationsInputView notificationsInputView,
                                               NotificationsUsersInputView notificationsUsersInputView){
		String noteTitle = notificationsInputView.getNoteTitle();
        String noteStatus = notificationsUsersInputView.getStatus();
        Integer noteReceiverId = notificationsUsersInputView.getReceiverId();

        StringBuilder headSql = new StringBuilder("SELECT ni.noteTitle, ni.noteContent, uo.operatorName,uo.operatorMobile, nu.status, nu.sendTime, nu.readTime");
        StringBuilder bodySql = new StringBuilder(" FROM notifications_info ni");
        bodySql.append(" INNER JOIN notificaitons_users nu ON ni.noteId = nu.noteId INNER JOIN user_operator uo ON nu.senderId = uo.id");
        StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
        whereSql.append(" AND nu.receiverId = :noteReceiver");
		if(StrUtil.isNotBlank(noteTitle)){
			whereSql.append(" AND noteTitle = :noteTitle");
		}
		if(StrUtil.isNotBlank(noteStatus)){
			whereSql.append(" AND nu.status = :noteStatus");
		}
        whereSql.append(" ORDER BY nu.sendTime DESC");
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
	public Integer saveSetNotification(NotificationsInfo notificationInfo, NotificationsUsers notificationsUsers) throws IOException {
		String nowDate = DateUtil.getNowDate();
        Integer noteId = notificationInfo.getNoteId();

		if (noteId == null) {
            notificationInfo.setCreateTime(nowDate);
			notificationInfo.setUpdateTime(nowDate);
			baseDao.save(notificationInfo, null);
            notificationsUsers.setSendTime(nowDate);
            baseDao.save(notificationInfo, null);
			noteId = notificationInfo.getNoteId();
		} else {
            NotificationsInfo notificationInfoDB = getNotificationInfo(noteId);
            if(notificationInfoDB == null) throw new MessageException("该通知消息不存在");
            notificationInfoDB.setNoteTitle(notificationInfo.getNoteTitle());
            notificationInfoDB.setNoteContent(notificationInfo.getNoteContent());
            notificationInfo.setUpdateTime(nowDate);
			baseDao.save(notificationInfoDB, noteId);
		}

		return noteId;
	}

    @Override
    public Integer saveSendNotification(int noteId) {
        String nowDate = DateUtil.getNowDate();
        NotificationsInfo notificationInfoDB = getNotificationInfo(noteId);

        if(notificationInfoDB == null) throw new MessageException("该通知消息不存在");

        notificationInfoDB.setUpdateTime(nowDate);
        baseDao.save(notificationInfoDB, noteId);

        return noteId;
    }
	
	@Override
	public void saveMarkNotificationRead(int noteId){
        String nowDate = DateUtil.getNowDate();

        NotificationsInfo notificationInfo = getNotificationInfo(noteId);;
        notificationInfo.setUpdateTime(nowDate);

        baseDao.save(notificationInfo, noteId);
	}
}

