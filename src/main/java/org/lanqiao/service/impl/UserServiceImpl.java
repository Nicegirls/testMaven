package org.lanqiao.service.impl;

import javax.annotation.Resource;

import org.lanqiao.dao.UserDao;
import org.lanqiao.entity.User;
import org.lanqiao.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public int addDetail(User user) {
		return userDao.insertDetail(user);
	}

	@Override
	public int updateDetail(User user) {
		return userDao.logout(user);
	}

	@Override
	public User getUserById(User user) {
		return userDao.selectUserById(user);
	}

	@Override
	public int updateDetFee(User user) {
		return userDao.updateDetFee(user);
	}

}
