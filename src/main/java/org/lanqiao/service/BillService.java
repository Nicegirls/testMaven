package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Bill;

public interface BillService {

	/**
	 * 查询所有账单
	 * @return
	 */
	public List<Bill> getAllBills();
	
	/**
	 * 新增账单
	 * @param bill
	 * @return
	 */
	public int addBill(Account account);
	
	/**
	 * 删除账单
	 * @param bill
	 * @return
	 */
	public int delBill(Bill bill);
	
	/**
	 * 通过Id查询Bill
	 * @param bill
	 * @return
	 */
	public Bill getBillById(Bill bill);
	
	/**
	 * 根据条件查询
	 * @param bill
	 * @param map
	 * @return
	 */
	public List<Bill> getBillByCon(Map map);
	
	/**
	 * 查询总记录数
	 * @return
	 */
	public int getTotalRecords();
	
	public int getTotalRecords(Map map);
	
	/**
	 * 分页
	 * @param map
	 * @return
	 */
	public List<Bill> getBillsPage(Map map);
}
