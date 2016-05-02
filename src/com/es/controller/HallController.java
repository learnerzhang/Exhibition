package com.es.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.es.model.Hall;
import com.es.model.HallImage;
import com.es.model.Image;
import com.es.model.Page;
import com.es.model.User;
import com.es.service.ExpoService;
import com.es.service.HallService;
import com.es.service.UserService;
import com.es.util.PageUtil;


@Controller
@RequestMapping("/hall")
public class HallController {

	protected final transient Log log = LogFactory.getLog(HallController.class);
	@Autowired
	public HallService hallService;
	@Autowired
	public UserService userService;
	@Autowired
	public ExpoService expoService;
	
	@RequestMapping(value = "/{username}/userHall", params = "page")
	public String getAllHall(@PathVariable("username") String username, @RequestParam("page") String page, ModelMap modelMap) {

		log.info("进入用户场馆列表....");
		User user = userService.getUserByField("username", username);
		Page p = PageUtil.createPage(5, user.getReview(), Integer.valueOf(page));
		List<Object> halllist = hallService.getHalls(username, p);

		modelMap.put("halllist", halllist);
		modelMap.put("page", p);
		return "view/user/user_hall";
	}
	
	//"<%=request.getContextPath()%>/hall/${user.username }/listHall"
	@RequestMapping(value = "/{username}/listHall", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listAviableHalls(@PathVariable("username") String username){
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> halls =  hallService.getHalls(username);
		//v1;v2
		String rs="";
		if (halls.size()>0) {
			Hall h = (Hall)halls.get(0);
			rs+=h.getName();
			for(int i=1;i<halls.size();i++){
				h = (Hall)halls.get(i);
				rs+=";"+h.getName();
			}
		}
		map.put("rs", rs);
		return map;
	}
	
	/// "<%=request.getContextPath()%>/review/${user.username }/save",
	@RequestMapping(value = "/{username}/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveHall(@PathVariable("username") String username, @RequestBody Hall hall) {

		Map<String, Object> map = new HashMap<String, Object>();
		hall.setUsername(username);// author
		hall.setStatus("yes");
		hall.setRecommend(10);
		
		hall.setVisit(0);
		hall.setHallimage(0);
		if (hall.getLocPic()=="") {
			hall.setLocPic("loc.jpg");
		}
		if (hallService.getHallByField("name", hall.getName()) != null) {
			map.put("code", "-1");// 展览馆已经被人注册
		} else {
			if (hallService.saveHall(hall)) {
				User user = userService.getUserByField("username", username);
				user.setHall(user.getHall() + 1);
				userService.updateUser(user);// 更新用户的Hall数量
				map.put("code", "0");
			} else {
				map.put("code", "-2");
			}
		}
		return map;
	}

	// $("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username}/hall?id="+id+"&page="+page);
	@RequestMapping(value = "/{username}/hall", params = { "id", "page" })
	public String editHall(@PathVariable("username") String username, @RequestParam("id") String id,@RequestParam("page") String page, ModelMap modelMap) {

		Hall hall = hallService.getHallById(id);
		modelMap.put("hall", hall);
		modelMap.put("page", page);
		// reviewService.
		return "view/user/hall";
	}
	@RequestMapping(value = "/{username}/hallImage", params = { "id", "page" })
	public String addHallImage(@PathVariable("username") String username, @RequestParam("id") String id,@RequestParam("page") String page, ModelMap modelMap) {

		List<Object> hallImages = hallService.getHallImageList(id);//pageSize：8
		modelMap.put("username", username);
		modelMap.put("page", page);
		modelMap.put("id", id);
		
		int i=0;
		for (Object himage : hallImages) {
			modelMap.put("himage_"+i, himage);
			i+=1;
		}
		// reviewService.
		return "view/user/hallimage";
	}

	// $("#div").empty().load("<%=request.getContextPath()%>/review/${user.username}/addReview");
	@RequestMapping(value = "/{username}/delHall", params = "id", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delHall(@PathVariable("username") String username, @RequestParam("id") String id,ModelMap modelMap) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Hall hall = hallService.getHallById(id);
			hall.setStatus("del");// 0 待审核,1通过审核,2 del;

			hallService.updateHall(hall);
			User user = userService.getUserByField("username", username);
			user.setHall(user.getHall() - 1);
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
	public Map<String, Object> updateHall(@PathVariable("username") String username,@RequestParam("id") String id,@RequestBody Hall hall) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Hall h = hallService.getHallById(id);
		hall.setHallimage(h.getHallimage());
		hall.setId(Integer.valueOf(id));
		hall.setRecommend(h.getRecommend());
		hall.setVisit(h.getVisit());
		hall.setUsername(username);
		hall.setStatus("no");//0 待审核 1 通过 2 del
		
		try {
			hallService.updateHall(hall);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "-1");
		}
		
		return map;
	}
	
	@RequestMapping(params = "id")
	public String loadHall(ModelMap modelMap,@RequestParam("id") String id){
		
		Hall hall = hallService.getHallById(id);
		
		Integer visit = hall.getVisit()+1;
		Integer recommend = (int) (10+90.0/(1+10.0/visit));
		hall.setVisit(visit);
		hall.setRecommend(recommend);
		hallService.updateHall(hall);
		
		List<Object> olds = expoService.getOldExpos(1, 5, "venue", hall.getName());
		List<Object> news =expoService.getNewExpos(1, 5, "venue", hall.getName());
		List<Object> iList = hallService.getHallImageList(id);
		if (iList.size()>0) {
			modelMap.put("image", iList.get(0));
		}
		
		
		modelMap.put("hall", hall);
		modelMap.put("olds", olds);
		modelMap.put("news", news);
		
		return "view/hall/hall";
	}
	
	@RequestMapping(value="/pic",params = "id")
	public String loadHallPic(ModelMap modelMap,@RequestParam("id") String id){
		
		List<Object> images = hallService.getHallImageList(id);
		modelMap.put("images", images);
		
		return "view/hall/pics";
	}
	
	@RequestMapping(value="/profile" ,params = "id")
	public String loadHallProfile(ModelMap modelMap,@RequestParam("id") String id){
		
		Hall hall = hallService.getHallById(id);
		modelMap.put("hall", hall);
		
		return "view/hall/profile";
	}
	
	@RequestMapping(value="/expo" ,params = "id")
	public String loadHallExpo(ModelMap modelMap,@RequestParam("id") String id){
		
		Hall hall = hallService.getHallById(id);
		List<Object> olds = expoService.getOldExpos(1, 8, "venue", hall.getName());
		List<Object> news =expoService.getNewExpos(1, 8, "venue", hall.getName());
		
		modelMap.put("olds", olds);
		modelMap.put("news", news);
		return "view/hall/expoInfo"; 
	}
	@RequestMapping(value="/contact" ,params = "id")
	public String loadHallContact(ModelMap modelMap,@RequestParam("id") String id){
		
		Hall hall = hallService.getHallById(id);
		User user = userService.getUserByField("username", hall.getUsername());
		modelMap.put("user", user);
		modelMap.put("hall", hall);
		
		return "view/hall/contact"; 
	}
}
