package com.es.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.es.dao.EntityDao;
import com.es.model.Image;
@Service
public class ImageService {

	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(ImageService.class);
	
	public List<Object> getTimeImages(String review_id) {
		
		String queryString = "select image from " + Image.class.getSimpleName() + " image where image.review_id =:review_id order by image.timestamp desc";//
		List<Object> list = entityDao.queryByField(queryString, new String[] { "review_id" }, new String[] { review_id });
		return list;
	}
	
	public List<Object> getNewImages(int num) {
		/*
		*
		*	(Class clazz, String tablename, String group, String order, int num)
		**/
		List<Object> list = entityDao.queryIndexList(Image.class, "image", "review_id", "timestamp", num);
		return list;
	}

	public Integer getImageNum(String review_id) {

		List<Object> list = entityDao.queryListByField(Image.class, "review_id", review_id);
		return list.size();
	}
	
	public List<Object> getImages(String review_id) {

		List<Object> list = entityDao.queryImageListByField(Image.class, "review_id", review_id,"timestamp");
		return list;
	}
	
	public List<Object> getIndexImages() {

		List<Object> list = entityDao.queryIndexList(Image.class,"image","review_id","timestamp",5);
		return list;
	}
	
	public Image getImageById(String id) {
		return (Image) entityDao.query(Image.class, Integer.valueOf(id));
	}

	public Image getImagerByField(String key, String value) {
		return (Image) entityDao.queryByField(Image.class, key, value);
	}

	public boolean saveImage(Image image) {

		try {
			entityDao.save(image);// save image
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void updateImage(Image image) {

		entityDao.update(image);

	}
	public void deleteImage(Image image)
	{
		entityDao.delete(image);
	}
}
