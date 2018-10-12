package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.BillDao;
import org.lanqiao.dao.ItemDao;
import org.lanqiao.entity.Account;
import org.lanqiao.entity.Bill;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Item;
import org.lanqiao.service.BillService;
import org.springframework.stereotype.Service;

@Service("billService")
public class BillServiceImpl implements BillService {

	@Resource
	private BillDao billDao;
	@Resource
	private ItemDao itemDao;
	
	@Override
	public List<Bill> getAllBills() {
		return billDao.selectAllBills();
	}

	@Override
	public int addBill(Account account) {
		// TODO Auto-generated method stub
		return billDao.insertBill(account);
	}

	@Override
	public int delBill(Bill bill) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Bill getBillById(Bill bill) {
		return billDao.selectBillById(bill);
	}

	@Override
	public List<Bill> getBillByCon(Map map) {
		List<Bill> listBill = billDao.selectBillByCon(map);
		listBill = setBill_sumfee(listBill);
		return listBill;
	}

	@Override
	public int getTotalRecords() {
		return billDao.selectTotalRecord1();
	}

	@Override
	public List<Bill> getBillsPage(Map map) {
		List list = billDao.selectBillsPage(map);
		list = setBill_sumfee(list);
		//return billDao.selectBillsPage(map);
		return list;
	}

	@Override
	public int getTotalRecords(Map map) {
		return billDao.selectTotalRecords(map);
	}
	
	public List<Bill> setBill_sumfee(List<Bill> list){
		
		if(list!=null&&list.size()>0){
			for(Bill bill : list){
				double bill_sumfee = 0;
				List<Item> listItems = itemDao.selectItemByBill(bill);
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
					}
				}
				bill.setBill_sumfee(bill_sumfee);
			}
		}
		return list;
	}
}
