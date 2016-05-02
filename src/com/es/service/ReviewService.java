package com.es.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.es.dao.EntityDao;
import com.es.model.Expo;
import com.es.model.Page;
import com.es.model.Review;
import com.es.model.User;

@Service
public class ReviewService {
	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(ReviewService.class);
	
	@Transactional
	public List<Object> getReviews() {
		StringBuffer query = new StringBuffer();
		query.append("select review from ").append(Review.class.getSimpleName()).append(" review where review.status='yes' order by review.creattime desc");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list;
	}
	
	public Integer getReviewListSize() {
		StringBuffer query = new StringBuffer();
		query.append("select review from ").append(Review.class.getSimpleName()).append(" review where review.status!='del' order by review.creattime desc");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}

	public List<Object> getReviewList(Page page) {
		StringBuffer query = new StringBuffer();
		query.append("select review from ").append(Review.class.getSimpleName()).append(" review where review.status!='del'  order by review.creattime desc");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
		return list;
	}
	public List<Object> getAllContextReviews(Page page, String context) {
		StringBuffer query = new StringBuffer();
		query.append("select review from ").append(Review.class.getSimpleName()).append(" review where review.status!='del' and ( review.type like '%"+context+"%' or review.title like '%"+context+"%')  order by review.creattime desc");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
		return list;
	}
	//按类型的先后分页
	public List<Object> getReviews(String type,String orderByKey,Page page) {// 分页显示
		
		String queryString = "select review from " + Review.class.getSimpleName() + " review where review.type =:type and review.status='yes' order by review."+orderByKey+" desc";//
		List<Object> list = entityDao.queryByField(queryString, new String[] { "type" }, new String[] { type },page);
		return list;
	}
	
	public List<Object> getImageReviews(String type,String orderByKey,Page page) {// 分页显示
		
		String queryString = "select review from " + Review.class.getSimpleName() + " review where review.type =:type and review.image!=0 and review.status='yes' order by review."+orderByKey+" desc";//
		List<Object> list = entityDao.queryByField(queryString, new String[] { "type" }, new String[] { type },page);
		return list;
	}
	public List<Object> getNoImageReviews(String type,String orderByKey,Page page) {// 分页显示
		
		String queryString = "select review from " + Review.class.getSimpleName() + " review where review.type =:type and review.image = 0 and review.status='yes' order by review."+orderByKey+" desc";//
		List<Object> list = entityDao.queryByField(queryString, new String[] { "type" }, new String[] { type },page);
		return list;
	}
	public List<Object> getReviews(int page,int pageSize) {//分页显示
		StringBuffer query = new StringBuffer();
		query.append("select review from ").append(Review.class.getSimpleName()).append(" review");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(),page,pageSize);
		return list;
	}
	public List<Object> getReviews(String username,Page page) {//分页显示
		/*StringBuffer query = new StringBuffer();
		query.append("select review from ").append(Review.class.getSimpleName()).append(" review where review.username =:username");*/
		
		String queryString = "select review from " + Review.class.getSimpleName()+ " review where review.username =:username and review.status!='del'";
		
		List<Object> list = entityDao.queryByField(queryString, new String[] { "username" },new String[] { username },page);
		return list;
	}
	public Review getReviewById(String id) {
		return (Review) entityDao.query(Review.class, Integer.valueOf(id));
	}

	public Review getUserByField(String key, String value) {
		return (Review) entityDao.queryByField(Review.class, key, value);
	}

	public boolean saveReview(Review review) {
		
		try {
			entityDao.save(review);//save review
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	public void updateReview(Review review) {
		
		entityDao.update(review);
		
	}

}
