package org.lanqiao.entity;

import java.util.List;

public class Admin {

	private int adm_id;//用户ID
	private String adm_name;//用户名
	private String adm_account;//用户账号
	private String adm_psw;//用户密码
	private String adm_repsw;//重复用户密码
	private String oldpsw;//旧密码
	private String newpsw;//新密码
	private String renewpsw;//重复新密码
	private String adm_portrait;//存储图片存放的路径
	private String adm_email;//用户email
	private String adm_phonenum;//用户电话
	private String adm_create_time;	
	private List<Role> role_name;//显示角色名称
	private List<Role> role_id;//存放用户对应的角色ID
	private String[] like;
	private List<Role> list;//获取选中的角色名称对应的ID号，存入adm_role
	private String per_name;
	private List<Privilege> adminPri;
	public String getAdm_repsw() {
		return adm_repsw;
	}
	public void setAdm_repsw(String adm_repsw) {
		this.adm_repsw = adm_repsw;
	}
	public String getOldpsw() {
		return oldpsw;
	}
	public void setOldpsw(String oldpsw) {
		this.oldpsw = oldpsw;
	}
	public String getNewpsw() {
		return newpsw;
	}
	public void setNewpsw(String newpsw) {
		this.newpsw = newpsw;
	}
	public String getRenewpsw() {
		return renewpsw;
	}
	public void setRenewpsw(String renewpsw) {
		this.renewpsw = renewpsw;
	}
	public List<Privilege> getAdminPri() {
		return adminPri;
	}
	public void setAdminPri(List<Privilege> adminPri) {
		this.adminPri = adminPri;
	}
	public List<Role> getRole_id() {
		return role_id;
	}
	public void setRole_id(List<Role> role_id) {
		this.role_id = role_id;
	}
	public String getPer_name() {
		return per_name;
	}
	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}
	public String getAdm_create_time() {
		return adm_create_time;
	}
	public void setAdm_create_time(String adm_create_time) {
		this.adm_create_time = adm_create_time;
	}
	public String getAdm_phonenum() {
		return adm_phonenum;
	}
	public void setAdm_phonenum(String adm_phonenum) {
		this.adm_phonenum = adm_phonenum;
	}
	public String[] getLike() {
		return like;
	}
	public void setLike(String[] like) {
		this.like = like;
	}
	public List<Role> getList() {
		return list;
	}
	public void setList(List<Role> list) {
		this.list = list;
	}
	public String getAdm_portrait() {
		return adm_portrait;
	}
	public void setAdm_portrait(String adm_portrait) {
		this.adm_portrait = adm_portrait;
	}
	public String getAdm_email() {
		return adm_email;
	}
	public void setAdm_email(String adm_email) {
		this.adm_email = adm_email;
	}
	public List<Role> getRole_name() {
		return role_name;
	}
	public void setRole_name(List<Role> role_name) {
		this.role_name = role_name;
	}
	/**
	 * @return the adm_id
	 */
	public int getAdm_id() {
		return adm_id;
	}
	/**
	 * @param adm_id the adm_id to set
	 */
	public void setAdm_id(int adm_id) {
		this.adm_id = adm_id;
	}
	/**
	 * @return the adm_name
	 */
	public String getAdm_name() {
		return adm_name;
	}
	/**
	 * @param adm_name the adm_name to set
	 */
	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
	/**
	 * @return the adm_account
	 */
	public String getAdm_account() {
		return adm_account;
	}
	/**
	 * @param adm_account the adm_account to set
	 */
	public void setAdm_account(String adm_account) {
		this.adm_account = adm_account;
	}
	public String getAdm_psw() {
		return adm_psw;
	}
	public void setAdm_psw(String adm_psw) {
		this.adm_psw = adm_psw;
	}

}
