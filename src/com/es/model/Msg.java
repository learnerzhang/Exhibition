package com.es.model;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name = "msg")
public class Msg {

	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false, updatable = false)
	private Integer id;
	
	@Column(name = "ifrom", nullable = false)
	private String ifrom;
	
	@Column(name = "ito", nullable = false)
	private String ito;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	
	@Column(name = "context", nullable = false)
	private String context;
	
	@Column(name = "type", nullable = false)
	private String type;
	
	
	@Column(name = "timestamp", nullable = false)
	private Timestamp timestamp;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getIfrom() {
		return ifrom;
	}


	public void setIfrom(String ifrom) {
		this.ifrom = ifrom;
	}


	public String getIto() {
		return ito;
	}


	public void setIto(String ito) {
		this.ito = ito;
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


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Timestamp getTimestamp() {
		return timestamp;
	}


	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}


	@Override
	public String toString() {
		return "Msg [id=" + id + ", ifrom=" + ifrom + ", ito=" + ito + ", title=" + title + ", context=" + context
				+ ", type=" + type + ", timestamp=" + timestamp + "]";
	}

}
