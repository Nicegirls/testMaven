package org.lanqiao.entity;

public class User {
	private int ser_id;
	private String ser_psw;
	private String ser_os;
	private String ser_ip;
	private Fee fee;
	private int det_id;
	private double det_fee;
	private double det1;
	private double det_sumtime;
	private double det_htime;
	
	
	/**
	 * @return the det_htime
	 */
	public double getDet_htime() {
		return det_htime;
	}
	/**
	 * @param det_htime the det_htime to set
	 */
	public void setDet_htime(double det_htime) {
		this.det_htime = det_htime;
	}
	/**
	 * @return the det_sumtime
	 */
	public double getDet_sumtime() {
		return det_sumtime;
	}
	/**
	 * @param det_sumtime the det_sumtime to set
	 */
	public void setDet_sumtime(double det_sumtime) {
		this.det_sumtime = det_sumtime;
	}
	/**
	 * @return the det1
	 */
	public double getDet1() {
		return det1;
	}
	/**
	 * @param det1 the det1 to set
	 */
	public void setDet1(double det1) {
		this.det1 = det1;
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
	 * @return the ser_id
	 */
	public int getSer_id() {
		return ser_id;
	}
	/**
	 * @param ser_id the ser_id to set
	 */
	public void setSer_id(int ser_id) {
		this.ser_id = ser_id;
	}
	/**
	 * @return the ser_psw
	 */
	public String getSer_psw() {
		return ser_psw;
	}
	/**
	 * @param ser_psw the ser_psw to set
	 */
	public void setSer_psw(String ser_psw) {
		this.ser_psw = ser_psw;
	}
	/**
	 * @return the ser_os
	 */
	public String getSer_os() {
		return ser_os;
	}
	/**
	 * @param ser_os the ser_os to set
	 */
	public void setSer_os(String ser_os) {
		this.ser_os = ser_os;
	}
	/**
	 * @return the ser_ip
	 */
	public String getSer_ip() {
		return ser_ip;
	}
	/**
	 * @param ser_ip the ser_ip to set
	 */
	public void setSer_ip(String ser_ip) {
		this.ser_ip = ser_ip;
	}
	/**
	 * @return the fee
	 */
	public Fee getFee() {
		return fee;
	}
	/**
	 * @param fee the fee to set
	 */
	public void setFee(Fee fee) {
		this.fee = fee;
	}
	
}
