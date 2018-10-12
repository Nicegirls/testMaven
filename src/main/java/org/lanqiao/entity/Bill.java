package org.lanqiao.entity;

import java.sql.Date;

public class Bill {
	private int bill_id;
	private double bill_sumfee;
	private Date bill_time;
	private long bill_sumtime;
	private int bill_way;
	private int bill_status;
	private String bill1;
	private String bill2;
	private String bill3;
	private int bill4;
	private int bill5;

	private Account account; // 账务帐号对象

	private String payStatus; // 支付状态字符串
	private String payWay; // 支付方式字符串

	/**
	 * @return the payStatus
	 */
	public String getPayStatus() {
		return payStatus;
	}

	/**
	 * @param payStatus
	 *            the payStatus to set
	 */
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	/**
	 * @return the payWay
	 */
	public String getPayWay() {
		return payWay;
	}

	/**
	 * @param payWay
	 *            the payWay to set
	 */
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	/**
	 * @return the bill_id
	 */
	public int getBill_id() {
		return bill_id;
	}

	/**
	 * @param bill_id
	 *            the bill_id to set
	 */
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}

	/**
	 * @return the bill_sumfee
	 */
	public double getBill_sumfee() {
		return bill_sumfee;
	}

	/**
	 * @param bill_sumfee
	 *            the bill_sumfee to set
	 */
	public void setBill_sumfee(double bill_sumfee) {
		this.bill_sumfee = bill_sumfee;
	}

	/**
	 * @return the bill_sumtime
	 */
	public long getBill_sumtime() {
		return bill_sumtime;
	}

	/**
	 * @param bill_sumtime
	 *            the bill_sumtime to set
	 */
	public void setBill_sumtime(long bill_sumtime) {
		this.bill_sumtime = bill_sumtime;
	}

	/**
	 * @return the bill_way
	 */
	public int getBill_way() {
		return bill_way;
	}

	/**
	 * @param bill_way
	 *            the bill_way to set
	 */
	public void setBill_way(int bill_way) {
		this.bill_way = bill_way;
	}

	/**
	 * @return the bill_status
	 */
	public int getBill_status() {
		return bill_status;
	}

	/**
	 * @param bill_status
	 *            the bill_status to set
	 */
	public void setBill_status(int bill_status) {
		if (bill_status == 0)
			payWay = "";
		if (bill_status == 1)
			payWay = "现金";
		if (bill_status == 2)
			payWay = "银行卡";
		if (bill_status == 3)
			payWay = "支付宝";
		if (bill_status == 4)
			payWay = "微信";
		if (bill_status == 0) {
			this.payStatus = "未支付";
		}
		if (bill_status == 1) {
			this.payStatus = "已支付";
		}
		this.bill_status = bill_status;
	}

	/**
	 * @return the bill1
	 */
	public String getBill1() {
		return bill1;
	}

	/**
	 * @param bill1
	 *            the bill1 to set
	 */
	public void setBill1(String bill1) {
		this.bill1 = bill1;
	}

	/**
	 * @return the bill2
	 */
	public String getBill2() {
		return bill2;
	}

	/**
	 * @param bill2
	 *            the bill2 to set
	 */
	public void setBill2(String bill2) {
		this.bill2 = bill2;
	}

	/**
	 * @return the bill3
	 */
	public String getBill3() {
		return bill3;
	}

	/**
	 * @param bill3
	 *            the bill3 to set
	 */
	public void setBill3(String bill3) {
		this.bill3 = bill3;
	}

	/**
	 * @return the bill4
	 */
	public int getBill4() {
		return bill4;
	}

	/**
	 * @param bill4
	 *            the bill4 to set
	 */
	public void setBill4(int bill4) {
		this.bill4 = bill4;
	}

	/**
	 * @return the bill5
	 */
	public int getBill5() {
		return bill5;
	}

	/**
	 * @param bill5
	 *            the bill5 to set
	 */
	public void setBill5(int bill5) {
		this.bill5 = bill5;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Date getBill_time() {
		return bill_time;
	}

	public void setBill_time(Date bill_time) {
		this.bill_time = bill_time;
	}
}
