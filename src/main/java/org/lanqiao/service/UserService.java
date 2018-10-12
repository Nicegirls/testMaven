package org.lanqiao.service;

import org.lanqiao.entity.User;

public interface UserService {

	public User login(User user);
	
	public int addDetail(User user);
	
	public int updateDetail(User user);
	
	public User getUserById(User user);
	
	public int updateDetFee(User user);
}
