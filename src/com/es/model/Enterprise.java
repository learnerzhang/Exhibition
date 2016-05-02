package com.es.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "enterprise")
public class Enterprise implements Serializable {
	/*
	 * 类型：
	 * 1 工业/机械
	 * 2 汽车交通
	 * 3 IT数码
	 * 4 通信
	 * 5 海洋/航空
	 * 6 化工
	 * 7 建筑
	 * 8 家居
	 * */
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false,updatable=false)
	private Integer id;
	@Column(name = "username", nullable = false,updatable=false)
	private String username;//外键约束
	@Column(name = "type", nullable = false)
	private String type;
	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "agent", nullable = false)
	private String agent;
	@Column(name = "address", nullable = false)
	private String address;
	
	@Column(name = "code", nullable = false)
	private String code;
	
	@Column(name = "contact", nullable = false)
	private String contact;
	@Column(name = "email", nullable = false)
	private String email;
	@Column(name = "area",nullable = false)
	private String area;//名言
	@Column(name = "website")
	private String website;
	
	@Column(name = "remark")
	private String remark;//名言
	
	@Column(name = "introduction")
	private String introduction;
	
	@Column(name = "manager")
	private String manager;
	
	@Column(name = "manager_context")
	private String manager_context;
	
	@Column(name = "about_us")
	private String about_us;

	@Column(name = "status")
	private String status;

	@Column(name = "time")
	private Timestamp time;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getStatus() {
		return status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getManager_context() {
		return manager_context;
	}

	public void setManager_context(String manager_context) {
		this.manager_context = manager_context;
	}

	public String getAbout_us() {
		return about_us;
	}

	public void setAbout_us(String about_us) {
		this.about_us = about_us;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Enterprise[id=" + id + " ,name=" + name + " ,agent=" + agent + " ,remark=" + remark + " ,status=" + status + " ,time=" + time + "]";
	}
}
