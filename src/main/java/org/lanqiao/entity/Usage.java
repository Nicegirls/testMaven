package org.lanqiao.entity;

public class Usage {

	private String ser_os;
	private String ser_ip;
	private int fee_type;
	private String fee_name;
	private String fee_desc;
	
	private String type;
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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
	 * @return the fee_type
	 */
	public int getFee_type() {
		return fee_type;
	}
	/**
	 * @param fee_type the fee_type to set
	 */
	public void setFee_type(int fee_type) {
		if(fee_type==1)
			this.type="包月";
		if(fee_type==2)
			this.type="套餐";
		if(fee_type==3)
			this.type="计时";
		this.fee_type = fee_type;
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
	
	
}
