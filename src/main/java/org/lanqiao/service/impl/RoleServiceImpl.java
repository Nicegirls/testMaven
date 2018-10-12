package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.PrivilegeDao;
import org.lanqiao.dao.RoleDao;
import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;
import org.lanqiao.service.RoleService;
import org.springframework.stereotype.Service;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roleDao;
	@Resource
	private PrivilegeDao privilegeDao;
	
	@Override
	public Role getRoleByRole_id(Role role) {
		// TODO Auto-generated method stub
		return roleDao.selectRoleByRole_id(role);
	}
	
	public List<Role> getAllRole(Map map){
		return roleDao.selectAllRole(map);
	}
	
	public int removeRoleByRole_id(Role role){
		int a=0;
		roleDao.deletePrivilegeFromRole(role);
		a=roleDao.deleteRoleByRole_id(role);
		if(a!=0){
			a=1;
		}
		return a;
	}
	
	public int changeRole(Role role){
		int a=0;
		roleDao.deletePrivilegeFromRole(role);
		roleDao.insertPrivilegeFromRole(role);
		a=roleDao.updateRole(role);
		if(a!=0){
			a=1;
		}
		return a;
	}
	
	public int addRole(Role role){
		int a=0;
		roleDao.insertRole(role);
		a=roleDao.insertPrivilegeFromRole(role);
		if(a!=0){
			a=1;
		}
		return a;
	}
	public List<Role> fillRole(){
		return roleDao.fillRole();
	}
	
	public List<Privilege> fillPrivilege(){
		return privilegeDao.fillPrivilege();
	}
	
	public Role check(Role role){
		return roleDao.check(role);
	}
	public List<Admin> delCheck(Role role){
		return roleDao.delCheck(role);
	}
}
