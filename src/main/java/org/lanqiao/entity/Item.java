package org.lanqiao.entity;

import java.sql.Date;

public class Item {

	private int ite_id;
	private Service service;
	private Bill bill;
	private Fee fee;
	private double ite_fee;
	private Date ite_time;
	private String ite1;
	private String ite2;
	private String ite3;
	private int ite4;
	private int ite5;
	
	//item时长
	private long ite_sumtime;
	/**
	 * @return the ite_id
	 */
	public int getIte_id() {
		return ite_id;
	}
	/**
	 * @param ite_id the ite_id to set
	 */
	public void setIte_id(int ite_id) {
		this.ite_id = ite_id;
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
	 * @return the bill
	 */
	public Bill getBill() {
		return bill;
	}
	/**
	 * @param bill the bill to set
	 */
	public void setBill(Bill bill) {
		this.bill = bill;
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
	 * @return the ite_fee
	 */
	public double getIte_fee() {
		return ite_fee;
	}
	/**
	 * @param ite_fee the ite_fee to set
	 */
	public void setIte_fee(double ite_fee) {
		this.ite_fee = ite_fee;
	}
	/**
	 * @return the ite1
	 */
	public String getIte1() {
		return ite1;
	}
	/**
	 * @param ite1 the ite1 to set
	 */
	public void setIte1(String ite1) {
		this.ite1 = ite1;
	}
	/**
	 * @return the ite2
	 */
	public String getIte2() {
		return ite2;
	}
	/**
	 * @param ite2 the ite2 to set
	 */
	public void setIte2(String ite2) {
		this.ite2 = ite2;
	}
	/**
	 * @return the ite3
	 */
	public String getIte3() {
		return ite3;
	}
	/**
	 * @param ite3 the ite3 to set
	 */
	public void setIte3(String ite3) {
		this.ite3 = ite3;
	}
	/**
	 * @return the ite4
	 */
	public int getIte4() {
		return ite4;
	}
	/**
	 * @param ite4 the ite4 to set
	 */
	public void setIte4(int ite4) {
		this.ite4 = ite4;
	}
	/**
	 * @return the ite5
	 */
	public int getIte5() {
		return ite5;
	}
	/**
	 * @param ite5 the ite5 to set
	 */
	public void setIte5(int ite5) {
		this.ite5 = ite5;
	}
	public Date getIte_time() {
		return ite_time;
	}
	public void setIte_time(Date ite_time) {
		this.ite_time = ite_time;
	}
	public long getIte_sumtime() {
		return ite_sumtime;
	}
	public void setIte_sumtime(long ite_sumtime) {
		/*int fee_type = this.fee.getFee_type();
		if(fee_type==1){
			this.ite_fee = this.fee.getFee_bfee();
		}
		if(fee_type==2){
			if(this.fee.getFee_btime()-ite_sumtime<0){
				this.ite_fee = this.fee.getFee_bfee()+((ite_sumtime/3600.0-this.fee.getFee_btime())*this.fee.getFee_ufee());
			}else{
				this.ite_fee = this.fee.getFee_bfee();
			}
		}
		if(fee_type==3){
			this.ite_fee = this.fee.getFee_ufee()*(this.fee.getFee_btime());
		}
		System.out.println("xxx"+ite_fee);*/
		this.ite_sumtime = ite_sumtime;
	}
}
