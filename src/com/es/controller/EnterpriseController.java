package com.es.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.es.model.Enterprise;
import com.es.model.Page;
import com.es.model.Review;
import com.es.model.User;
import com.es.service.EnterpriseService;
import com.es.service.UserService;
import com.es.util.PageUtil;

import sun.net.idn.Punycode;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {
	protected final transient Log log = LogFactory.getLog(EnterpriseController.class);
	@Autowired
	private EnterpriseService enterpriseService;
	@Autowired
	private UserService userService;
	
	public EnterpriseController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping
	public String load(ModelMap modelMap) {
		System.out.println("显示所有的Enterprises...");
		List<Object> list = enterpriseService.getEnterpriseList();
		modelMap.put("list", list);
		return "view/enterprise/enterprises";
	}
	
	@RequestMapping(params="id")
	public String loadEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		map.put("enterprise", enterprise);
		
		return "view/enterprise/enterprise";
	}
	@RequestMapping(value="/index",params="id")
	public String loadIndexEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		map.put("enterprise", enterprise);
		
		return "view/enterprise/index";
	}
	@RequestMapping(value="/about_us",params="id")
	public String loadAoutEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		map.put("enterprise", enterprise);
		
		return "view/enterprise/about_us";
	}
	@RequestMapping(value="/newslist",params="id")
	public String loadNewsEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		map.put("enterprise", enterprise);
		
		return "view/enterprise/newslist";
	}
	@RequestMapping(value="/manager",params="id")
	public String loadManagerEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		map.put("enterprise", enterprise);
		
		return "view/enterprise/manager";
	}
	@RequestMapping(value="/products",params="id")
	public String loadProductEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		map.put("enterprise", enterprise);
		
		return "view/enterprise/products";
	}
	@RequestMapping(value="/contact",params="id")
	public String loadContactEnterprise(ModelMap map,@RequestParam("id") String id){
		
		Enterprise  enterprise = enterpriseService.getEnterpriseById(id);
		User user = userService.getUserByField("username", enterprise.getUsername());
		map.put("enterprise", enterprise);
		map.put("user", user);
		
		return "view/enterprise/contact_us";
	}
	
	
	@RequestMapping(params = "method=add")
	public String add(ModelMap modelMap, HttpServletRequest request) {
		System.out.println("添加页面...");
		return "view/enterprise/enterprise_add";
	}

	@RequestMapping(params = "method=edit")
	public String edit(@RequestParam("id") String id, ModelMap modelMap) {
		System.out.println("编辑页面...");
		Enterprise enterprise = enterpriseService.getEnterpriseById(id);
		System.out.println("Edit: " + enterprise);
		modelMap.put("enterprise", enterprise);
		return "view/enterprise/enterprise_edit";
	}

	@RequestMapping(params = "method=update")
	public void update(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println("执行更新操作....");
		String name = request.getParameter("name");
		String agent = request.getParameter("agent");
		String password = request.getParameter("password");
		String context = request.getParameter("context");

		Enterprise enterprise = enterpriseService.getEnterpriseById(id);//根据ID获取原来的数据
		enterprise.setId(Integer.valueOf(id));
		enterprise.setName(name);
		enterprise.setAgent(agent);
		enterprise.setStatus("yes");

		PrintWriter out = response.getWriter();
		try {
			System.out.println("Update: " + enterprise);
			enterpriseService.updateEnterprise(enterprise);
			out.print("{\"update\",\"true\"}");
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			out.print("{\"update\",\"false\"}");
		}
	}

	@RequestMapping(params = "method=save")
	public String save(ModelMap modelMap, HttpServletRequest request) throws UnsupportedEncodingException {

		String name = request.getParameter("name");
		String agent = request.getParameter("agent");
		String password = request.getParameter("password");
		String context = request.getParameter("context");

		Enterprise enterprise = new Enterprise();

		Timestamp timestamp = new Timestamp(new Date().getTime());//企业入住的时间点
		enterprise.setName(name);
		enterprise.setAgent(agent);
		enterprise.setTime(timestamp);
		
		System.out.println(enterprise.toString());
		try {
			enterpriseService.saveEnterprise(enterprise);
			modelMap.put("msg", "添加成功");
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			modelMap.put("msg", "添加失败");
		}
		return "view/enterprise/enterprise_add";
	}

	@RequestMapping(params = "method=del")
	public void delete(@RequestParam("id") String id, HttpServletResponse response) throws IOException {
		System.out.println("执行删除操作....");
		try {
			Enterprise enterprise = enterpriseService.getEnterpriseById(id);
			System.out.println(enterprise);
			enterpriseService.deleteEnterprise(enterprise);
			System.out.println("Delete:" + enterprise);

			response.getWriter().print("true");
		} catch (Exception e) {
			log.error(e.getMessage());
			response.getWriter().print("false");
		}
	}
	
	///enterprise/${user.username }"
	@RequestMapping(value="/{username}/userEnterprise",params = "page")
	public String getEnterprise(@PathVariable("username") String username,@RequestParam("page") String page,ModelMap modelMap) {
		
		Page p = PageUtil.createPage(5, enterpriseService.getEnterpriseByUserListSize(username), Integer.valueOf(page));
		List<Object> enterprises = enterpriseService.getEnterpriseList(username,p);
		
		modelMap.put("enterprises", enterprises);
		modelMap.put("page", p);
		
		return "view/user/user_enterprise";
	}
	@RequestMapping(value = "/{username}/enterprise",params ={"id","page"})
	public String editEnterprise(@PathVariable("username") String username,@RequestParam("id") String id,@RequestParam("page") String page,ModelMap modelMap) {
		
		Enterprise enterprise = enterpriseService.getEnterpriseById(id);
		modelMap.put("enterprise", enterprise);
		modelMap.put("page", page);
		//reviewService.
		return "view/user/enterprise";
	}
	@RequestMapping(value="/{username}/delEnterprise",params="id",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delEnterprise(@PathVariable("username") String username,@RequestParam("id") String id)
	{
		Map<String, Object> map = new HashMap<>();
		Enterprise enterprise = enterpriseService.getEnterpriseById(id);
		enterprise.setStatus("del");
		try {
			enterpriseService.updateEnterprise(enterprise);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	//enterprise/${user.username }/save",
	@RequestMapping(value="/{username}/save",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveEnterprise(@RequestBody Enterprise enterprise)
	{
		Map<String, Object> map = new HashMap<>();
		try {
			if (null!=enterpriseService.getEnterpriseByName(enterprise.getUsername())) {
				map.put("code", "1");
			}else {
				
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				enterprise.setTime(timestamp);
				enterprise.setStatus("no");
				enterpriseService.saveEnterprise(enterprise);
				
				map.put("code", "0");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "2");
		}
		return map;
	}
	//enterprise/${user.username }/update",
	@RequestMapping(value="/{username}/update",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEnterprise(@RequestBody Enterprise enterprise)
	{
		Enterprise e = enterpriseService.getEnterpriseById(String.valueOf(enterprise.getId()));
		Map<String, Object> map = new HashMap<>();
		enterprise.setStatus("no");
		enterprise.setTime(e.getTime());
		
		try {
			enterpriseService.updateEnterprise(enterprise);
			map.put("code", "0");
		} catch (Exception ex) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
}
