package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.FeeDao;
import org.lanqiao.entity.Fee;
import org.lanqiao.service.FeeService;
import org.springframework.stereotype.Service;

@Service("feeService")
public class FeeServiceImpl implements FeeService {

	@Resource
	private FeeDao feeDao;
	/**
	 * 修改返回值为int SYQ
	 */
	@Override
	public int insertFee(Fee fee) {
		// TODO Auto-generated method stub
		int i = feeDao.insertFee(fee);
		if(i>0){
			return 1;
		}else{
			return 0;
		}
//		if(i>0) return true;
//		else    return false;
	}
	@Override
	public boolean deleteFee(Fee fee) {
		// TODO Auto-generated method stub
		int i = feeDao.deleteFee(fee);
		if(i>0) return true;
		else    return false;
	}

	@Override
	public int updateFee(Fee fee) {
		// TODO Auto-generated method stub
		int a = feeDao.updateFee(fee);
		if(a!=0){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public List<Fee> getAllFeesMap(Map map) {
		// TODO Auto-generated method stub
		return feeDao.getAllFeesMap(map);
	}
	public List<Fee> getAllFees() {
		// TODO Auto-generated method stub
		return feeDao.getAllFees();
	}
	public List<Fee> getAllFeesByState() {
		// TODO Auto-generated method stub
		return feeDao.getAllFeesByState();
	}

	@Override
	public Fee idModiFee(Fee fee) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateFeeState(Fee fee) {
		// TODO Auto-generated method stub
		int i = feeDao.updateFeeState(fee);
		if(i>0) return true;
		else    return false;
	}

	@Override
	public Fee selectFeeByID(Fee fee) {
		// TODO Auto-generated method stub
		return feeDao.selectFeeByID(fee);
		
	}
	@Override
	public List<Fee> sortFee(Map map) {
		// TODO Auto-generated method stub
		return feeDao.sortFee(map);
	}
	@Override
	public int countFee(){
		return feeDao.countFee();
	}
	
	public Fee check(Fee fee){
		return feeDao.check(fee);
	}
}
