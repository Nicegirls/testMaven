package org.lanqiao.entity;

import java.io.Serializable;

public class Privilege implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pri_id;
	private String pri_name;
	private String pri_url;
	private String pri_class;
	public int getPri_id() {
		return pri_id;
	}
	public void setPri_id(int pri_id) {
		this.pri_id = pri_id;
	}
	public String getPri_name() {
		return pri_name;
	}
	public void setPri_name(String pri_name) {
		this.pri_name = pri_name;
	}
	public String getPri_url() {
		return pri_url;
	}
	public void setPri_url(String pri_url) {
		this.pri_url = pri_url;
	}
	public String getPri_class() {
		return pri_class;
	}
	public void setPri_class(String pri_class) {
		this.pri_class = pri_class;
	}
	
}
