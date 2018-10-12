package org.lanqiao.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.BillDao;
import org.lanqiao.dao.DetailDao;
import org.lanqiao.dao.ItemDao;
import org.lanqiao.entity.Detail;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Item;

public class BillScheduler {
	
	@Resource
	private BillDao billDao;
	@Resource
	private ItemDao itemDao;
	@Resource
	private DetailDao detailDao;
	
	/**
	 * Quartz调度方法
	 */
	public void execute() {
		
		//汇总资费
		Map map = new HashMap();
		map.put("time", new java.sql.Date(new Date().getTime()));
		List<Item> listItems = itemDao.selectAllItem();
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date()) + ":账单定时任务执行");
		if(listItems!=null&&listItems.size()>0){
			for(Item item : listItems){
				Fee fee = item.getFee();
				if(fee.getFee_type()==1){
					item.setIte_fee(fee.getFee_bfee());
				}
				if(fee.getFee_type()==2){
					if(fee.getFee_btime()-item.getIte_sumtime()<0){
						item.setIte_fee(fee.getFee_bfee()+((item.getIte_sumtime()/3600.0-fee.getFee_btime())*fee.getFee_ufee()));
					}else{
						item.setIte_fee(fee.getFee_bfee());
					}
				}
				if(fee.getFee_type()==3){
					item.setIte_fee(fee.getFee_ufee()*(fee.getFee_btime()));
				}
				itemDao.updateItemSumFee(item);
			}
		}
	}

	// 汇总登录表到日表

	// 汇总日表到月表

	// 汇总月表到年表

	// 删除3年前的记录
}
