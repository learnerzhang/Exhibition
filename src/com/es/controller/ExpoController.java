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

import com.es.model.Expo;
import com.es.model.Hall;
import com.es.model.Page;
import com.es.model.Review;
import com.es.model.User;
import com.es.service.ExpoService;
import com.es.service.UserService;
import com.es.util.PageUtil;

@Controller
@RequestMapping("/expo")
public class ExpoController {

	protected final transient Log log = LogFactory.getLog(ExpoController.class);
	@Autowired
	public ExpoService expoService;
	@Autowired
	public UserService userService;

	@RequestMapping(params = "id", method = RequestMethod.GET)
	public String center(@RequestParam("id") String id, ModelMap map, HttpServletRequest request) {
		// 判断Session是否有user对象
		// 用户已登录,则获取用户info
		//System.out.println("ok");
		Expo expo = expoService.getExpoById(id);
		Integer visit = expo.getVisit_number()+1;
		Integer recommend = (int) (10+90.0/(1+10.0/visit));
		
		expo.setRecommend(recommend);
		expo.setVisit_number(visit);
		expoService.updateExpo(expo);
		
		User user = userService.getUserByField("username", expo.getUsername());
		map.put("expo", expo);
		map.put("user", user);
		
		return "view/expo/expo";
	}

	/// "<%=request.getContextPath()%>/review/${user.username }/save",
	@RequestMapping(value = "/{username}/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveExpo(@PathVariable("username") String username, @RequestBody Expo expo) {

		Map<String, Object> map = new HashMap<String, Object>();
		User user = userService.getUserByField("username", username);
		
		expo.setArea(user.getArea());
		expo.setUsername(username);// author
		expo.setStatus("no");
		expo.setRecommend(10);//默认设置10;
		expo.setCertified("0");
		expo.setVisit_number(0);

		if (expoService.getExpoByField("name", expo.getName()) != null) {
			map.put("code", "-1");// 展览馆已经被人注册
		} else {
			if (expoService.saveExpo(expo)) {
				user.setExpo(user.getExpo()+1);
				userService.updateUser(user);// 更新用户的Expo数量
				map.put("code", "0");
			} else {
				map.put("code", "-2");
			}
		}
		return map;
	}
	//("<%=request.getContextPath()%>/expo/${user.username}/expo?id="+id+"&page="+page)
	@RequestMapping(value = "/{username}/expo",params ={"id","page"})
	public String editExpo(@PathVariable("username") String username,@RequestParam("id") String id,@RequestParam("page") String page,ModelMap modelMap) {
		
		Expo expo = expoService.getExpoById(id);
		modelMap.put("expo", expo);
		modelMap.put("page", page);
		//reviewService.
		return "view/user/expo";
	}

	// ("<%=request.getContextPath()%>/expo/${user.username }/userExpo?page=1");
	@RequestMapping(value = "/{username}/userExpo", params = "page")
	public String listExpo(@PathVariable("username") String username, @RequestParam("page") String page,
			ModelMap modelMap) {

		log.info("进入用户展会列表....");
		User user = userService.getUserByField("username", username);
		Page p = PageUtil.createPage(5, user.getExpo(), Integer.valueOf(page));
		
		List<Object> expolist = expoService.getExpos(username, p);

		modelMap.put("expolist", expolist);
		modelMap.put("page", p);
		return "view/user/user_expo";
	}
	// ("<%=request.getContextPath()%>/user/${user.username}/addExpo");
	
	
	
	//"<%=request.getContextPath()%>/expo/${user.username }/update?id=${expo.id }"
	
	@RequestMapping(value = "/{username}/update",params = "id")
	@ResponseBody
	public Map<String, Object> updateExpo(@PathVariable("username") String username,@RequestParam("id") String id,@RequestBody Expo expo,ModelMap modelMap) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Expo e = expoService.getExpoById(id);
		
		e.setName(expo.getName());
		e.setVenue(expo.getVenue());
		e.setStartline(expo.getStartline());
		e.setDeadline(expo.getDeadline());
		e.setIndustry(expo.getIndustry());
		e.setA(expo.getA());
		e.setArea(expo.getArea());
		e.setB(expo.getB());
		e.setC(expo.getC());
		e.setOrganizer(expo.getOrganizer());
		e.setAbout_organizer(expo.getAbout_organizer());
		e.setContact(expo.getContact());
		e.setUndertaker(expo.getUndertaker());
		e.setCo_organizer(expo.getCo_organizer());
		e.setExpo_description(expo.getExpo_description());
		e.setExpo_price(expo.getExpo_price());
		e.setPromotions(expo.getPromotions());
		e.setAd(expo.getAd());
		e.setAudience_require(expo.getAudience_require());
		e.setExpo_introduction(expo.getExpo_introduction());
		e.setProduct_area(expo.getProduct_area());
		e.setProduct_feature(expo.getProduct_feature());
		e.setStatus("no");//0 待审核 1 通过 2 del
		
		try {
			expoService.updateExpo(e);;
			map.put("code", "0");
		} catch (Exception ex) {
			// TODO: handle exception
			map.put("code", "-1");
		}
		return map;
	}

}
