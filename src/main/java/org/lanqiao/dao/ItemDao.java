package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Bill;
import org.lanqiao.entity.Item;

public interface ItemDao {

	/**
	 * 根据账单id查询明细
	 * @param bill
	 * @return
	 */
	public List<Item> selectItemByBill(Bill bill);
	
	/**
	 * 根据Item查询Item的所用时长
	 * @param item
	 * @return
	 */
	public long selectSumtime(Item item);
	
	/**
	 * 插入item
	 * @param item
	 * @return
	 */
	public int insertItem(Item item);
	
	/**
	 * 分页查询
	 * @param map
	 * @return
	 */
	public List<Item> selectItemByBillLimit(Map map);
	
	/**
	 * 总记录数
	 * @return
	 */
	public int selectToltalRecord(Bill bill);
	
	/**
	 * 插入费用
	 * @param listItems
	 * @return
	 */
	public int updateItemSumFee(Item item);
	
	
	public long selectSumTime(Account account);
	
	/**
	 * 查询所有Item
	 * @return
	 */
	public List<Item> selectAllItem();
	
	/**
	 * 查询Item的信息
	 * @param item
	 * @return
	 */
	public Item selectSerByIte(Item item);
}
