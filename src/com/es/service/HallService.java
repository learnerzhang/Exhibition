package com.es.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.es.dao.EntityDao;
import com.es.model.Enterprise;
import com.es.model.Expo;
import com.es.model.Hall;
import com.es.model.HallImage;
import com.es.model.Page;

@Service
public class HallService {

	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(HallService.class);
	@Transactional
	public Integer getHallSize() {
		StringBuffer query = new StringBuffer();
		query.append("select hall from ").append(Hall.class.getSimpleName()).append(" hall where hall.status!='del'");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}
	public Integer getTodaygetTodaySizeSize() {
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String k = timestamp.toString().split(" ")[0];
		StringBuffer query = new StringBuffer();
		query.append("select hall from ").append(Hall.class.getSimpleName()).append(" hall where hall.status!='del'");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}
	public List<Object> getHallBySearchList(Page page, String context, String area) {
		String queryString = "select hall from " + Hall.class.getSimpleName() + " hall where hall.status!='del' and hall.name like '%"+context+"%' and hall.area like '%"+area+"%'";//

		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	public List<Object> getHalls(String username) {
		
		String queryString = "select hall from " + Hall.class.getSimpleName() + " hall where hall.username =:username and hall.status !='del'";//
		List<Object> list = entityDao.queryByField(queryString, new String[] { "username" }, new String[] { username });
		return list;
	}
	
	public List<Object> getRecommendedHall(String orderByKey,Page page) {// 分页显示
		/*
		 * StringBuffer query = new StringBuffer(); query.append(
		 * "select review from ").append(Review.class.getSimpleName()).append(
		 * " review where review.username =:username");
		 */
		String queryString = "select hall from " + Hall.class.getSimpleName() + " hall where hall.status='yes' order by hall."+orderByKey+" desc";//

		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	public List<Object> getHallByArea(String area,int page,int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(Hall.class.getSimpleName()).append(" a where a.area like '" + area + "%'");
		System.out.println(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}
	public List<Object> getHalls(int page, int pageSize) {// 分页显示
		StringBuffer query = new StringBuffer();
		query.append("select hall from ").append(Hall.class.getSimpleName()).append(" hall");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(), page, pageSize);
		return list;
	}

	public List<Object> getHalls(String username, Page page) {// 分页显示
		/*
		 * StringBuffer query = new StringBuffer(); query.append(
		 * "select review from ").append(Review.class.getSimpleName()).append(
		 * " review where review.username =:username");
		 */

		String queryString = "select hall from " + Hall.class.getSimpleName() + " hall where hall.username =:username and hall.status!='del'";//

		List<Object> list = entityDao.queryByField(queryString, new String[] { "username" }, new String[] { username },page);
		return list;
	}

	public Hall getHallById(String id) {
		return (Hall) entityDao.query(Hall.class, Integer.valueOf(id));
	}

	public Hall getHallByField(String key, String value) {
		return (Hall) entityDao.queryByField(Hall.class, key, value);
	}

	public boolean saveHall(Hall hall) {

		try {
			entityDao.save(hall);// save review
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void updateHall(Hall hall) {

		entityDao.update(hall);
	}
	
	public List<Object> getHallImageList(String hall_id){
		
		StringBuffer query = new StringBuffer();
		query.append("select hallimage from ").append(HallImage.class.getSimpleName()).append(" hallimage where hallimage.hall_id='"+hall_id+"'");
		
		return entityDao.createQuery(query.toString(), 1, 8);
	}
	public Integer getHallImages(String hall_id){
		
		StringBuffer query = new StringBuffer();
		query.append("select hallimage from ").append(HallImage.class.getSimpleName()).append(" hallimage where hallimage.hall_id='"+hall_id+"'");
		
		return entityDao.createQuery(query.toString(), 1, 8).size();
	}
	
	public boolean saveHallImage(HallImage hallImage) {
		try {
			entityDao.save(hallImage);// save review
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	public void updateHallImage(HallImage hallImage) {
		entityDao.update(hallImage);
	}
	public void delHallImageByHallId(String hall_id) {
		List<Object> images = getHallImageList(hall_id);
		for (Object image : images) {
			entityDao.delete(image);
		}
	}
}
