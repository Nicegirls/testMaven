package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Role;

public interface RoleDao {
	/**
	 * 根据角色ID获取角色
	 * @param privilege
	 * @return
	 */
	public Role selectRoleByRole_id(Role role);
	/**
	 * 获取所有角色信息
	 * @return
	 */
	public List<Role> selectAllRole(Map map);
	/**
	 * 根据角色ID删除角色
	 * @param role
	 * @return
	 */
	public int deleteRoleByRole_id(Role role);
	/**
	 * 根据角色ID清除角色权限
	 * @param role
	 * @return
	 */
	public int deletePrivilegeFromRole(Role role);
	/**
	 * 赋予权限
	 * @param role
	 * @return
	 */
	public int insertPrivilegeFromRole(Role role);
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	public int updateRole(Role role);
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public int insertRole(Role role);
	/**
	 * 填充角色，不获取权限
	 * @return
	 */
	public List<Role> fillRole();
	/**
	 * 查看角色名是否被占用
	 * @param role
	 * @return
	 */
	public Role check(Role role);
	/**
	 * 角色删除检查
	 * @param role
	 * @return
	 */
	public List<Admin> delCheck(Role role);
}
