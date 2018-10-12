package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;

public interface PrivilegeDao {

	public List<Privilege> selectPrivilegeByRole_id(Role role);
	
	public List<Privilege> fillPrivilege();
}
