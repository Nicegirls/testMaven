package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.AccountDao;
import org.lanqiao.dao.BillDao;
import org.lanqiao.entity.Account;
import org.lanqiao.service.AccountService;
import org.lanqiao.service.BillService;
import org.springframework.stereotype.Service;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
	
	@Resource
	private AccountDao accountDao;
	@Resource
	private BillDao billDao;

	@Override
	public boolean insertAccount(Account account) {
		// TODO Auto-generated method stub
		int i=accountDao.insertAccount(account);
		System.out.println(account.getAcc_id());
		i = billDao.insertBill(account);
		if(i>0) return true;
		return false;
	}

	@Override
	public boolean deleteAccount(Account account) {
		// TODO Auto-generated method stub
		int i=accountDao.deleteAccount(account);
		if(i>0) return true;
		return false;
	}

	@Override
	public boolean updateAccountState(Account account) {
		// TODO Auto-generated method stub
		int i=accountDao.updateAccountState(account);
		if(i>0) return true;
		return false;
	}
	
	public boolean updateAccountState1(Account account){
		int i=accountDao.updateAccountState1(account);
		if(i>0) return true;
		return false;
	}

	@Override
	public List<Account> selectAllAccounts(Account account) {
		// TODO Auto-generated method stub
		return accountDao.selectAllAccounts(account);
	}
	
	
	public Account selectAccountByID(Account account){
		return accountDao.selectAccountByID(account);
	}
	
	public Account selectAccountByIDCard(Account account){
		return accountDao.selectAccountByIDCard(account);
	}
	
	public boolean updateAllAccount(Account account){
		int i=accountDao.updateAllAccount(account);
		if(i>0) return true;
		return false;
	}
	public List<Account> selectAccountByCondition(Map map){
		return  accountDao.selectAccountByCondition(map);		 
	}
	
	public int selectAllTotleSize(){
		return accountDao.selectAllTotleSize();
	}

}
