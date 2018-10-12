package org.lanqiao.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.entity.Pages;
import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;
import org.lanqiao.service.RoleService;
import org.lanqiao.util.RegExpValidatorUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Resource
	private RoleService roleService;
	
	private static int temp=0; 
	@RequestMapping("/getAllRole")
	public String getAllRole(Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		Pages page=new Pages(1,5);
		map.put("page", page);
		List<Role> roles=roleService.getAllRole(map);
		model.addAttribute("roles", roles);
		return "role/role_list";
	}
	@RequestMapping("/removeRoleByRole_id")
	public void removeRoleByRole_id(Role role,PrintWriter out){
		if(roleService.delCheck(role).size()>0){
			out.print(2);
			return;
		}
		int a=roleService.removeRoleByRole_id(role);
		out.print(a);
	}
	@RequestMapping("/changeRole")
	public void changeRole(Role role,String oldName,int[] arrayprivilege,PrintWriter out){
		if(role.getRole_name()==null||!RegExpValidatorUtils.isRole_name(role.getRole_name())){
			out.print(0);
			return;
		}
		if(!oldName.equals(role.getRole_name())){
			if(roleService.check(role)!=null){
				out.print(2);
				return;
			}
		}
		if (role.getRole_name() == "" || role.getRole_name() == null || arrayprivilege == null
				|| arrayprivilege.length == 0) {
			out.print(0);
			return;
		}
		List<Privilege> privileges=new ArrayList<Privilege>();
		for(int pri_id:arrayprivilege){
			Privilege privilege=new Privilege();
			privilege.setPri_id(pri_id);
			privileges.add(privilege);
		}
		role.setPrivileges(privileges);
		int a=roleService.changeRole(role);
		out.print(a);
	}
	@RequestMapping("/addRole")
	public void addRole(Role role,int[] arrayprivilege,PrintWriter out){
		if(temp!=0){
			out.print(3);
			return;
		}
		temp+=1;
		if(role.getRole_name()==null||!RegExpValidatorUtils.isRole_name(role.getRole_name())){
			out.print(0);
			temp=0;
			return;
		}
		if(roleService.check(role)!=null){
			out.print(2);
			temp=0;
			return;
		}
		if (role.getRole_name() == "" || role.getRole_name() == null || arrayprivilege == null
				|| arrayprivilege.length == 0) {
			out.print(0);
			temp=0;
			return;
		}
		List<Privilege> privileges=new ArrayList<Privilege>();
		for(int pri_id:arrayprivilege){
			Privilege privilege=new Privilege();
			privilege.setPri_id(pri_id);
			privileges.add(privilege);
		}
		role.setPrivileges(privileges);
		int a=roleService.addRole(role);
		temp=0;
		out.print(a);
	}
	@RequestMapping("/fillPrivilege")
	public String fillPrivilege(int a,Role role,Model model){
		List<Privilege> privileges=roleService.fillPrivilege();
		model.addAttribute("privileges", privileges);
		if(a==1){
			return "role/role_add";
		}
		if(a==2){
			role=roleService.getRoleByRole_id(role);
			model.addAttribute("role", role);
			return "role/role_modi";
		}
		return "error";
	}
}
