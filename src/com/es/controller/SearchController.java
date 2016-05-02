package com.es.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.es.model.Page;
import com.es.service.EnterpriseService;
import com.es.service.ExpoService;
import com.es.service.HallService;
import com.es.util.PageUtil;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
@RequestMapping("/search")
public class SearchController {
	protected final transient Log log = LogFactory.getLog(SearchController.class);
	@Autowired
	public HallService hallService;
	@Autowired
	public EnterpriseService enterpriseService;
	@Autowired
	public ExpoService expoService;
	
	@RequestMapping(value="/expo")
	public String searchExpo(ModelMap modelMap, HttpServletRequest request) {
		String context="";
		String area = "";
		List<Object> expolist = null;
		try {
			context = URLDecoder.decode( (String) request.getParameter("context"), "utf-8");
			area = URLDecoder.decode( (String) request.getParameter("area"), "utf-8");
			log.info("Expo:"+context+"| : |"+area);
			Page page = PageUtil.createPage(10, 1000, 1);
			expolist = expoService.getExpoBySearchList(page,context,area);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelMap.put("expolist", expolist);
		return "view/public/expo_search_list";
	}
	
	@RequestMapping(value="/enterprise")
	public String searchEnterprise(ModelMap modelMap, HttpServletRequest request) {
		String context="";
		String area = "";
		List<Object> enterpriselist = null;
		try {
			context = URLDecoder.decode( (String) request.getParameter("context"), "utf-8");
			area = URLDecoder.decode( (String) request.getParameter("area"), "utf-8");
			log.info("Enterprise:"+context+"| : |"+area);
			Page page = PageUtil.createPage(10, 1000, 1);
			enterpriselist = enterpriseService.getEnterpriseBySearchList(page,context,area);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelMap.put("enterpriselist", enterpriselist);
		return "view/public/enterprise_search_list";
	}
	
	@RequestMapping(value="/hall")
	public String searchHall(ModelMap modelMap, HttpServletRequest request) {
		String context="";
		String area = "";
		List<Object> halllist = null;
		try {
			context = URLDecoder.decode( (String) request.getParameter("context"), "utf-8");
			area = URLDecoder.decode( (String) request.getParameter("area"), "utf-8");
			log.info("Hall:"+context+"| : |"+area);
			Page page = PageUtil.createPage(10, 1000, 1);
			halllist = hallService.getHallBySearchList(page,context,area);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelMap.put("halllist", halllist);
		return "view/public/hall_search_list";
	}
	@RequestMapping(value="/expoIndustry")
	public String ExpoIndustry(ModelMap modelMap,HttpServletRequest request) {
		
		String industry = "";
		try {
			industry = URLDecoder.decode((String) request.getParameter("industry"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Page page = PageUtil.createPage(10, 1000, 1);
		List<Object> expolist = expoService.getExpos(industry, "startline", page);
		modelMap.put("expolist", expolist);
		return "view/public/index_expo";
	}
	//enterprise_list?type=8
	@RequestMapping(value="/enterprise_list",params="type")
	public String EnterpriseType(ModelMap modelMap,@RequestParam("type") String type) {
		List<Object> enterpriselist = null;
		try {
			enterpriselist = enterpriseService.getEnterpriseByType(type, 1, 10);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelMap.put("enterpriselist", enterpriselist);
		return "view/public/index_enterprise";
	}
}
