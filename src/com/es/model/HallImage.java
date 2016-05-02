package com.es.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // represent a entity.
@Table(name = "hallimage") // generate a table named "hallimage".
public class HallImage {

	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false, updatable = false)
	private Integer id;

	@Column(name = "hall_id", nullable = false)
	private String hall_id;//
	
	@Column(name = "username", nullable = false)
	private String username;//
	
	@Column(name = "src", nullable = false)
	private String src;//
	
	@Column(name = "oname", nullable = false)
	private String oname;//

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHall_id() {
		return hall_id;
	}

	public void setHall_id(String hall_id) {
		this.hall_id = hall_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}
}
