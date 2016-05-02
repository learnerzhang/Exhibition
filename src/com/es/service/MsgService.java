package com.es.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.dao.EntityDao;
import com.es.model.AdImage;
import com.es.model.Msg;
import com.es.model.Page;

@Service
public class MsgService {
	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(MsgService.class);
	
	public List<Object> getMsg(Page page) {
		
		String queryString = "select msg from " + Msg.class.getSimpleName() + " msg  order by msg.timestamp desc";//
		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	
	public List<Object> getIndexMsg(Page page) {
		String queryString = "select msg from " + Msg.class.getSimpleName() + " msg where msg.type='2' order by msg.timestamp desc";//
		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
		
	}
	
	public List<Object> getUserIndexInfo(Page page,String username) {
		
		String queryString = "select msg from " + Msg.class.getSimpleName() + " msg  where msg.ito='"+username+"' or msg.ito='all'  order by msg.timestamp desc  ";//
		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	public Integer getUserMsgListSize(String username) {
		
		String queryString = "select msg from " + Msg.class.getSimpleName() + " msg where msg.ito='"+username+"' or msg.ito='all'";//
		List<Object> list = entityDao.createQuery(queryString);
		return list.size();
	}
	public Integer getMsgListSize() {
		
		String queryString = "select msg from " + Msg.class.getSimpleName() + " msg where msg.type='2'";//
		List<Object> list = entityDao.createQuery(queryString);
		return list.size();
	}
	
	public Msg getMsg(Integer id) {
		// TODO Auto-generated method stub
		return (Msg) entityDao.query(Msg.class, id);
	}
	
	public void addMsg(Msg msg) {
		
		entityDao.save(msg);
	}
	
	public void updateMsg(Msg msg) {
		
		entityDao.update(msg);
	}
	
	public void delMsg(Integer id) {
		
		Object info = entityDao.query(Msg.class, id);
		entityDao.delete(info);
	}
	
}
