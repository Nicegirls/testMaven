package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;

public interface RoleService {
	/**
	 * 根据角色ID查找角色相关信息
	 * @param role
	 * @return
	 */
	public Role getRoleByRole_id(Role role);
	/**
	 * 查找所有角色
	 * @return
	 */
	public List<Role> getAllRole(Map map);
	/**
	 * 根据角色ID删除角色
	 * @param role
	 * @return
	 */
	public int removeRoleByRole_id(Role role);
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	public int changeRole(Role role);
	/**
	 * 增加角色
	 * @param role
	 * @return
	 */
	public int addRole(Role role);
	/**
	 * 填充角色，不获取权限
	 * @return
	 */
	public List<Role> fillRole();
	
	public List<Privilege> fillPrivilege();
	/**
	 * 查看角色名是否被占用
	 * @param role
	 * @return
	 */
	public Role check(Role role);
	/**
	 * 删除验证
	 * @param role
	 * @return
	 */
	public List<Admin> delCheck(Role role);
}
