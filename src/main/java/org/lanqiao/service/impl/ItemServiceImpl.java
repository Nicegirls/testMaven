package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.ItemDao;
import org.lanqiao.dao.ReportDao;
import org.lanqiao.entity.Bill;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Item;
import org.lanqiao.service.ItemService;
import org.springframework.stereotype.Service;

@Service("itemService")
public class ItemServiceImpl implements ItemService {

	@Resource
	private ItemDao itemDao;
	
	@Override
	public List<Item> getItemByBill(Bill bill) {
		List<Item> listItems = itemDao.selectItemByBill(bill);
		double ite_fee = 0;
		if (listItems.size()>0) {
			for (Item ite : listItems) {
				Fee fee = ite.getFee();
				if(fee.getFee_type()==1){
					ite.setIte_fee(fee.getFee_bfee());
				}
				if(fee.getFee_type()==2){
					if(fee.getFee_btime()-ite.getIte_sumtime()<0){
						ite.setIte_fee(fee.getFee_bfee()+((ite.getIte_sumtime()/3600.0-fee.getFee_btime())*fee.getFee_ufee()));
					}else{
						ite.setIte_fee(fee.getFee_bfee());
					}
				}
				if(fee.getFee_type()==3){
					ite.setIte_fee((ite.getIte_sumtime()/3600.0)*fee.getFee_ufee());
				}
				itemDao.updateItemSumFee(ite);
			}
		}
		return listItems;
	}

	@Override
	public int addService(Item item) {
		return 0;
	}

	@Override
	public List<Item> selectItemByBillLimit(Map map) {
		List<Item> listItems = itemDao.selectItemByBillLimit(map);
		double bill_sumfee = 0;
		if (listItems.size()>0) {
			for (Item ite : listItems) {
				Fee fee = ite.getFee();
				if(fee.getFee_type()==1){
					ite.setIte_fee(fee.getFee_bfee());
				}
				if(fee.getFee_type()==2){
					if(fee.getFee_btime()-(ite.getIte_sumtime()/3600.0)<0){
						ite.setIte_fee(fee.getFee_bfee()+((ite.getIte_sumtime()/3600.0-fee.getFee_btime())*fee.getFee_ufee()));
					}else{
						ite.setIte_fee(fee.getFee_bfee());
					}
				}
				if(fee.getFee_type()==3){
					ite.setIte_fee((ite.getIte_sumtime()/3600.0)*fee.getFee_ufee());
				}
				bill_sumfee = bill_sumfee+ite.getIte_fee();
				itemDao.updateItemSumFee(ite);
			}
		}
		return listItems;
	}

	@Override
	public int getTotalRecord(Bill bill) {
		return itemDao.selectToltalRecord(bill);
	}

	@Override
	public List<Item> updateItemSumfee(Map map) {
		List<Item> listItems = itemDao.selectItemByBillLimit(map);
		double bill_sumfee = 0;
		if (listItems.size()>0) {
			for (Item ite : listItems) {
				Fee fee = ite.getFee();
				if(fee.getFee_type()==1){
					ite.setIte_fee(fee.getFee_bfee());
				}
				if(fee.getFee_type()==2){
					if(fee.getFee_btime()-(ite.getIte_sumtime()/3600.0)<0){
						ite.setIte_fee(fee.getFee_bfee()+((ite.getIte_sumtime()/3600.0-fee.getFee_btime())*fee.getFee_ufee()));
					}else{
						ite.setIte_fee(fee.getFee_bfee());
					}
				}
				if(fee.getFee_type()==3){
					ite.setIte_fee(fee.getFee_ufee()*(fee.getFee_btime()));
				}
				bill_sumfee = bill_sumfee+ite.getIte_fee();
				itemDao.updateItemSumFee(ite);
			}
		}
		return listItems;
	}

	@Override
	public Item getSerByIte(Item item) {
		return itemDao.selectSerByIte(item);
	}
	
	
}
