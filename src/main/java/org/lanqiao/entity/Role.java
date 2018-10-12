package org.lanqiao.entity;

import java.util.List;

public class Role {
	
	private int role_id;
	private String role_name;
	private List<Privilege> privileges;
	private String strPri_name;
	private String strPri_id;
	public String getStrPri_name() {
		String str="";
		for(int i=0;i<privileges.size();i++){
			if(i==privileges.size()-1){
				if(privileges.get(i).getPri_name()==null){
					break;
				}
				str+=privileges.get(i).getPri_name();
			}else{
				str+=privileges.get(i).getPri_name()+"、";
			}
		}
		this.setStrPri_name(str);
		return strPri_name;
	}
	public void setStrPri_name(String strPri_name) {
		this.strPri_name = strPri_name;
	}
	public String getStrPri_id() {
		String str="";
		for(int i=0;i<privileges.size();i++){
			if(i==privileges.size()-1){
				if(privileges.get(i).getPri_id()==0){
					break;
				}
				str+=privileges.get(i).getPri_id();
			}else{
				str+=privileges.get(i).getPri_id()+"、";
			}
		}
		this.setStrPri_id(str);
		return strPri_id;
	}
	public void setStrPri_id(String strPri_id) {
		this.strPri_id = strPri_id;
	}
	public List<Privilege> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(List<Privilege> privileges) {
		this.privileges = privileges;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
}
