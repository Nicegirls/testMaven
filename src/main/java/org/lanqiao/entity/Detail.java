package org.lanqiao.entity;

import java.sql.Timestamp;

public class Detail {

	private int det_id;
	private Service service;
	private String ip;
	private Timestamp det_intime;
	private Timestamp det_outtime;
	private double det_fee;
	private String det1;
	private String det2;
	private String det3;
	private int det4;
	private int det5;
	
	//登录时长
	private long det_sumtime;
	/**
	 * @return the det_id
	 */
	public int getDet_id() {
		return det_id;
	}
	/**
	 * @param det_id the det_id to set
	 */
	public void setDet_id(int det_id) {
		this.det_id = det_id;
	}
	/**
	 * @return the service
	 */
	public Service getService() {
		return service;
	}
	/**
	 * @param service the service to set
	 */
	public void setService(Service service) {
		this.service = service;
	}
	/**
	 * @return the ip
	 */
	public String getIp() {
		return ip;
	}
	/**
	 * @param ip the ip to set
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	/**
	 * @return the det_intime
	 */
	public Timestamp getDet_intime() {
		return det_intime;
	}
	/**
	 * @param det_intime the det_intime to set
	 */
	public void setDet_intime(Timestamp det_intime) {
		this.det_intime = det_intime;
	}
	/**
	 * @return the det_outtime
	 */
	public Timestamp getDet_outtime() {
		return det_outtime;
	}
	/**
	 * @param det_outtime the det_outtime to set
	 */
	public void setDet_outtime(Timestamp det_outtime) {
		this.det_outtime = det_outtime;
	}
	/**
	 * @return the det_fee
	 */
	public double getDet_fee() {
		return det_fee;
	}
	/**
	 * @param det_fee the det_fee to set
	 */
	public void setDet_fee(double det_fee) {
		this.det_fee = det_fee;
	}
	/**
	 * @return the det1
	 */
	public String getDet1() {
		return det1;
	}
	/**
	 * @param det1 the det1 to set
	 */
	public void setDet1(String det1) {
		this.det1 = det1;
	}
	/**
	 * @return the det2
	 */
	public String getDet2() {
		return det2;
	}
	/**
	 * @param det2 the det2 to set
	 */
	public void setDet2(String det2) {
		this.det2 = det2;
	}
	/**
	 * @return the det3
	 */
	public String getDet3() {
		return det3;
	}
	/**
	 * @param det3 the det3 to set
	 */
	public void setDet3(String det3) {
		this.det3 = det3;
	}
	/**
	 * @return the det4
	 */
	public int getDet4() {
		return det4;
	}
	/**
	 * @param det4 the det4 to set
	 */
	public void setDet4(int det4) {
		this.det4 = det4;
	}
	/**
	 * @return the det5
	 */
	public int getDet5() {
		return det5;
	}
	/**
	 * @param det5 the det5 to set
	 */
	public void setDet5(int det5) {
		this.det5 = det5;
	}
	public long getDet_sumtime() {
		return det_sumtime;
	}
	public void setDet_sumtime(long det_sumtime) {
		this.det_sumtime = det_sumtime;
	}

}
