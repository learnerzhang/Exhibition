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

@Entity // represent a entity.
@Table(name = "user") // generate a table named "user".
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 563452366098304678L;
	/*
	 * @Basic is object/table basic modify which default is
	 * "@Basic(fetch=FetchType.EAGER/LAZY,optional=true)". if use LAZY, that
	 * take "load" instead of "get"
	 * 
	 * @Transient represent that the key do not map to database. just for
	 * function using.
	 */
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false,updatable=false)
	private Integer id;
	@Column(name = "username", nullable = false)
	private String username;
	@Column(name = "password", nullable = false)
	private String password;
	private String new_password;
	@Column(name = "email", nullable = false)
	private String email;
	@Column(name = "type", nullable = false)
	private int type;// 0 represents Enterprise; 1 represents Gallery.
	
	@Column(name = "review", nullable = false,columnDefinition="INT default 0")
	private int review;//
	
	@Column(name = "msg", nullable = false,columnDefinition="INT default 0")
	private int msg;//
	
	@Column(name = "hall", nullable = false,columnDefinition="INT default 0")
	private int hall;//
	
	@Column(name = "expo", nullable = false,columnDefinition="INT default 0")
	private int expo;//
	
	@Column(name = "info", nullable = false,columnDefinition="INT default 0")
	private int info;//
	
	@Column(name = "consume", nullable = false,columnDefinition="INT default 0")
	private int consume;//
	
	
	@Column(name = "company_name", nullable = false)
	private String company_name;// company_name
	@Column(name = "contact", nullable = false)
	private String contact;// user name
	@Column(name = "area", nullable = false)
	private String area;
	@Column(name = "address")
	private String address;
	@Column(name = "code")
	private String code;
	
	@Column(name = "contact_number")
	private String contact_number;
	
	@Column(name = "mobile_number", nullable = false)
	private String mobile_number;
	@Column(name = "status", nullable = false)
	private String status;// "no" represents not check,"yes" represents
							// active,"del" represents delete
	private String vcode;
	@Column(name = "times", nullable = false)
	private int times;
	@Column(name = "c_time", nullable = false)
	private Timestamp c_time;
	@Column(name = "u_id") // identify
	private String u_id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNew_password() {
		return new_password;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}

	public String getEmail() {
		return email;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
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

	public String getCode() {
		return code;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public Timestamp getC_time() {
		return c_time;
	}

	public void setC_time(Timestamp c_time) {
		this.c_time = c_time;
	}

	
	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}

	public int getMsg() {
		return msg;
	}

	public void setMsg(int msg) {
		this.msg = msg;
	}

	public int getHall() {
		return hall;
	}

	public void setHall(int hall) {
		this.hall = hall;
	}

	public int getExpo() {
		return expo;
	}

	public void setExpo(int expo) {
		this.expo = expo;
	}

	public int getInfo() {
		return info;
	}

	public void setInfo(int info) {
		this.info = info;
	}

	public int getConsume() {
		return consume;
	}

	public void setConsume(int consume) {
		this.consume = consume;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "User[id=" + id + " ,username=" + username + " ,password=" + password + " ,area=" + area + " ,address="
				+ address + " ,mobile_number=" + mobile_number + " ,u_id=" + u_id + " ,type=" + type + " ,status="
				+ status + " ,vcode=" + vcode + " ,times=" + times + " ,review=" + review +"]";
	}
}
