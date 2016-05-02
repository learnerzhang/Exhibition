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
@Table(name = "review") // generate a table named "review".
public class Review implements Serializable{

	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false,updatable=false)
	private Integer id;
	
	@Column(name = "username", nullable = false,updatable=false)
	private String username;//外键约束

	@Column(name = "type", nullable = false)
	private String type;
	
	@Column(name = "creattime", nullable = false)
	private Timestamp creattime;
	
	@Column(name = "deadline", nullable = false)
	private Timestamp deadline;
	
	@Column(name = "comefrom", nullable = false)
	private String comefrom;
	
	@Column(name = "keyword", nullable = false)
	private String keyword;//key split with ";"
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "context", nullable = false)
	private String context;
	
	@Column(name = "readtime", nullable = false,columnDefinition="INT default 0")
	private Integer readtime;
	
	@Column(name = "image", nullable = false,columnDefinition="INT default 0")
	private Integer image;
	
	@Column(name="status",nullable = false)
	private String status;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getCreattime() {
		return creattime;
	}

	public void setCreattime(Timestamp creattime) {
		this.creattime = creattime;
	}

	public Timestamp getDeadline() {
		return deadline;
	}

	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}

	public String getComefrom() {
		return comefrom;
	}

	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Integer getReadtime() {
		return readtime;
	}

	public void setReadtime(Integer readtime) {
		this.readtime = readtime;
	}

	public Integer getImage() {
		return image;
	}

	public void setImage(Integer image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Review[username="+username+" ,title="+title+" ,keyword="+keyword+" ,Date<"+creattime+":"+deadline+">"+" ,from="+comefrom+" ,readtime="+readtime+" ,status="+status+"]";
	}
}
