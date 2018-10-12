package org.lanqiao.entity;

import java.math.BigDecimal;
import java.sql.Date;

public class Report {

	private int acc_id;
	private String acc_account;
	private String acc_name;
	private String acc_idcard;
	private String acc_telnum;
	private Date bill_time;
	private double bill_sumtime;
	public Report() {
		super();
	}
	/**
	 * @return the acc_id
	 */
	public int getAcc_id() {
		return acc_id;
	}
	/**
	 * @param acc_id the acc_id to set
	 */
	public void setAcc_id(int acc_id) {
		this.acc_id = acc_id;
	}
	/**
	 * @return the acc_account
	 */
	public String getAcc_account() {
		return acc_account;
	}
	/**
	 * @param acc_account the acc_account to set
	 */
	public void setAcc_account(String acc_account) {
		this.acc_account = acc_account;
	}
	/**
	 * @return the acc_name
	 */
	public String getAcc_name() {
		return acc_name;
	}
	/**
	 * @param acc_name the acc_name to set
	 */
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	/**
	 * @return the acc_idcard
	 */
	public String getAcc_idcard() {
		return acc_idcard;
	}
	/**
	 * @param acc_idcard the acc_idcard to set
	 */
	public void setAcc_idcard(String acc_idcard) {
		this.acc_idcard = acc_idcard;
	}
	/**
	 * @return the acc_telnum
	 */
	public String getAcc_telnum() {
		return acc_telnum;
	}
	/**
	 * @param acc_telnum the acc_telnum to set
	 */
	public void setAcc_telnum(String acc_telnum) {
		this.acc_telnum = acc_telnum;
	}
	/**
	 * @return the bill_time
	 */
	public Date getBill_time() {
		return bill_time;
	}
	/**
	 * @param bill_time the bill_time to set
	 */
	public void setBill_time(Date bill_time) {
		this.bill_time = bill_time;
	}
	/**
	 * @return the bill_sumtime
	 */
	public double getBill_sumtime() {
		String a = new java.text.DecimalFormat("#.00").format(bill_sumtime);
		bill_sumtime = Double.parseDouble(a);
		return bill_sumtime;
	}
	/**
	 * @param bill_sumtime the bill_sumtime to set
	 */
	public void setBill_sumtime(double bill_sumtime) {
		this.bill_sumtime = bill_sumtime;
	}

	

}
