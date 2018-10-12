package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Account;

public interface AccountService {
	/**
	 * 添加账务账号
	 * @param account
	 * @return
	 */
	public boolean insertAccount(Account account);
	/**
	 * 删除账务账号
	 * @param account
	 * @return
	 */
	public boolean deleteAccount(Account account);
	/**
	 * 修改账务账号状态（修改为暂停）
	 * @param account
	 * @return
	 */
	public boolean updateAccountState(Account account);
	/**
	 * 修改账务账号状态(修改为开通)
	 * @param account
	 * @return
	 */
	public boolean updateAccountState1(Account account);
	/**
	 * 查询所有账务账号信息
	 * @param account
	 * @return
	 */
	public List<Account> selectAllAccounts(Account account);
	/**
	 * 通过账务账号ID查询信息
	 * @return
	 */
	public Account selectAccountByID(Account account);
	/**
	 * 通过身份证查询账务账号信息
	 * @param account
	 * @return
	 */
	public Account selectAccountByIDCard(Account account);
	/**
	 * 修改所有账务账号信息
	 * @param account
	 * @return
	 */
	public boolean updateAllAccount(Account account);
	/**
	 * 多条件查询账务账号信息
	 * @param account
	 * @return
	 */
	public List<Account> selectAccountByCondition(Map map);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int selectAllTotleSize();

}
