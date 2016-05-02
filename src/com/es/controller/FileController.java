package com.es.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.cache.infinispan.util.FlagAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.es.model.Hall;
import com.es.model.HallImage;
import com.es.model.Image;
import com.es.model.Review;
import com.es.service.ExpoService;
import com.es.service.HallService;
import com.es.service.ImageService;
import com.es.service.ReviewService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_ADDPeer;

@Controller
public class FileController {
	protected final transient Log log = LogFactory.getLog(FileController.class);

	@Autowired
	public ImageService imageService;
	@Autowired
	public ReviewService reviewService;
	@Autowired
	public HallService hallService;
	@RequestMapping(value="/upload")
	@ResponseBody
	public Map<String, Object>  upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object>  map = new HashMap<String, Object>();
		
		String upLoadImageDir = "/resources/upload/";
		String upLoadImageRealPathDir = request.getSession().getServletContext().getRealPath(upLoadImageDir);
		File ImageFileDir = new File(upLoadImageRealPathDir);
		if (!ImageFileDir.exists()) {
			ImageFileDir.mkdirs();
		}
		String imageName = "";
		if (!file.isEmpty()) {
			String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			imageName = UUID.randomUUID() + suffix;// 构建文件名称
			System.out.println(imageName);
			String fileName = upLoadImageRealPathDir + File.separator + imageName;
			File f = new File(fileName);
			try {
				file.transferTo(f);
				map.put("src", imageName);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return map;
	}
	///saveImage/review?id=${review_id}
	@RequestMapping(value="/saveImage/review",params="id")
	@ResponseBody
	public Map<String, Object> saveImage(@RequestBody ArrayList<String> list,@RequestParam String id){
		
		boolean flag = true;
		Map<String, Object> map =new  HashMap<String, Object>();
		Review r = reviewService.getReviewById(id);
		List<Object> imagelist = imageService.getTimeImages(id);
		for (Object image : imagelist) {
			imageService.deleteImage((Image)image);
		}
		for (int i = 0; i < list.size(); i++) {
			String oname = list.get(i).split(";")[0];
			String nname = list.get(i).split(";")[1];
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			Image image = new Image();
			image.setNname(nname);
			image.setOname(oname);
			image.setTimestamp(timestamp);
			image.setReview_id(id);
			image.setReview_title(r.getTitle());
			if(!imageService.saveImage(image))
			{
				System.out.println("--------------------");
				flag = false;
			}
		}
		if (flag) {
			r.setImage(list.size());
			
			try {
				reviewService.updateReview(r);
				map.put("code","0");
			} catch (Exception e) {
				// TODO: handle exception
				map.put("code","-1");
			}
		}else {
			map.put("code","-1");
		}
		return map;
	}
	
	///saveImage/review?id=${review_id}
		@RequestMapping(value="/saveImage/{username}/hallImage",params="id")
		@ResponseBody
		public Map<String, Object> saveHallImage(@PathVariable("username") String username,@RequestBody ArrayList<String> list,@RequestParam String id){
			
			Map<String, Object> map =new  HashMap<String, Object>();
			Hall hall = hallService.getHallById(id);
			hallService.delHallImageByHallId(id);//删除
			boolean flag = true;
			for (String ss : list) {
				String oname = ss.split(";")[0];
				String src = ss.split(";")[1];
				HallImage image = new HallImage();
				image.setSrc(src);
				image.setOname(oname);
				image.setUsername(username);
				image.setHall_id(id);
				if (!hallService.saveHallImage(image)) {
					flag = false;
				}
			}
			if (flag) {
				hall.setHallimage(list.size());
				try {
					//System.out.println(hall.getHallimage()+" ::::::");
					hallService.updateHall(hall);
					map.put("code","0");
				} catch (Exception e) {
					// TODO: handle exception
					map.put("code","-1");
				}
			}else {
				map.put("code","-1");
			}
			return map;
		}
}
