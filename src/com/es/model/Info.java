package com.es.model;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name = "info")
public class Info {

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

}
