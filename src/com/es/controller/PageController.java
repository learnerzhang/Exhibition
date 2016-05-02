package com.es.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.es.model.AdImage;
import com.es.model.Expo;
import com.es.model.Image;
import com.es.model.Page;
import com.es.model.Review;
import com.es.model.User;
import com.es.service.AdImageService;
import com.es.service.EnterpriseService;
import com.es.service.ExpoService;
import com.es.service.HallService;
import com.es.service.ImageService;
import com.es.service.ReviewService;
import com.es.service.UserService;
import com.es.util.PageUtil;

@Controller
@RequestMapping("/")
public class PageController {
	protected final transient Log log = LogFactory.getLog(PageController.class);
	@Autowired
	public ReviewService reviewService;
	@Autowired
	public UserService userService;
	@Autowired
	public ExpoService expoService;
	@Autowired
	public ImageService imageService;
	@Autowired
	public EnterpriseService enterpriseService;
	@Autowired
	public HallService hallService;
	@Autowired
	public AdImageService adImageService;
	public PageController() {
		// TODO Auto-generated constructor stub
	}
	public void setIndexModelMap(ModelMap modelMap) {
		Page p = PageUtil.createPage(3, 3, 1);
		
		//获取推荐展会
		List<Object> recommendlist = expoService.getRecommendedExpos("recommend", p);
		modelMap.put("recommendlist", recommendlist);
		
		//获取展会分类
		List<Object> gongye = expoService.getExpos("工业、机械、加工", "startline", p);
		modelMap.put("gongye", gongye);
		List<Object> jiaotong = expoService.getExpos("汽车、交通工具", "startline", p);
		modelMap.put("jiaotong", jiaotong);
		List<Object> it = expoService.getExpos("IT设备、数码、软件", "startline", p);
		modelMap.put("it", it);
		List<Object> tongxin = expoService.getExpos("通信、通讯、电子", "startline", p);
		modelMap.put("tongxin", tongxin);
		List<Object> sea = expoService.getExpos("海洋、航空、航天", "startline", p);
		modelMap.put("sea", sea);
		List<Object> energy = expoService.getExpos("化工、能源、环保", "startline", p);
		modelMap.put("energy", energy);
		List<Object> art = expoService.getExpos("建筑、装潢、五金", "startline", p);
		modelMap.put("art", art);
		List<Object> jiaju = expoService.getExpos("家居、家电、日用品", "startline", p);
		modelMap.put("jiaju", jiaju);
		
		p = PageUtil.createPage(5, 5, 1);
		List<Object> guonei = reviewService.getReviews("国内展讯", "creattime", p);modelMap.put("guonei", guonei);
		List<Object> guoji = reviewService.getReviews("国际展讯", "creattime", p);modelMap.put("guoji", guoji);
		List<Object> zhuanti = reviewService.getReviews("专题报道", "creattime", p);modelMap.put("zhuanti", zhuanti);
		List<Object> renwu = reviewService.getReviews("会展人物", "creattime", p);modelMap.put("renwu", renwu);
		
		List<Object> imagelist = imageService.getIndexImages();
		modelMap.put("imagelist", imagelist);
		
		
		//今日;近期;展会回顾
		//List<Object> jinri = expoService.getUserByField(key, value);
		List<Object> jinri = expoService.getCurrentExpos(8);
		List<Object> jinqi = expoService.getRecentlyExpos(8);
		List<Object> lisi = expoService.getHistoryExpos(8);
		
		modelMap.put("jinri", jinri);
		modelMap.put("jinqi", jinqi);
		modelMap.put("lisi", lisi);
		log.info("交通:"+jiaotong.size()+" 工业:"+gongye.size()+" 能源:"+energy.size() +" 海洋:"+sea.size()+" 建筑:"+art.size()+" IT:"+it.size()+" 家居:"+jiaju.size()+" 通信:"+tongxin.size());
		log.info("国内展讯 : "+guonei.size()+" 国际展讯 : "+guoji.size()+" 专题报道 : "+zhuanti.size()+" 专题报道 : "+zhuanti.size());
		log.info("今日: "+jinri.size()+" 近期: "+jinqi.size()+" 历史: "+lisi.size()+" 推荐:"+recommendlist.size());
		
		//AdImage
		p = PageUtil.createPage(3, 3, 1);
		List<Object> adimages = adImageService.getIndexAdImage(p);
		modelMap.put("adimages", adimages);
	}
	
