package com.es.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.es.model.Msg;
import com.es.model.Page;
import com.es.model.User;
import com.es.service.MsgService;
import com.es.service.UserService;
import com.es.util.PageUtil;
import com.es.util.StringUtil;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/user")
public class UserController {
	protected final transient Log log = LogFactory.getLog(UserController.class);
	@Autowired
	public UserService userService;
	@Autowired
	public MsgService msgService;

	public UserController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(params = "method=register")
	public String register(ModelMap modelMap, HttpServletRequest request) {
		System.out.println("注册页面...");
		return "view/user/user_register";
	}

	@RequestMapping(params = "method=login")
	public String login(ModelMap modelMap, HttpServletRequest request) {
		System.out.println("登录页面...");
		return "view/user/user_login";
	}

	@RequestMapping(params = "method=add", method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> addUser(@RequestBody User user) throws IOException {
		System.out.println("添加用户....");
		user.setStatus("no");// waiting for checking....
		log.info(user);
		int rs = userService.saveUser(user);

		Map<String, Object> map = new HashMap<String, Object>();
		// data={code:val} val:-1,0,1,2,3,
		map.put("code", rs);
		return map;
	}

	@RequestMapping(params = "method=verify", method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> Verify(@RequestBody User user, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession httpSession = request.getSession();

		String captcha = (String) httpSession.getAttribute("captcha");
		String vcode = user.getVcode();
		if (!StringUtil.equalWithcode(captcha, vcode)) {
			log.info(captcha + " != " + vcode);
			map.put("code", "1");// 验证码错误
		} else {

			log.info(captcha + " == " + vcode);// 输入正确验证....
			int rs = userService.verifyUser(user);// 验证是否存在该用户
			if (rs == 0) {// 存在.即登录成功.将用户存于Session中去并更新访问次数
				User u = userService.getUserByField("username", user.getUsername());
				u.setTimes(u.getTimes() + 1);
				userService.updateUser(u);

				httpSession.setAttribute("user", user);
			}
			map.put("code", rs);// 返回状态码
		}
		return map;
	}

	@RequestMapping(params = "method=logout")
	@ResponseBody
	public Map<String, Object> logout(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		HttpSession httpSession = request.getSession();
		try {
			httpSession.removeAttribute("user");
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}

	@RequestMapping(value = "/{username}", method = RequestMethod.GET)
	public String center(@PathVariable("username") String username, ModelMap map, HttpServletRequest request) {
		// 判断Session是否有user对象
		User user = null;
		// 用户已登录,则获取用户info
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_info";
	}

	@RequestMapping(value = "/{username}/userBase", method = RequestMethod.GET)
	public String user_base(@PathVariable("username") String username, ModelMap map, HttpServletRequest request) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_base";
	}

	@RequestMapping(value = "/{username}/user_changepassword", method = RequestMethod.GET)
	public String user_changepassword(@PathVariable("username") String username, ModelMap map,
			HttpServletRequest request) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_changepassword";
	}

	@RequestMapping(value = "/{username}/userCenter", method = RequestMethod.GET)
	public String user_info(@PathVariable("username") String username, ModelMap map, HttpServletRequest request) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		Integer msgNum =msgService.getUserMsgListSize(username);
		map.put("user", user);
		return "view/user/user_center";
	}
	@RequestMapping(value = "/changepwd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changpwd(@RequestBody User user, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		// user = userService.getUserByField("username", user.getUsername());
		// map.put("user", user);
		if (userService.verifyUser(user) != 0) {
			map.put("code", "-1");// 密码不正确
		} else {
			if (user.getPassword().trim().equals(user.getNew_password().trim())) {
				map.put("code", "-2");// 新旧密码相同
			} else {
				String newpwd = user.getNew_password();
				user = userService.getUserByField("username", user.getUsername());
				user.setPassword(newpwd);// 设置新密码
				userService.updateUser(user);
				map.put("code", "0");
			}
		}
		return map;
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editUser(@RequestBody User user, HttpServletRequest request) {
		User u = userService.getUserByField("username", user.getUsername());
		log.info(u);
		boolean flag = true;
		if (u.getCompany_name()!=user.getCompany_name()) {
			u.setCompany_name(user.getCompany_name());
			flag = false;
		}
		if (u.getContact()!=user.getContact()) {
			u.setContact(user.getContact());
			flag = false;
		}
		if (user.getU_id()!="" && u.getU_id()!=user.getU_id()) {
			u.setU_id(user.getU_id());
			flag = false;
		}
		if (u.getArea()!=user.getArea()) {
			u.setArea(user.getArea());
			flag = false;
		}
		if (user.getMobile_number()!=""&& u.getMobile_number()!=user.getMobile_number()) {
			u.setMobile_number(user.getMobile_number());
			flag = false;
		}
		if (u.getEmail()!=user.getEmail()) {
			u.setEmail(user.getEmail());
			flag = false;
		}
		if (u.getAddress()!=user.getAddress()) {
			u.setAddress(user.getAddress());
			flag = false;
		}
		
		if (u.getCode()!=user.getCode()) {
			u.setCode(user.getCode());
			flag = false;
		}
		log.info(u);
		Map<String, Object> map = new HashMap<String, Object>();
		// user = userService.getUserByField("username", user.getUsername());
		// map.put("user", user);
		if (!flag) {
			try {
				userService.updateUser(u);//更新当前用户的资料
				map.put("code", "0");
			} catch(Exception e) {
				// TODO: handle finally clause
				map.put("code", "-1");
			}
		}else {//资料未更新....不需要db操作
			map.put("code", "0");
		}
		return map;
	}
	//user contribute the review
	@RequestMapping(value = "/{username}/addReview", method = RequestMethod.GET)
	public String userReview(@PathVariable("username") String username, ModelMap map) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_add_review";
	}
	
