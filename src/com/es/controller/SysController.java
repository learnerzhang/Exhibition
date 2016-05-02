package com.es.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.rewrite.RewriteValve;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.model.AdImage;
import com.es.model.Enterprise;
import com.es.model.Expo;
import com.es.model.Msg;
import com.es.model.Page;
import com.es.model.Review;
import com.es.model.User;
import com.es.service.AdImageService;
import com.es.service.EnterpriseService;
import com.es.service.ExpoService;
import com.es.service.HallService;
import com.es.service.ImageService;
import com.es.service.MsgService;
import com.es.service.ReviewService;
import com.es.service.UserService;
import com.es.util.PageUtil;
import com.es.util.StringUtil;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import sun.net.www.content.text.plain;

@Controller
@RequestMapping("/sys")
public class SysController {

	protected final transient Log log = LogFactory.getLog(SysController.class);
	@Autowired
	public UserService userService;
	@Autowired
	public HallService hallService;
	@Autowired
	public EnterpriseService enterpriseService;
	@Autowired
	public MsgService msgService;
	@Autowired
	public ReviewService reviewService;
	@Autowired
	public ExpoService expoService;
	@Autowired
	public AdImageService adImageService;
	@Autowired
	public ImageService imageService;
	@RequestMapping(value="/login")
	public String login() {
		
		return "view/sys/login";
	}
	
	//登录验证
	@RequestMapping(value="/verify", method =RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AdminLogin(@RequestBody User user, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession httpSession = request.getSession();
		String captcha = (String) httpSession.getAttribute("captcha");
		String vcode = user.getVcode();
		if (!StringUtil.equalWithcode(captcha, vcode)) {
			log.info(captcha + " != " + vcode);
			map.put("code", "1");// 验证码错误
		} else {
			log.info(captcha + " == " + vcode);// 输入正确验证....
			int rs = userService.verifyAdminUser(user);// 验证是否存在该用户
			User  u = userService.getUserByField("username", user.getUsername());
			log.debug(u);
			if (rs == 0) {// 存在.即登录成功.将用户存于Session中去并更新访问次数
				httpSession.setAttribute("admin", u);
			}
			map.put("code", rs);// 返回状态码
		}
		return map;
	}
	//登录验证
	@RequestMapping(value="/logout", method =RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> Adminlogout(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		try {
			session.removeAttribute("admin");
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "-1");
		}
		return map;
	}
	@RequestMapping(value="/index")
	public String index() {
		
		return "view/sys/index";
	}
	@RequestMapping(value="/index/head")
	public String head() {
		
		return "view/inc/head";
	}
	@RequestMapping(value="/index/left")
	public String left() {
		
		return "view/inc/left";
	}
	@RequestMapping(value="/index/main")
	public String main(ModelMap map) {
		
		return "view/sys/main";
	}
	//**系统管理员**/
	@RequestMapping(value="/index/admin")
	public String admin(ModelMap map) {
		
		Page page = PageUtil.createPage(10, 10000, 1);//!!!
		List<Object> admins = userService.getAllAdminUsers(page);
		map.put("admins", admins);
		return "view/sys/admin";
	}
	
	@RequestMapping(value="/index/addAdmin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addAdmin(@RequestBody User user) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(null!=userService.getUserByField("username", user.getUsername())){
			map.put("code", "1");//用户名存在
		}else {
			user.setEmail(user.getUsername()+"@163.com");
			user.setType(2);//管理员标至
			user.setArea("北京市;北京市");
			user.setStatus("yes");
			user.setCompany_name("会展交流综合平台");
			user.setContact(user.getUsername());
			user.setTimes(0);
			user.setExpo(0);
			user.setHall(0);
			user.setInfo(0);
			user.setConsume(0);
			user.setMobile_number("18518067686");
			user.setC_time(new Timestamp(System.currentTimeMillis()));
			if (userService.saveAdmin(user)) {
				map.put("code", "0");
			}
		}
		return map;
	}
	
