package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;

public interface AdminService {
	/**
	 * 用户登录验证
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin);
	/**
	 * 在添加用户界面显示所有角色名称
	 * @return
	 */
	public List<Role> showRole_Name();
	/**
	 * 添加用户
	 * @param admin
	 * @return
	 */
	public int insertAdmin(Admin admin);
	/**
	 * 添加用户对应的角色
	 * @param admin
	 * @return
	 */
	public int insertAdm_Role(Admin admin);
	/**
	 * 显示所有用户的信息
	 * @return
	 */
	public List<Admin> showAdmin();
	/**
	 * 显示要修改的用户信息
	 * @return
	 */
	public Admin showUpdateAdmin(Admin admin);
	/**
	 * 显示要修改的用户对应的角色ID号
	 * @return
	 */
	public List<Role> showUpdateRole_id(Admin admin);
	/**
	 * 更新用户信息
	 * @return
	 */
	public int updateAdmin(Admin admin);
	/**
	 * 删除用户对应的角色
	 * @return
	 */
	public int deleteAdm_Role(Admin admin);
	/**
	 * 更新用户对应的角色
	 * @return
	 */
	public int updateAdm_Role(Admin admin);
	/**
	 * 删除用户
	 * @param admin
	 * @return
	 */
	public int deleteAdmin(Admin admin);
	/**
	 * 密码重置
	 * @param admins
	 * @return
	 */
	public int newAdm_Psw(List<Admin> admins);
	/**
	 * 搜索用户
	 * @param map
	 * @return
	 */
	public List<Admin> selectAdminByMap(Map map);
	/**
	 * 权限验证
	 * @param admin
	 * @return
	 */
	public List<Privilege> loginPri(Admin admin);
	/**
	 * 主页的“个人信息”修改
	 * @param admin
	 * @return
	 */
	public int updateUser(Admin admin);
	/**
	 * 主页的“密码”修改
	 * @param admin
	 * @return
	 */
	public int updatePswUser(Admin admin);
	/**
	 * 显示用户主页个人信息
	 * @param admin
	 * @return
	 */
	public Admin showUserInfo(Admin admin);
	/**
	 * 验证账号输入是否正确
	 * @param admin
	 * @return
	 */
	public Admin checkAdm_Account(Admin admin);
	/**
	 * 检查是否有重名的管理员账号
	 * @return
	 */
	public List<Admin> checkAccount();
	/**
	 * 根据用户ID查找用户密码
	 * @param admin
	 * @return
	 */
	public Admin selectAdm_Psw(Admin admin);
}