	//user contribute the review
	@RequestMapping(value = "/{username}/sendMsg", method = RequestMethod.GET)
	public String userSendMsg(@PathVariable("username") String username, ModelMap map) {
		
		return "view/user/sendMsg";
	}
	
	@RequestMapping(value = "/{username}/msg",params="id", method = RequestMethod.GET)
	public String msgById(@PathVariable("username") String username,@RequestParam("id") String id ,ModelMap map) {
		
		Msg msg = msgService.getMsg(Integer.valueOf(id));
		map.put("msg", msg);
		return "view/user/msg";
	}
	
	@RequestMapping(value = "/{username}/msgList",params = "page")
	public String userMsg(@PathVariable("username") String username,@RequestParam("page") String page, ModelMap map) {
		log.debug("Get THE Msg...........to : "+username);
		int totalCount = msgService.getUserMsgListSize(username);
		Page p = PageUtil.createPage(5, totalCount, Integer.valueOf(page));
		List<Object> msgs =msgService.getUserIndexInfo(p, username);
		log.debug("获取消息...."+msgs.size());
		map.put("msgs", msgs);
		map.put("page", p);
		return "view/user/user_msg";
	}
	
	@RequestMapping(value="/{username}/resend",params="id")
	public String sendMsg(@RequestParam("id") String id,ModelMap map) {
		
		Msg msg = msgService.getMsg(Integer.valueOf(id));
		map.put("msg", msg);
		return "view/user/re_msg";
	}
	
	@RequestMapping(value="/{username}/send",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMsg(@RequestBody Msg msg) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		msg.setTimestamp(new Timestamp(System.currentTimeMillis()));
		
		try {
			msgService.addMsg(msg);
			userService.addUseMsgByName(msg.getIto());
			log.info(msg);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	@RequestMapping(value = "/names",params="type")
	@ResponseBody
	public Map<String, Object> userSet(@RequestParam String type,HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		List<Object> list = userService.getAllUser(type);
		log.debug("names Size: "+list.size());
		String name = "";
		for(Object object :list){
			User user = (User) object;
			name+=user.getUsername()+"&";
		}
		map.put("name",name.subSequence(0, name.length()-1));
		return map;
	}
	
	//user add hall which is expo
	@RequestMapping(value = "/{username}/addHall", method = RequestMethod.GET)
	public String userHall(@PathVariable("username") String username, ModelMap map) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_add_hall";
	}
	@RequestMapping(value = "/{username}/addEnterprise", method = RequestMethod.GET)
	public String userEnterprise(@PathVariable("username") String username, ModelMap map) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_add_enterprise";
	}
	
	@RequestMapping(value = "/{username}/addExpo", method = RequestMethod.GET)
	public String userExpo(@PathVariable("username") String username, ModelMap map) {
		User user = null;
		user = userService.getUserByField("username", username);
		log.info(user);
		map.put("user", user);
		return "view/user/user_add_expo";
	}
}
