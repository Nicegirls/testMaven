package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Bill;
import org.lanqiao.entity.Item;

public interface ItemService {

	/**
	 * 根据账单id查询明细
	 * @param bill
	 * @return
	 */
	public List<Item> getItemByBill(Bill bill);
	
	/**
	 * 插入item
	 * @param item
	 * @return
	 */
	public int addService(Item item);
	
	/**
	 * 分页
	 * @param map
	 * @return
	 */
	public List<Item> selectItemByBillLimit(Map map);
	
	public int getTotalRecord(Bill bill);
	
	public List<Item> updateItemSumfee(Map map);
	
	public Item getSerByIte(Item item);
}
