package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Service;

public interface FeeDao {
	/**
	 * 增加资费信息
	 * @param userinfo
	 * @return
	 */
	public int insertFee(Fee fee);
	
	/**
	 * 删除资费信息
	 * @param userinfo
	 * @return
	 */
	public int deleteFee(Fee fee);
	
	/**
	 * 修改资费信息
	 * @param fee
	 * @return
	 */
	public int updateFee(Fee fee);
	
	/**
	 * 查询所有资费信息
	 * @return
	 */
	public List<Fee> getAllFeesMap(Map map);
	public List<Fee> getAllFees();
	public List<Fee> getAllFeesByState();
	
	/**
	 * 根据id查询所有的信息进行修改
	 * @param fee
	 * @return
	 */
	public Fee idModiFee(Fee fee);
	
	/**
	 * 修改资费使用状态
	 * @param fee
	 * @return
	 */
	public int updateFeeState(Fee fee);
	
	/**
	 * @param fee
	 * @return
	 */
	public Fee selectFeeByID(Fee fee);
	
	/**
	 * 根据条件排序
	 * @param map
	 * @return
	 */
	public List<Fee> sortFee(Map map);
	/**
	 * 获取Fee的总数
	 * @return
	 */
	public int countFee();
	/**
	 * 验证资费名是否被占用
	 * @param fee
	 * @return
	 */
	public Fee check(Fee fee);
}
