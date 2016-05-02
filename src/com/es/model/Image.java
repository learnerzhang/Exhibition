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
@Table(name = "image")
public class Image {

	/*
	 * 图片信息固定无法更改
	 * **/
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false, updatable = false)
	private Integer id;
	
	@Column(name = "review_id", nullable = false)
	private String review_id;
	
	@Column(name = "review_title", nullable = false)
	private String review_title;
	
	
	@Column(name = "nname", nullable = false)
	private String nname;
	
	@Column(name = "oname", nullable = false)
	private String oname;
	
	@Column(name = "timestamp", nullable = false)
	private Timestamp timestamp;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}
	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Image[id="+id+" ,review_id="+review_id+" ,review_title="+review_title+" , nname="+nname+" , oname="+oname+" ]";
	}
}
