package com.es.model;

import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "expo")
public class Expo {

	// 展会信息
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false, updatable = false)
	private Integer id;

	@Column(name = "username", nullable = false, updatable = false)
	private String username;
	
	@Column(name = "name", nullable = false, updatable = false)
	private String name;

	@Column(name = "recommend", nullable = false)
	private Integer recommend;// 推荐指数

	@Column(name = "a", nullable = false)
	private Integer a;
	
	@Column(name = "b", nullable = false)
	private Integer b;
	
	@Column(name = "c", nullable = false)
	private Integer c;

	@Column(name = "visit_number", nullable = false)
	private Integer visit_number;

	@Column(name = "industry", nullable = false)
	private String industry;// 行业

	@Column(name = "certified", nullable = false,columnDefinition="VARCHAR(1) default '0'")
	private String certified;// 认证

	@Column(name = "venue", nullable = false)
	private String  venue;// 场馆

	@Column(name = "area", nullable = false)
	private String  area;// 地点
	
	@Column(name = "organizer", nullable = false)
	private String organizer;// 主办单位
	
	@Column(name = "about_organizer", nullable = false)
	private String about_organizer;// 关于主办方
	
	@Column(name = "contact", nullable = false)
	private String contact;// 主办方联系方式


	@Column(name = "undertaker", nullable = false)
	private String undertaker;// 承办单位

	@Column(name = "co_organizer")
	private String co_organizer;// 协办单位

	@Column(name = "expo_introduction", nullable = false)
	private String expo_introduction;// 展会简介
	
	@Column(name = "expo_description", nullable = false)
	private String expo_description;// 展会概述
	
	@Column(name = "expo_price")
	private String expo_price;// 展会价格
	
	@Column(name = "promotion")
	private String promotions;// 优惠活动
	
	@Column(name = "ad")
	private String ad;// 广告价格
	
	
	@Column(name = "audience_require")
	private String audience_require;// 观众要求
	
	@Column(name = "product_area", nullable = false)
	private String product_area;// 展品范围

	@Column(name = "product_feature", nullable = false)
	private String product_feature;// 展品特色

	@Column(name = "startline", nullable = false)
	private Timestamp startline;
	
	@Column(name = "deadline", nullable = false)
	private Timestamp deadline;

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name="status",nullable = false)
	private String status;
	
	
	public String getAbout_organizer() {
		return about_organizer;
	}

	public void setAbout_organizer(String about_organizer) {
		this.about_organizer = about_organizer;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getExpo_description() {
		return expo_description;
	}

	public void setExpo_description(String expo_description) {
		this.expo_description = expo_description;
	}

	public String getExpo_price() {
		return expo_price;
	}

	public void setExpo_price(String expo_price) {
		this.expo_price = expo_price;
	}

	public String getPromotions() {
		return promotions;
	}

	public void setPromotions(String promotions) {
		this.promotions = promotions;
	}

	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}

	public String getAudience_require() {
		return audience_require;
	}

	public void setAudience_require(String audience_require) {
		this.audience_require = audience_require;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	
	public Integer getA() {
		return a;
	}

	public void setA(Integer a) {
		this.a = a;
	}

	public Integer getB() {
		return b;
	}

	public void setB(Integer b) {
		this.b = b;
	}

	public Integer getC() {
		return c;
	}

	public void setC(Integer c) {
		this.c = c;
	}

	public Integer getVisit_number() {
		return visit_number;
	}

	public void setVisit_number(Integer visit_number) {
		this.visit_number = visit_number;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getCertified() {
		return certified;
	}

	public void setCertified(String certified) {
		this.certified = certified;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getOrganizer() {
		return organizer;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	public String getUndertaker() {
		return undertaker;
	}

	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
	}

	public String getCo_organizer() {
		return co_organizer;
	}

	public void setCo_organizer(String co_organizer) {
		this.co_organizer = co_organizer;
	}

	public String getExpo_introduction() {
		return expo_introduction;
	}

	public void setExpo_introduction(String expo_introduction) {
		this.expo_introduction = expo_introduction;
	}

	public String getProduct_area() {
		return product_area;
	}

	public void setProduct_area(String product_area) {
		this.product_area = product_area;
	}

	public String getProduct_feature() {
		return product_feature;
	}

	public void setProduct_feature(String product_feature) {
		this.product_feature = product_feature;
	}

	public Timestamp getStartline() {
		return startline;
	}

	public void setStartline(Timestamp startline) {
		this.startline = startline;
	}

	public Timestamp getDeadline() {
		return deadline;
	}

	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
