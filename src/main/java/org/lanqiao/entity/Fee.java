package org.lanqiao.entity;

import java.util.Date;

public class Fee {
	private int fee_id;//资费id
	private String fee_name;//资费名称
//	private String fee_type;//资费类型
	private int fee_type;//资费类型
	private int fee_btime;//基本时长
	private double fee_bfee;//基本费用
	private double fee_ufee;//单位费用
	private Date fee_cretime;//创建时间
	private Date fee_otime;//开通时间
	private int fee_status;//资费状态
	private String fee_desc;//资费说明
	private String fee_b1;//备用字段
	private String fee_b2;//备用字段
	private String fee_b3;//备用字段
	private int fee_b4;//备用字段
	private int fee_b5;//备用字段
	
	public Fee(){
	}

	/**
	 * 启用资费
	 * @param fee_id
	 * @param fee_otime
	 * @param fee_status
	 */
	public Fee(int fee_id, Date fee_otime, int fee_status) {
		super();
		this.fee_id = fee_id;
		this.fee_otime = fee_otime;
		this.fee_status = fee_status;
	}

	/**
	 * 根据id查询所有的信息进行修改
	 * @param fee_id
	 */
	public Fee(int fee_id) {
		super();
		this.fee_id = fee_id;
	}
	
	/**
	 * 修改资费表
	 * @param fee_id
	 * @param fee_name
	 * @param fee_type
	 * @param fee_btime
	 * @param fee_bfee
	 * @param fee_ufee
	 * @param fee_desc
	 */
	public Fee(int fee_id, String fee_name, int fee_type, int fee_btime, double fee_bfee, double fee_ufee,
			String fee_desc) {
		super();
		this.fee_id = fee_id;
		this.fee_name = fee_name;
		this.fee_type = fee_type;
		this.fee_btime = fee_btime;
		this.fee_bfee = fee_bfee;
		this.fee_ufee = fee_ufee;
		this.fee_desc = fee_desc;
	}

	/**
	 * 添加资费表
	 * @param fee_name
	 * @param fee_type
	 * @param fee_btime
	 * @param fee_bfee
	 * @param fee_ufee
	 * @param fee_desc
	 */
	public Fee(String fee_name, int fee_type, int fee_btime, double fee_bfee, double fee_ufee, String fee_desc) {
		super();
		this.fee_name = fee_name;
		this.fee_type = fee_type;
		this.fee_btime = fee_btime;
		this.fee_bfee = fee_bfee;
		this.fee_ufee = fee_ufee;
		this.fee_desc = fee_desc;
	}

	public int getFee_type() {
		return fee_type;
	}

	public void setFee_type(int fee_type) {
		this.fee_type = fee_type;
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
	 * @return the fee_name
	 */
	public String getFee_name() {
		return fee_name;
	}

	/**
	 * @param fee_name the fee_name to set
	 */
	public void setFee_name(String fee_name) {
		this.fee_name = fee_name;
	}

	/**
	 * @return the fee_type
	 */

	/**
	 * @return the fee_btime
	 */
	public int getFee_btime() {
		return fee_btime;
	}

	/**
	 * @param fee_btime the fee_btime to set
	 */
	public void setFee_btime(int fee_btime) {
		this.fee_btime = fee_btime;
	}

	/**
	 * @return the fee_bfee
	 */
	public double getFee_bfee() {
		return fee_bfee;
	}

	/**
	 * @param fee_bfee the fee_bfee to set
	 */
	public void setFee_bfee(double fee_bfee) {
		this.fee_bfee = fee_bfee;
	}

	/**
	 * @return the fee_ufee
	 */
	public double getFee_ufee() {
		return fee_ufee;
	}

	/**
	 * @param fee_ufee the fee_ufee to set
	 */
	public void setFee_ufee(double fee_ufee) {
		this.fee_ufee = fee_ufee;
	}

	/**
	 * @return the fee_cretime
	 */
	public Date getFee_cretime() {
		return fee_cretime;
	}

	/**
	 * @param fee_cretime the fee_cretime to set
	 */
	public void setFee_cretime(Date fee_cretime) {
		this.fee_cretime = fee_cretime;
	}

	/**
	 * @return the fee_otime
	 */
	public Date getFee_otime() {
		return fee_otime;
	}

	/**
	 * @param fee_otime the fee_otime to set
	 */
	public void setFee_otime(Date fee_otime) {
		this.fee_otime = fee_otime;
	}

	/**
	 * @return the fee_status
	 */
	public int getFee_status() {
		return fee_status;
	}

	/**
	 * @param fee_status the fee_status to set
	 */
	public void setFee_status(int fee_status) {
		this.fee_status = fee_status;
	}

	/**
	 * @return the fee_desc
	 */
	public String getFee_desc() {
		return fee_desc;
	}

	/**
	 * @param fee_desc the fee_desc to set
	 */
	public void setFee_desc(String fee_desc) {
		this.fee_desc = fee_desc;
	}

	/**
	 * @return the fee_b1
	 */
	public String getFee_b1() {
		return fee_b1;
	}

	/**
	 * @param fee_b1 the fee_b1 to set
	 */
	public void setFee_b1(String fee_b1) {
		this.fee_b1 = fee_b1;
	}

	/**
	 * @return the fee_b2
	 */
	public String getFee_b2() {
		return fee_b2;
	}

	/**
	 * @param fee_b2 the fee_b2 to set
	 */
	public void setFee_b2(String fee_b2) {
		this.fee_b2 = fee_b2;
	}

	/**
	 * @return the fee_b3
	 */
	public String getFee_b3() {
		return fee_b3;
	}

	/**
	 * @param fee_b3 the fee_b3 to set
	 */
	public void setFee_b3(String fee_b3) {
		this.fee_b3 = fee_b3;
	}

	/**
	 * @return the fee_b4
	 */
	public int getFee_b4() {
		return fee_b4;
	}

	/**
	 * @param fee_b4 the fee_b4 to set
	 */
	public void setFee_b4(int fee_b4) {
		this.fee_b4 = fee_b4;
	}

	/**
	 * @return the fee_b5
	 */
	public int getFee_b5() {
		return fee_b5;
	}

	/**
	 * @param fee_b5 the fee_b5 to set
	 */
	public void setFee_b5(int fee_b5) {
		this.fee_b5 = fee_b5;
	}
	
}
