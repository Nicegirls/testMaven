package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Bill;

public interface BillDao {

	/**
	 * 查询所有账单
	 * @return
	 */
	public List<Bill> selectAllBills();
	
	/**
	 * 生成账单
	 * @param bill
	 * @return
	 */
	public int insertBill(Account account);
	
	/**
	 * 删除三年前的账单
	 * @param bill
	 * @return
	 */
	public int deleteBill(Bill bill);
	
	/**
	 * 根据条件查询账单
	 * @param bill
	 * @return
	 */
	public List<Bill> selectBillByCon(Map map);
	
	/**
	 * 根据Id查询Bill
	 * @param bill
	 * @return
	 */
	public Bill selectBillById(Bill bill);
	
	/**
	 * 分页
	 * @param map
	 * @return
	 */
	public List<Bill> selectBillsPage(Map map);
	
	/**
	 * 查询总记录数
	 * @return
	 */
	public int selectTotalRecord1();
	
	/**
	 * 根据acc_id查询Bill
	 * @param account
	 * @return
	 */
	public Bill selectBillByAcc(Account account);
	
	/**
	 * 含搜索条件的总记录数
	 * @param map
	 * @return
	 */
	public int selectTotalRecords(Map map);
}