	@RequestMapping
	public String load(ModelMap modelMap) {
		System.out.println("Exhibition Index Page...");
		setIndexModelMap(modelMap);
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String Index(ModelMap modelMap) {
		System.out.println("Exhibition Index Page...");
		setIndexModelMap(modelMap);
		return "view/public/index";
	}
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String New(ModelMap map) {
		Page p = PageUtil.createPage(6, 6, 1);
		
		List<Object> renwuimagelist = reviewService.getImageReviews("会展人物", "creattime", p);
		List<Object> imagelist = new ArrayList<>();
		for (Object object : renwuimagelist) {
			Review r = (Review)object;
			List<Object> ilist = imageService.getImages(String.valueOf(r.getId()));
			if (ilist!=null && ilist.size()>0) {
				imagelist.add(ilist.get(0));
			}
		}
		p = PageUtil.createPage(4, 4, 1);
		List<Object> renwulist = reviewService.getNoImageReviews("会展人物", "creattime", p);

		map.put("renwuimagelist",renwuimagelist);
		map.put("imagelist", imagelist);
		map.put("renwulist", renwulist);
		
		//幻灯图库
		p = PageUtil.createPage(11, 11, 1);
		List<Object> huandengtukulist = reviewService.getImageReviews("幻灯图库", "creattime", p);
		List<Object> huandengtukuimagelist = new ArrayList<>();
		for (Object object : huandengtukulist) {
			Review r = (Review)object;
			List<Object> himagelist = imageService.getImages(String.valueOf(r.getId()));
			if (himagelist!=null && himagelist.size()>0) {
				huandengtukuimagelist.add(himagelist.get(0));
			}
		}
		map.put("huandengtukuimagelist", huandengtukuimagelist);
		
		return "view/public/news";
	}
	
	@RequestMapping(value = "/enterprises", method = RequestMethod.GET)
	public String Enterprise(ModelMap map) {
		
		//类型1-8
		List<Object> list = null;
		for (int i = 1; i <= 8; i++) {
			list = enterpriseService.getEnterpriseByType(String.valueOf(i),1,5);
			map.put("enterprises_"+i, list);
		}
		
		return "view/public/enterprises";
	}
	
	@RequestMapping(value = "/halls", method = RequestMethod.GET)
	public String Hall(ModelMap map) {
		
		String[] area = {"北京市","天津市","河北省","山西省","内蒙古自治区","辽宁省","吉林省","黑龙江省","上海市","江苏省","浙江省","安徽省","福建省","江西省","山东省","河南省","湖北省","湖南省","广东省","广西壮族自治区","海南省","重庆市","四川省","贵州省","云南省","西藏自治区","陕西省","甘肃省","青海省","宁夏回族自治区"};
		int i=1;
		for (String a : area) {
			List<Object> h = hallService.getHallByArea(a, 1, 2);
			map.put("area_"+i, h);
			i++;
		}
		//展馆新闻
		
		Page p = PageUtil.createPage(5, 5, 1);
		List<Object> zhanguan = reviewService.getReviews("展馆新闻", "creattime", p);
		map.put("zhanguan", zhanguan);
		
		//图片
		List<Object> zhanguanimagelist = reviewService.getImageReviews("展馆新闻", "creattime", p);
		List<Object> zgimagelist = new ArrayList<>();
		for (Object object : zhanguanimagelist) {
			Review r = (Review)object;
			List<Object> ilist = imageService.getImages(String.valueOf(r.getId()));
			if (ilist!=null && ilist.size()>0) {
				zgimagelist.add(ilist.get(0));
			}
		}
		map.put("zgimagelist", zgimagelist);
		
		Integer total = hallService.getHallSize();
		map.put("total", total);
		//推荐展馆
		////获取推荐展会
		//List<Object> recommendlist = expoService.getRecommendedExpos("recommend", p);
		//modelMap.put("recommendlist", recommendlist);
		p = PageUtil.createPage(5, 5, 1);
		List<Object> recommendHall = hallService.getRecommendedHall("recommend", p);
		map.put("recommendHall", recommendHall);
		
		System.out.println("展馆新闻 个数："+zhanguan.size()+" 展馆图片新闻的个数："+zgimagelist.size()+" 推荐展馆数量："+recommendHall.size());
		
		return "view/public/halls";
	}
	
	//<%=request.getContextPath() %>/index/new?id=${guonei[0].id }
	@RequestMapping(value = "/index/news",params="id",method = RequestMethod.GET)
	public String indexNew(ModelMap map,@RequestParam("id") String id) {
		
		Review review = reviewService.getReviewById(id);
		List<Object> imagelist = imageService.getImages(id);
		map.put("review", review);
		map.put("imagelist", imagelist);
		//System.out.println("调转单独质询页面....."+review.getTitle());
		
		Page p = PageUtil.createPage(10000, 10000, 1);
		Review pre_review=null,next_review=null;
		List<Object> reviews = reviewService.getReviews();
		if (reviews!=null && reviews.size()>1) {
			
			Review tmp = (Review) reviews.get(0);
			if (String.valueOf(tmp.getId()).equals(id)) {
				pre_review = null;
				next_review = (Review) reviews.get(1);
			}else {
				int i = 0;
				for (i = 1; i < reviews.size(); i++) {
					Review cur = (Review) reviews.get(i);
					if (String.valueOf(cur.getId()).equals(id)) {
						pre_review = tmp; 
						break;
					}
					tmp = cur;
				}
				if ((i+1)<reviews.size()) {
					next_review = (Review) reviews.get(i+1);
				}else {
					next_review = null;
				}
			}
		}
		map.put("pre_review", pre_review);
		map.put("next_review", next_review);
		return "view/new/new";
	}
	
	@RequestMapping(value = "/index/pics",params="id",method = RequestMethod.GET)
	public String indexPic(ModelMap map,@RequestParam("id") String id) {
		
		List<Object> imagelist = imageService.getImages(id);
		Review review = reviewService.getReviewById(id);
		map.put("imagelist", imagelist);
		map.put("review", review);
		Page p = PageUtil.createPage(1000, 1000, 1);
		List<Object> huandengtukulist = reviewService.getImageReviews("幻灯图库", "creattime", p);
		Review pre_review=null,next_review=null;
		
		if (huandengtukulist!=null && huandengtukulist.size()>1) {
			
			Review tmp = (Review) huandengtukulist.get(0);
			if (String.valueOf(tmp.getId()).equals(id)) {
				pre_review = null;
				next_review = (Review) huandengtukulist.get(1);
			}else {
				int i = 0;
				for (i = 1; i < huandengtukulist.size(); i++) {
					Review cur = (Review) huandengtukulist.get(i);
					if (String.valueOf(cur.getId()).equals(id)) {
						pre_review = tmp; 
						break;
					}
					tmp = cur;
				}
				if ((i+1)<huandengtukulist.size()) {
					next_review = (Review) huandengtukulist.get(i+1);
				}else {
					next_review = null;
				}
			}
			
		}
		
		map.put("pre_review", pre_review);
		map.put("next_review", next_review);
		return "view/pic/pic";
	}
	
}