	@RequestMapping(value="/index/updateAdmin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAdmin(@RequestBody User user) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		User u = userService.getUserByField("username", user.getUsername());
		
		user.setId(u.getId());
		user.setPassword(u.getPassword());
		user.setType(2);//管理员标志
		user.setStatus("yes");
		user.setCompany_name("会展交流综合平台");
		user.setTimes(0);
		user.setExpo(0);
		user.setHall(0);
		user.setInfo(0);
		user.setConsume(0);
		user.setC_time(u.getC_time());

		try {
			userService.updateUser(user);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
	@RequestMapping(value="/index/delAdmin",params="id" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delAdmin(@RequestParam("id") String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		User delAdmin = userService.getUserById(id);
		try {
			userService.deleteUser(delAdmin);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value="/index/updateAdmin",params="id",method=RequestMethod.GET)
	public String updateAdmin(@RequestParam("id") String id,ModelMap modelMap) {
		
		User admin = userService.getUserById(id);
		modelMap.put("admin", admin);
		return "view/sys/updateAdmin";
	}
	/*
	 * 公共管理.....
	 * **/
	@RequestMapping(value="/index/banner",params="page",method=RequestMethod.GET)
	public String banner(@RequestParam("page") String page,ModelMap modelMap) {
		
		int num = adImageService.getAdImageListSize();
		Page p = PageUtil.createPage(5, num, Integer.valueOf(page));//!!!
		List<Object> adimages = adImageService.getAdImage(p);
		modelMap.put("adimages", adimages);
		modelMap.put("page", p);
		return "view/sys/banner";
	}
	
	@RequestMapping(value="/index/msg",params="page",method=RequestMethod.GET)
	public String info(@RequestParam("page") String page,ModelMap modelMap) {
		
		log.debug("Page:"+page);
		int num = msgService.getMsgListSize();
		
		Page p = PageUtil.createPage(5, num, Integer.valueOf(page));//!!!
		
		List<Object> msgs = msgService.getIndexMsg(p);
		modelMap.put("msgs", msgs);
		modelMap.put("page", p);
		return "view/sys/msg";
	}
	
	@RequestMapping(value="/index/msgAdd")
	public String toInfoadd() {
		
		return "view/sys/msgadd";
	}
	
	@RequestMapping(value="/index/banneradd")
	public String toBanneradd() {
		
		return "view/sys/banneradd";
	}
	@RequestMapping(value="/index/addMsg",params="id",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addMsg(@RequestBody Msg msg,@RequestParam("id") String id) {
		
		log.debug(msg);
		Map<String, Object> map = new HashMap<String, Object>();
		msg.setTimestamp(new Timestamp(System.currentTimeMillis()));
		if (msg.getType().equals("2")) {
			msg.setIto("all");
		}
		try {
			if (id==null||"".equals(id)) {
				msgService.addMsg(msg);
				//跟新所有的普通user用户的msg字段
				userService.addUseMsg();
			}else {
				msg.setId(Integer.valueOf(id));
				msgService.updateMsg(msg);
			}
			
			log.info(msg);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value="/index/updateMsg",params="id")
	public String updateMsg(ModelMap modelMap,@RequestParam("id") String id) {
		
		Msg msg = msgService.getMsg(Integer.valueOf(id));
		log.debug(msg);
		modelMap.put("msg", msg);
		return "view/sys/msgadd";
	}
	
	@RequestMapping(value="/index/updateAdImage",params="id")
	public String updateBannerAdImage(ModelMap modelMap,@RequestParam("id") String id) {
		
		AdImage adImage = adImageService.getAdImage(Integer.valueOf(id));
		modelMap.put("adImage", adImage);
		
		return "view/sys/banneradd";
	}
	
	@RequestMapping(value="/index/delMsg",params="id")
	@ResponseBody
	public Map<String, Object> delMsg(@RequestParam("id") String id) {
		Map<String, Object> map = new HashMap<>();
		try {
			msgService.delMsg(Integer.valueOf(id));	
			userService.delUseMsg();
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}	
		return map;
	}
	
	@RequestMapping(value="/index/delAdImage",params="id")
	@ResponseBody
	public Map<String, Object> delAdImage(@RequestParam("id") String id) {
		Map<String, Object> map = new HashMap<>();
		try {
			adImageService.delAdImage(Integer.valueOf(id));	
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}	
		return map;
	}
	@RequestMapping(value="/index/addAdImage",params="id",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addOrUpdateAdImage(@RequestBody AdImage adImage,@RequestParam("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (id==null||"".equals(id)) {
				adImageService.addAdImage(adImage);
			}else {
				adImage.setId(Integer.valueOf(id));
				adImageService.updateAdImage(adImage);
			}
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	/*
	 * 会员管理.....
	 * **/
	///index/vip?page=1
	@RequestMapping(value="/index/vip",params="page")
	public String vip(ModelMap map,@RequestParam("page") String page) {
		
		int num = userService.getAllUserSize();
		Page p = PageUtil.createPage(10, num, Integer.valueOf(page));//!!!
		List<Object> users =  userService.getAllUsers(p);
		
		map.put("page", p);
		map.put("users", users);
		return "view/sys/vip";
	}
	
	@RequestMapping(value="/index/search_vip")
	public String search_vip(ModelMap map,HttpServletRequest request) {
		String context = request.getParameter("context");
		if (context!=null) {
			context = URLDecoder.decode(context);
		}
		Page p = PageUtil.createPage(10, 1000, 1);//!!!
		System.out.println("搜索内容:"+context);
		List<Object> users = null;
		if (null==context||"".equals(context.trim())) {
			users =  userService.getAllUsers(p);//
		}else{
			users = userService.getAllContextUsers(p, context);
		}
		map.put("page", "1");
		map.put("users", users);
		return "view/sys/search_vip";
	}
	@RequestMapping(value="/index/addUser",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addUser(@RequestBody User user) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(null!=userService.getUserByField("username", user.getUsername())){
			map.put("code", "1");//用户名存在
		}else {
			user.setStatus("yes");
			user.setCompany_name("会展交流综合平台");
			user.setTimes(0);
			user.setExpo(0);
			user.setHall(0);
			user.setInfo(0);
			user.setConsume(0);
			user.setC_time(new Timestamp(System.currentTimeMillis()));
			if (userService.saveAdmin(user)) {
				map.put("code", "0");
			}
		}
		return map;
	}
	
	@RequestMapping(value="/index/delVip",params="id" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delVip(@RequestParam("id") String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		User vip = userService.getUserById(id);
		try {
			userService.deleteUser(vip);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
	@RequestMapping(value="/index/changeVipStatus",params="id")
	@ResponseBody
	public Map<String, Object> changeVipStatus(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<>();
		User user = userService.getUserById(id);
		if (user.getStatus().equals("yes")) {
			user.setStatus("no");
		}else if (user.getStatus().equals("no")) {
			user.setStatus("yes");
		}
		try {
			userService.updateUser(user);
			map.put("code", "0");
			map.put("status", user.getStatus());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
	
	@RequestMapping(value="/index/vipadd",params="page")
	public String vipadd(@RequestParam("page") String page,ModelMap map) {
		
		map.put("page", page);
		return "view/sys/vipadd";
	}
	
	/***
	 * 展商管理
	 * **/
	@RequestMapping(value="/index/enterprise",params="page")
	public String enterprise(ModelMap map,@RequestParam("page") String page) {
		
		int num = enterpriseService.getEnterpriseListSize();
		Page p = PageUtil.createPage(10, num, Integer.valueOf(page));//!!!
		List<Object> enterprises = enterpriseService.getEnterpriseSList(p);
		map.put("page", p);
		map.put("enterprises", enterprises);
		
		return "view/sys/enterprise";
	}
	@RequestMapping(value="/index/search_enterprise")
	public String search_enterprise(ModelMap map,HttpServletRequest request) {
		String context = request.getParameter("context");
		if (context!=null) {
			context = URLDecoder.decode(context);
		}
		Page p = PageUtil.createPage(10, 1000, 1);//!!!
		System.out.println("搜索内容:"+context);
		List<Object> enterprises = null;
		if (null==context||"".equals(context.trim())) {
			enterprises =  enterpriseService.getEnterpriseSList(p);
		}else{
			enterprises = enterpriseService.getAllContextEnterprises(p, context);
		}
		map.put("page", "1");
		map.put("enterprises", enterprises);
		return "view/sys/search_enterprise";
	}
	@RequestMapping(value="/index/toUpdateEnterprise",params={"id","page"})
	public String toUpdateEnterprise(ModelMap map,@RequestParam("id") String id,@RequestParam("page") String page) {
		
		Enterprise enterprise = enterpriseService.getEnterpriseById(id);
		map.put("page", page);
		map.put("enterprise", enterprise);
		return "view/sys/updateEnterprise";
	}
	@RequestMapping(value="/index/updateEnterprise")
	@ResponseBody
	public Map<String, Object> updateEnterprise(@RequestBody Enterprise enterprise){
		Map<String, Object> map = new HashMap<>();
		Enterprise en = enterpriseService.getEnterpriseById(String.valueOf(enterprise.getId()));
		en.setStatus("yes");
		en.setAgent(enterprise.getAgent());
		en.setEmail(enterprise.getEmail());
		en.setContact(enterprise.getContact());
		en.setArea(enterprise.getArea());
		en.setCode(enterprise.getCode());
		en.setAddress(enterprise.getAddress());
		
		try {
			enterpriseService.updateEnterprise(en);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value="/index/delEnterprise",params="id")
	@ResponseBody
	public Map<String, Object> delEnterprise(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<>();
		Enterprise enterprise = enterpriseService.getEnterpriseById(id);
		try {
			enterpriseService.deleteEnterprise(enterprise);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value="/index/changeEnterpriseStatus",params="id")
	@ResponseBody
	public Map<String, Object> changeEnterpriseStatus(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<>();
		
		Enterprise enterprise = enterpriseService.getEnterpriseById(id);
		if (enterprise.getStatus().equals("yes")) {
			enterprise.setStatus("no");
		}else if (enterprise.getStatus().equals("no")) {
			enterprise.setStatus("yes");
		}
		try {
			enterpriseService.updateEnterprise(enterprise);
			map.put("code", "0");
			map.put("status", enterprise.getStatus());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	

	/***
	 * 资讯管理
	 * **/
	@RequestMapping(value="/index/review",params="page")
	public String review(ModelMap map,@RequestParam("page") String page) {
		
		int num = reviewService.getReviewListSize();
		Page p = PageUtil.createPage(10, num, Integer.valueOf(page));//!!!
		List<Object> reviews = reviewService.getReviewList(p);
		map.put("page", p);
		map.put("reviews", reviews);
		return "view/sys/review";
	}
	@RequestMapping(value="/index/delReview",params="id")
	@ResponseBody
	public Map<String, Object> delReview(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<>();
		Review review = reviewService.getReviewById(id);
		review.setStatus("del");
		try {
			reviewService.updateReview(review);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value="/index/readReview",params={"id","page"})
	public String readReview(ModelMap map,@RequestParam("page") String page,@RequestParam("id") String id) {
		
		Review review = reviewService.getReviewById(id);
		List<Object> imagelist = imageService.getImages(String.valueOf(id));
		
		map.put("page", page);//用于调转
		map.put("review", review);//正文
		map.put("imagelist", imagelist);//相关图片
		
		return "view/sys/readReview";
	}
	@RequestMapping(value="/index/search_review")
	public String search_review(ModelMap map,HttpServletRequest request) {
		String context = request.getParameter("context");
		if (context!=null) {
			context = URLDecoder.decode(context);
		}
		Page p = PageUtil.createPage(10, 1000, 1);//!!!
		System.out.println("搜索内容:"+context);
		List<Object> reviews = null;
		if (null==context||"".equals(context.trim())) {
			reviews =  reviewService.getReviewList(p);
		}else{
			reviews = reviewService.getAllContextReviews(p, context);
		}
		map.put("page", "1");
		map.put("reviews", reviews);
		return "view/sys/search_review";
	}
	
	@RequestMapping(value="/index/changeReviewStatus",params="id")
	@ResponseBody
	public Map<String, Object> changeReviewStatus(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<>();
		Review review = reviewService.getReviewById(id);
		if (review.getStatus().equals("yes")) {
			review.setStatus("no");
		}else if (review.getStatus().equals("no")) {
			review.setStatus("yes");
		}
		try {
			reviewService.updateReview(review);
			map.put("code", "0");
			map.put("status", review.getStatus());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	/***
	 * 展会管理
	 * **/
	@RequestMapping(value="/index/expo",params="page")
	public String expo(ModelMap map,@RequestParam("page") String page) {
		
		int num = expoService.getExpoListSize();//all
		Page p = PageUtil.createPage(10, num, Integer.valueOf(page));//!!!
		List<Object> expos = expoService.getExpoList(p);
		map.put("page", p);
		map.put("expos", expos);
		
		return "view/sys/expo";
	}
	@RequestMapping(value="/index/changeExpoStatus",params="id")
	@ResponseBody
	public Map<String, Object> changeExpoStatus(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<>();
		Expo expo = expoService.getExpoById(id);
		if (expo.getStatus().equals("yes")) {
			expo.setStatus("no");
		}else if (expo.getStatus().equals("no")) {
			expo.setStatus("yes");
		}
		try {
			expoService.updateExpo(expo);
			map.put("code", "0");
			map.put("status", expo.getStatus());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
	/***
	 * 系统管理
	 * **/
	@RequestMapping(value="/index/managerSys")
	public String toManagerSys(ModelMap map,HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession();
		User admin = (User) httpSession.getAttribute("admin");
		if (admin!=null) {
			User user = userService.getUserByField("username",admin.getUsername());
			map.put("admin",user);
			return "view/sys/changepwd";
		}else {
			return "view/sys/login";
		}
	}
	@RequestMapping(value="/logout")
	@ResponseBody
	public Map<String, Object> logout(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		HttpSession httpSession = request.getSession();
		try {
			httpSession.removeAttribute("admin");
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value="/index/changePassword")
	@ResponseBody
	public Map<String, Object> changePassword(@RequestBody User user) {
		
		Map<String, Object> map = new HashMap<>();
		User admin = userService.getUserByField("username", user.getUsername());
		admin.setPassword(user.getPassword());
		
		try {
			userService.updateUser(admin);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
}
