package org.lanqiao.entity;

import java.sql.Date;

public class Service {
	private int     ser_id ;       //  业务ID
	//private String  ser_account; //  
	private int     fee_id ;       //  资费类型
	private int     acc_id ;       //  账务ID
	private String  ser_ip ;       //  服务器IP
	private String  ser_os ;       //  os账号
	private String  ser_psw     ;  //  密码 
	private int     ser_status  ;  //  状态
	private Date    ser_cretime ;  //  创建时间
	private Date    ser_otime   ;  //  开通时间
	private Date    ser_ptime   ;  //  暂停时间
	private Date    ser_dtime   ;  //  删除时间
	
	private Fee     fee         ;  //  资费对象
	private Account account     ;  //  账号对象
	
	private String  ser1 ; // 备用1
	private String  ser2 ; // 备用2
	private String  ser3 ; // 备用3
	private int     ser4 ; // 备用4
	private int     ser5 ; // 备用5
	/**
	 * 
	 */
	public Service() {
		super();
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
	 * @return the fee_id
	 */
	public int getFee_id() {
		return fee_id;
	}
	/**
	 * @param fee_id the fee_id to set
	 */
	public void setFee_id(int fee_id) {
		this.fee_id = fee_id;
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
	 * @return the ser_status
	 */
	public int getSer_status() {
		return ser_status;
	}
	/**
	 * @param ser_status the ser_status to set
	 */
	public void setSer_status(int ser_status) {
		this.ser_status = ser_status;
	}
	/**
	 * @return the ser_cretime
	 */
	public Date getSer_cretime() {
		return ser_cretime;
	}
	/**
	 * @param ser_cretime the ser_cretime to set
	 */
	public void setSer_cretime(Date ser_cretime) {
		this.ser_cretime = ser_cretime;
	}
	/**
	 * @return the ser_otime
	 */
	public Date getSer_otime() {
		return ser_otime;
	}
	/**
	 * @param ser_otime the ser_otime to set
	 */
	public void setSer_otime(Date ser_otime) {
		this.ser_otime = ser_otime;
	}
	/**
	 * @return the ser_ptime
	 */
	public Date getSer_ptime() {
		return ser_ptime;
	}
	/**
	 * @param ser_ptime the ser_ptime to set
	 */
	public void setSer_ptime(Date ser_ptime) {
		this.ser_ptime = ser_ptime;
	}
	/**
	 * @return the ser_dtime
	 */
	public Date getSer_dtime() {
		return ser_dtime;
	}
	/**
	 * @param ser_dtime the ser_dtime to set
	 */
	public void setSer_dtime(Date ser_dtime) {
		this.ser_dtime = ser_dtime;
	}
	/**
	 * @return the ser1
	 */
	public String getSer1() {
		return ser1;
	}
	/**
	 * @param ser1 the ser1 to set
	 */
	public void setSer1(String ser1) {
		this.ser1 = ser1;
	}
	/**
	 * @return the ser2
	 */
	public String getSer2() {
		return ser2;
	}
	/**
	 * @param ser2 the ser2 to set
	 */
	public void setSer2(String ser2) {
		this.ser2 = ser2;
	}
	/**
	 * @return the ser3
	 */
	public String getSer3() {
		return ser3;
	}
	/**
	 * @param ser3 the ser3 to set
	 */
	public void setSer3(String ser3) {
		this.ser3 = ser3;
	}
	/**
	 * @return the ser4
	 */
	public int getSer4() {
		return ser4;
	}
	/**
	 * @param ser4 the ser4 to set
	 */
	public void setSer4(int ser4) {
		this.ser4 = ser4;
	}
	/**
	 * @return the ser5
	 */
	public int getSer5() {
		return ser5;
	}
	/**
	 * @param ser5 the ser5 to set
	 */
	public void setSer5(int ser5) {
		this.ser5 = ser5;
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
	/**
	 * @return the account
	 */
	public Account getAccount() {
		return account;
	}
	/**
	 * @param account the account to set
	 */
	public void setAccount(Account account) {
		this.account = account;
	}
	
	
}
