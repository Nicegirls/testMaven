package org.lanqiao.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Account {
	private int acc_id;//账务ID
	private String acc_name;//姓名
	private String acc_account;//账务账号
	private int acc_status;//账号状态
	private Timestamp acc_cretime;//创建时间
	private String acc_idcard;//身份证号
	private String acc_telnum;//电话号码
	private String acc_psw;//密码
	private String acc_email;//Email
	private String acc_rec_idcard;//推荐人身份证号
	private int acc_sex;//性别
	private int acc_rec_id;//推荐人ID
	private int acc_job;//职业
	private String acc_postcode;//邮编
	private String acc_qq;//QQ
	private String acc_address;//通信地址
	private Timestamp acc_otime;//开通时间
	private Timestamp acc_ptime;//暂停时间
	private Timestamp acc_dtime;//删除时间
	private String acc_ip;//上次登录IP
	private String acc_birth;
	public Account() {
		super();
	}
	public Account(int acc_id, String acc_name, String acc_account, int acc_status, Timestamp acc_cretime, String acc_idcard,
			String acc_telnum, String acc_psw, String acc_email, String acc_rec_idcard, int acc_sex, int acc_rec_id,
			int acc_job, String acc_postcode, String acc_qq, String acc_address, Timestamp acc_otime, Timestamp acc_ptime,
			Timestamp acc_dtime, String acc_ip) {
		super();
		this.acc_id = acc_id;
		this.acc_name = acc_name;
		this.acc_account = acc_account;
		this.acc_status = acc_status;
		this.acc_cretime = acc_cretime;
		this.acc_idcard = acc_idcard;
		this.acc_telnum = acc_telnum;
		this.acc_psw = acc_psw;
		this.acc_email = acc_email;
		this.acc_rec_idcard = acc_rec_idcard;
		this.acc_sex = acc_sex;
		this.acc_rec_id = acc_rec_id;
		this.acc_job = acc_job;
		this.acc_postcode = acc_postcode;
		this.acc_qq = acc_qq;
		this.acc_address = acc_address;
		this.acc_otime = acc_otime;
		this.acc_ptime = acc_ptime;
		this.acc_dtime = acc_dtime;
		this.acc_ip = acc_ip;
	}
	/**
	 * 获取账务id
	 * @return the acc_id
	 */
	public int getAcc_id() {
		return acc_id;
	}
	/**
	 * 设置账务id
	 * @param acc_id the acc_id to set
	 */
	public void setAcc_id(int acc_id) {
		this.acc_id = acc_id;
	}
	/**
	 * 获取姓名
	 * @return the acc_name
	 */
	public String getAcc_name() {
		return acc_name;
	}
	/**
	 * 设置姓名
	 * @param acc_name the acc_name to set
	 */
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	/**
	 * 获取账务账号
	 * @return the acc_account
	 */
	public String getAcc_account() {
		return acc_account;
	}
	/**
	 * 设置账务账号
	 * @param acc_account the acc_account to set
	 */
	public void setAcc_account(String acc_account) {
		this.acc_account = acc_account;
	}
	/**
	 * 获取账务账号状态
	 * @return the acc_status
	 */
	public int getAcc_status() {
		return acc_status;
	}
	/**
	 * 设置账务账号状态
	 * @param acc_status the acc_status to set
	 */
	public void setAcc_status(int acc_status) {
		this.acc_status = acc_status;
	}
	/**
	 * 获取账务账号创建时间
	 * @return the acc_cretime
	 */
	public Timestamp getAcc_cretime() {
		return acc_cretime;
	}
	/**
	 * 设置账务账号创建时间
	 * @param acc_cretime the acc_cretime to set
	 */
	public void setAcc_cretime(Timestamp acc_cretime) {
		this.acc_cretime = acc_cretime;
	}
	/**
	 * 获取身份证号码
	 * @return the acc_idcard
	 */
	public String getAcc_idcard() {
		return acc_idcard;
	}
	/**
	 * 设置身份证号码
	 * @param acc_idcard the acc_idcard to set
	 */
	public void setAcc_idcard(String acc_idcard) {
		this.acc_idcard = acc_idcard;
	}
	/**
	 * 获取手机号码
	 * @return the acc_telnum
	 */
	public String getAcc_telnum() {
		return acc_telnum;
	}
	/**
	 * 设置手机号码
	 * @param acc_telnum the acc_telnum to set
	 */
	public void setAcc_telnum(String acc_telnum) {
		this.acc_telnum = acc_telnum;
	}
	/**
	 * 获取账务账号密码
	 * @return the acc_psw
	 */
	public String getAcc_psw() {
		return acc_psw;
	}
	/**
	 * 设置账务账号密码
	 * @param acc_psw the acc_psw to set
	 */
	public void setAcc_psw(String acc_psw) {
		this.acc_psw = acc_psw;
	}
	/**
	 * 获取邮箱
	 * @return the acc_email
	 */
	public String getAcc_email() {
		return acc_email;
	}
	/**
	 * 设置邮箱
	 * @param acc_email the acc_email to set
	 */
	public void setAcc_email(String acc_email) {
		this.acc_email = acc_email;
	}
	/**
	 * 获取推荐人身份证号码
	 * @return the acc_rec_idcard
	 */
	public String getAcc_rec_idcard() {
		return acc_rec_idcard;
	}
	/**
	 * 设置推荐人身份证号码
	 * @param acc_rec_idcard the acc_rec_idcard to set
	 */
	public void setAcc_rec_idcard(String acc_rec_idcard) {
		this.acc_rec_idcard = acc_rec_idcard;
	}
	/**
	 * 获取性别
	 * @return the acc_sex
	 */
	public int getAcc_sex() {
		return acc_sex;
	}
	/**
	 * 设置性别
	 * @param acc_sex the acc_sex to set
	 */
	public void setAcc_sex(int acc_sex) {
		this.acc_sex = acc_sex;
	}
	/**
	 * 获取推荐人id
	 * @return the acc_rec_id
	 */
	public int getAcc_rec_id() {
		return acc_rec_id;
	}
	/**
	 * 设置推荐人id
	 * @param acc_rec_id the acc_rec_id to set
	 */
	public void setAcc_rec_id(int acc_rec_id) {
		this.acc_rec_id = acc_rec_id;
	}
	/**
	 * 获取职业
	 * @return the acc_job
	 */
	public int getAcc_job() {
		return acc_job;
	}
	/**
	 * 设置职业
	 * @param acc_job the acc_job to set
	 */
	public void setAcc_job(int acc_job) {
		this.acc_job = acc_job;
	}
	/**
	 * 获取邮编
	 * @return the acc_postcode
	 */
	public String getAcc_postcode() {
		return acc_postcode;
	}
	/**
	 * 设置邮编
	 * @param acc_postcode the acc_postcode to set
	 */
	public void setAcc_postcode(String acc_postcode) {
		this.acc_postcode = acc_postcode;
	}
	/**
	 * 获取qq号码
	 * @return the acc_qq
	 */
	public String getAcc_qq() {
		return acc_qq;
	}
	/**
	 * 设置qq密码
	 * @param acc_qq the acc_qq to set
	 */
	public void setAcc_qq(String acc_qq) {
		this.acc_qq = acc_qq;
	}
	/**
	 * 获取通信地址
	 * @return the acc_address
	 */
	public String getAcc_address() {
		return acc_address;
	}
	/**
	 * 设置通信地址
	 * @param acc_address the acc_address to set
	 */
	public void setAcc_address(String acc_address) {
		this.acc_address = acc_address;
	}
	/**
	 * 获取开通时间
	 * @return the acc_otime
	 */
	public Timestamp getAcc_otime() {
		return acc_otime;
	}
	/**
	 * 设置开通时间
	 * @param acc_otime the acc_otime to set
	 */
	public void setAcc_otime(Timestamp acc_otime) {
		this.acc_otime = acc_otime;
	}
	/**
	 * 获取暂停时间
	 * @return the acc_ptime
	 */
	public Timestamp getAcc_ptime() {
		return acc_ptime;
	}
	/**
	 * 设置暂停时间
	 * @param acc_ptime the acc_ptime to set
	 */
	public void setAcc_ptime(Timestamp acc_ptime) {
		this.acc_ptime = acc_ptime;
	}
	/**
	 * 获取删除时间
	 * @return the acc_dtime
	 */
	public Timestamp getAcc_dtime() {
		return acc_dtime;
	}
	/**
	 * 设置删除时间
	 * @param acc_dtime the acc_dtime to set
	 */
	public void setAcc_dtime(Timestamp acc_dtime) {
		this.acc_dtime = acc_dtime;
	}
	/**
	 * 获取ip地址
	 * @return the acc_ip
	 */
	public String getAcc_ip() {
		return acc_ip;
	}
	/**
	 * 设置ip地址
	 * @param acc_ip the acc_ip to set
	 */
	public void setAcc_ip(String acc_ip) {
		this.acc_ip = acc_ip;
	}
	/**
	 * 获取生日
	 * @return
	 */
	public String getAcc_birth() {
		return acc_birth;
	}
	/**
	 * 设置生日
	 * @param acc_birth
	 */
	public void setAcc_birth(String acc_birth) {
		this.acc_birth = acc_birth;
	}
	
	
	

}
