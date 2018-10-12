package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.AdminDao;
import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;
import org.lanqiao.service.AdminService;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource
	private AdminDao adminDao;
	
	@Override
	public Admin login(Admin admin) {
		
		return adminDao.login(admin);
	}

	@Override
	public List<Role> showRole_Name() {
		// TODO Auto-generated method stub
		return adminDao.showRole_Name();
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.insertAdmin(admin);
	}

	@Override
	public int insertAdm_Role(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.insertAdm_Role(admin);
	}

	@Override
	public List<Admin> showAdmin() {
		// TODO Auto-generated method stub
		return adminDao.showAdmin();
	}

	@Override
	public Admin showUpdateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.showUpdateAdmin(admin);
	}

	@Override
	public List<Role> showUpdateRole_id(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.showUpdateRole_id(admin);
	}
	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updateAdmin(admin);
	}

	@Override
	public int deleteAdm_Role(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.deleteAdm_Role(admin);
	}

	@Override
	public int updateAdm_Role(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updateAdm_Role(admin);
	}

	@Override
	public int deleteAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.deleteAdmin(admin);
	}

	@Override
	public int newAdm_Psw(List<Admin> admins){
		int a=0;
		a=adminDao.newAdm_Psw(admins);
		if(a!=0){
			a=1;
		}
		return a;
	}
	@Override
	public List<Admin> selectAdminByMap(Map map) {
		// TODO Auto-generated method stub
		return adminDao.selectAdminByMap(map);
	}

	@Override
	public List<Privilege> loginPri(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.loginPri(admin);
	}
	@Override
	public int updateUser(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updateUser(admin);
	}

	@Override
	public int updatePswUser(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updatePswUser(admin);
	}

	@Override
	public Admin showUserInfo(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.showUserInfo(admin);
	}

	@Override
	public Admin checkAdm_Account(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.checkAdm_Account(admin);
	}

	@Override
	public List<Admin> checkAccount() {
		// TODO Auto-generated method stub
		return adminDao.checkAccount();
	}

	@Override
	public Admin selectAdm_Psw(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.selectAdm_Psw(admin);
	}
}
