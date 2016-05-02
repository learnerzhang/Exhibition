package com.es.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.model.Page;
import com.es.model.Review;
import com.es.model.User;
import com.es.service.ImageService;
import com.es.service.ReviewService;
import com.es.service.UserService;
import com.es.util.PageUtil;
@Controller
@RequestMapping("/review")
public class ReviewController{

	protected final transient Log log = LogFactory.getLog(ReviewController.class);
	
	@Autowired
	public ReviewService reviewService;
	@Autowired
	public UserService userService;
	@Autowired
	public ImageService imageService;
	
	public ReviewController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/{username}/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveReview(@PathVariable("username") String username,@RequestBody Review review) {
		//User user = null;
		//user = userService.getUserByField("username", username);
		//log.info(user);
		//map.put("user", user);
		Map<String, Object> map = new HashMap<String, Object>();
		review.setUsername(username);//author
		review.setStatus("no");
		review.setImage(0);
		review.setReadtime(0);
		log.info(review);
		
		if (reviewService.saveReview(review)) {
			
			User user = userService.getUserByField("username", username);
			user.setReview(user.getReview()+1);
			userService.updateUser(user);//更新用户
			map.put("code", "0");
		}else {
			map.put("code", "-1");
		}
		return map;
	}
	
	@RequestMapping(value = "/{username}/userReview",params = "page")
	public String listReview(@PathVariable("username") String username,@RequestParam("page") String page,ModelMap modelMap){
		
		log.info("进入用户投稿列表....");
		User user = userService.getUserByField("username", username);
		Page p = PageUtil.createPage(5, user.getReview(), Integer.valueOf(page));
		List<Object> reviewlist =  reviewService.getReviews(username,p);

		modelMap.put("reviewlist", reviewlist);
		modelMap.put("page", p);
		return "view/user/user_review";
	}
	//$("#div").empty().load("<%=request.getContextPath()%>/review/${user.username}/review?id="+id);
	@RequestMapping(value = "/{username}/review",params ={"id","page"})
	public String editReview(@PathVariable("username") String username,@RequestParam("id") String id,@RequestParam("page") String page,ModelMap modelMap) {
		
		Review review = reviewService.getReviewById(id);
		modelMap.put("review", review);
		modelMap.put("page", page);
		log.info(review);
		//reviewService.
		return "view/user/review";
	}
	//$("#div").empty().load("<%=request.getContextPath()%>/review/image/review?id="+id+"&page="+page);
	@RequestMapping(value = "{username}/image/review",params ={"id","page"})
	public String image(@PathVariable("username") String username,@RequestParam("id") String id,@RequestParam("page") String page,ModelMap modelMap) {
		
		List<Object> images = imageService.getImages(id);
		modelMap.put("review_id", id);
		int i=0;
		for (Object image : images) {
			modelMap.put("himage_"+i, image);
			i+=1;
		}
		modelMap.put("page", page);
		modelMap.put("username", username);
		//reviewService.
		return "view/user/imageinfo";//获取用户信息
	}
	
	//$("#div").empty().load("<%=request.getContextPath()%>/review/${user.username}/addReview");
	@RequestMapping(value = "/{username}/delReview",params ="id",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delReview(@PathVariable("username") String username,@RequestParam("id") String id,ModelMap modelMap) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Review review = reviewService.getReviewById(id);
			review.setStatus("del");//0 待审核,1通过审核,2 del;
			
			reviewService.updateReview(review);
			
			User user = userService.getUserByField("username", username);
			user.setReview(user.getReview()-1);
			userService.updateUser(user);
			map.put("code", "0");
			
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "-1");
			
		}
		
		return map;
	}
	
	@RequestMapping(value = "/{username}/update",params = "id")
	@ResponseBody
	public Map<String, Object> updateReview(@PathVariable("username") String username,@RequestParam("id") String id,@RequestBody Review review,ModelMap modelMap) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Review r = reviewService.getReviewById(id);
		
		review.setId(r.getId());
		review.setImage(r.getImage());
		review.setReadtime(r.getReadtime());
		review.setStatus("no");//0 待审核 1 通过 2 del
		
		try {
			reviewService.updateReview(review);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "-1");
		}
		
		return map;
	}
}
