package org.lanqiao.dao;

import org.lanqiao.entity.User;

public interface UserDao {

	public User login(User user);
	
	public int insertDetail(User user);
	
	public int logout(User user);
	
	public User selectUserById(User user);
	
	public int updateDetFee(User user);
	
	public long selectTotaltime(User user);
}
