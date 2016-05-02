package com.es.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.es.dao.EntityDao;
import com.es.model.Expo;
import com.es.model.Page;
@Service
public class ExpoService {

	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(ExpoService.class);
	
	@Transactional
	public List<Object> getExpos() {
		StringBuffer query = new StringBuffer();
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo.status!='del' order by expo.startline desc");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list;
	}
	
	public Integer getExpoListSize() {
		StringBuffer query = new StringBuffer();
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo.status!='del' order by expo.startline desc");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}
	public List<Object> getExpoBySearchList(Page page, String context, String area) {
		// TODO Auto-generated method stub
		String hql = "select expo from "+Expo.class.getSimpleName()+" expo where expo.status!='del' and expo.name like '%"+context+"%' and expo.area like '%"+area+"%' order by expo.recommend,expo.startline desc";
		
		List<Object> list = entityDao.createQuery(hql,page.getCurrentPage(),page.getEveryPage());
		return list;
	}
	public List<Object> getExpoList(Page page) {
		StringBuffer query = new StringBuffer();
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo.status!='del' order by expo.startline desc");
		log.info(query);
		return entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
	}
	
	public Integer getCount(String key,String value){
		
		String queryString = "select  expo from " + Expo.class.getSimpleName() + " expo where expo.industry =:industry and expo.status!='del'";//
		return entityDao.getCountByField(queryString, new String[] { "industry" }, new String[] { key });
	}
	public List<Object> getExpos(int page, int pageSize) {// 分页显示
		StringBuffer query = new StringBuffer();
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo.status!='del' order by expo.startline desc");//时间降序
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}
	
	public List<Object> getExpos(int page, int pageSize,String key,String value) {// 分页显示
		StringBuffer query = new StringBuffer();
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo."+key+"='"+value+"' and expo.status!='del' order by expo.startline desc");//时间降序
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}
	public List<Object> getOldExpos(int page, int pageSize,String key,String value) {// 分页显示
		StringBuffer query = new StringBuffer();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String rs = sdf.format(date)+" 08:00:00";
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo."+key+"='"+value+"' and expo.startline<='"+ rs +"' and expo.status!='del' order by expo.startline desc");//时间降序
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}
	public List<Object> getNewExpos(int page, int pageSize,String key,String value) {// 分页显示
		StringBuffer query = new StringBuffer();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String rs = sdf.format(date)+" 08:00:00";
		query.append("select expo from ").append(Expo.class.getSimpleName()).append(" expo where expo."+key+"='"+value+"' and expo.startline>'"+ rs +"' and expo.status!='del' order by expo.startline desc");//时间降序
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}
	//获取正在进行的展会
	public List<Object> getCurrentExpos(int num){
		return entityDao.queryCurrentList(Expo.class, "expo","startline","deadline",num);
	}
	
	//获取近期进行的展会
	public List<Object> getRecentlyExpos(int num){
		return entityDao.queryRecentlyList(Expo.class, "expo", "startline", num);
	}
	
	//获取历史进行的展会
	public List<Object> getHistoryExpos(int num){
		return entityDao.queryHistoryList(Expo.class, "expo", "deadline", num);
	}
	
	public List<Object> getRecommendedExpos(String orderByKey,Page page) {// 分页显示
		/*
		 * StringBuffer query = new StringBuffer(); query.append(
		 * "select review from ").append(Review.class.getSimpleName()).append(
		 * " review where review.username =:username");
		 */
		String queryString = "select expo from " + Expo.class.getSimpleName() + " expo where expo.status='yes' order by expo."+orderByKey+" desc";//

		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	
	//按时间的先后分页
	public List<Object> getExpos(String industry,String orderByKey,Page page) {// 分页显示
		/*
		 * StringBuffer query = new StringBuffer(); query.append(
		 * "select review from ").append(Review.class.getSimpleName()).append(
		 * " review where review.username =:username");
		 */
		String queryString = "select expo from " + Expo.class.getSimpleName() + " expo where expo.industry =:industry and expo.status='yes' order by expo."+orderByKey+" desc";//

		List<Object> list = entityDao.queryByField(queryString, new String[] { "industry" }, new String[] { industry },page);
		return list;
	}
	
	public List<Object> getExpos(String username, Page page) {// 分页显示
		/*
		 * StringBuffer query = new StringBuffer(); query.append(
		 * "select review from ").append(Review.class.getSimpleName()).append(
		 * " review where review.username =:username");
		 */
		String queryString = "select expo from " + Expo.class.getSimpleName() + " expo where expo.username =:username and expo.status!='del'";//

		List<Object> list = entityDao.queryByField(queryString, new String[] { "username" }, new String[] { username },page);
		return list;
	}

	public Expo getExpoById(String id) {
		return (Expo) entityDao.query(Expo.class, Integer.valueOf(id));
	}

	public Expo getExpoByField(String key, String value) {
		return (Expo) entityDao.queryByField(Expo.class, key, value);
	}

	public boolean saveExpo(Expo expo) {

		try {
			entityDao.save(expo);// save review
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void updateExpo(Expo expo) {

		entityDao.update(expo);

	}

}
