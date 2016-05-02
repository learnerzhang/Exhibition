package com.es.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.dao.EntityDao;
import com.es.model.AdImage;
import com.es.model.Page;

@Service
public class AdImageService {
	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(AdImageService.class);
	
	public List<Object> getAdImage(Page page) {
		
		String queryString = "select image from " + AdImage.class.getSimpleName() + " image  order by image.sort asc";//
		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	
	public List<Object> getIndexAdImage(Page page) {
		
		String queryString = "select image from " + AdImage.class.getSimpleName() + " image where image.status!='no' order by image.sort asc";//
		List<Object> list = entityDao.createQuery(queryString, page.getCurrentPage(), page.getEveryPage());
		return list;
	}
	public Integer getAdImageListSize() {
		
		String queryString = "select image from " + AdImage.class.getSimpleName() + " image";//
		List<Object> list = entityDao.createQuery(queryString);
		return list.size();
	}
	
	public AdImage getAdImage(Integer id) {
		
		entityDao.query(AdImage.class, id);
		return (AdImage) entityDao.query(AdImage.class, id);
	}
	
	public void addAdImage(AdImage adImage) {
		
		entityDao.save(adImage);
	}
	
	public void updateAdImage(AdImage adImage) {
		
		entityDao.update(adImage);
	}
	
	public void delAdImage(Integer id) {
		
		Object adImage = entityDao.query(AdImage.class, id);
		entityDao.delete(adImage);
	}
}
