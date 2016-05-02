package com.es.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // represent a entity.
@Table(name = "hall") // generate a table named "hall".
public class Hall {

	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false, updatable = false)
	private Integer id;

	@Column(name = "username", nullable = false)
	private String username;//
	
	@Column(name = "introduction", nullable = false)
	private String introduction;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "contact", nullable = false)
	private String contact;
	
	@Column(name = "tel", nullable = false)
	private String tel;

	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "code", nullable = false)
	private String code;
	
	@Column(name="status",nullable = false,columnDefinition="VARCHAR(1) default '0'")
	private String status;
	
	@Column(name = "area", nullable = false)
	private String area;

	@Column(name = "address", nullable = false)
	private String address;

	@Column(name = "recommend", nullable = false)
	private Integer recommend;// 推荐指数
	
	@Column(name = "innerSize", nullable = false)
	private Integer innerSize;// 室内大小

	@Column(name = "outSize", nullable = false)
	private Integer outSize;// 室外大小
	
	@Column(name = "visit", nullable = false)
	private Integer visit;// 参观的数量

	@Column(name = "technicalParameters")
	private String technicalParameters;
	
	@Column(name = "locPic")
	private String locPic;
	
	@Column(name = "hallimage",nullable = false)
	private Integer hallimage;
	
	@Column(name = "busRoutes", nullable = false)
	private String busRoutes;// 公交路线

	@Column(name = "businessScope", nullable = false)
	private String businessScope;// 业务范围

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
	public Integer getVisit() {
		return visit;
	}

	public void setVisit(Integer visit) {
		this.visit = visit;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Integer getHallimage() {
		return hallimage;
	}

	public void setHallimage(Integer hallimage) {
		this.hallimage = hallimage;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getInnerSize() {
		return innerSize;
	}

	public void setInnerSize(Integer innerSize) {
		this.innerSize = innerSize;
	}

	public Integer getOutSize() {
		return outSize;
	}

	public void setOutSize(Integer outSize) {
		this.outSize = outSize;
	}

	public String getLocPic() {
		return locPic;
	}

	public void setLocPic(String locPic) {
		this.locPic = locPic;
	}

	public String getTechnicalParameters() {
		return technicalParameters;
	}

	public void setTechnicalParameters(String technicalParameters) {
		this.technicalParameters = technicalParameters;
	}

	public String getBusRoutes() {
		return busRoutes;
	}

	public void setBusRoutes(String busRoutes) {
		this.busRoutes = busRoutes;
	}

	public String getBusinessScope() {
		return businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
