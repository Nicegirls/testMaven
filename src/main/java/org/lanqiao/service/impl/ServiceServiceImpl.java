package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.BillDao;
import org.lanqiao.dao.ItemDao;
import org.lanqiao.dao.ServiceDao;
import org.lanqiao.entity.Account;
import org.lanqiao.entity.Bill;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Item;
import org.lanqiao.entity.Service;
import org.lanqiao.service.ServiceService;

@org.springframework.stereotype.Service("serviceService")
public class ServiceServiceImpl implements ServiceService {
	@Resource
	private ServiceDao serviceDao ;
	@Resource
	private BillDao billDao ;
	@Resource
	private ItemDao itemDao ;

	@Override
	public List<org.lanqiao.entity.Service> getServiceByCondition(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByCondition(service);
	}
	@Override
	public List<Service> getServiceByPaging(Map map) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByPaging(map);
	}
	
	@Override
	public org.lanqiao.entity.Service getServiceByID(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByID(service) ;
	}
	
	@Override
	public Service getServiceByOs(Service service) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByOs(service);
	}

	@Override
	public List<org.lanqiao.entity.Service> getAllService() {
		// TODO Auto-generated method stub
		return serviceDao.selectAllService();
	}

	@Override
	public boolean addService(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		int i = 0 ;
		int j = 0 ;
		int acc_id = service.getAcc_id() ;
		Account account = new Account() ;
		Item item = new Item() ;
		Fee fee = new Fee() ;
		fee.setFee_id(service.getFee_id());
		account.setAcc_id(acc_id);
		i = serviceDao.insertService(service) ;
		Bill bill = billDao.selectBillByAcc(account) ;
		item.setBill(bill);
		item.setService(service);
		item.setFee(fee);
		j = itemDao.insertItem(item) ;
		if(i > 0 && j > 0) return true ;
		else      return false ;
	}

	@Override
	public boolean updateServiceFeeID(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		int i = 0 ;
		i = serviceDao.updateServiceFeeID(service) ;
		if(i > 0) return true ;
		else	  return false;
	}

	@Override
	public org.lanqiao.entity.Service getServiceByItem(Item item) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByItem(item);
	}

	@Override
	public boolean delServiceByID(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		int i = 0 ;
		i = serviceDao.deleteServiceByID(service) ;
		if(i > 0) return true ;
		else      return false;
	}

	@Override
	public boolean openServiceByID(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		int i = 0 ;
		i = serviceDao.openServiceByID(service) ;
		if(i > 0) return true ;
		else	  return false;
	}

	@Override
	public boolean stopServiceByID(org.lanqiao.entity.Service service) {
		// TODO Auto-generated method stub
		int i = 0  ;
		i = serviceDao.stopServiceByID(service) ;
		if(i > 0) return true ;
		else	  return false;
	}
	@Override
	public List<org.lanqiao.entity.Service> selectServiceByCondition(Map map) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByCondition(map);
	}
	public boolean deleteServiceByID1(Service service){
		int i = 0  ;
		i = serviceDao.deleteServiceByID1(service);
		if(i > 0) return true ;
		else	  return false;
	}
	public boolean openServiceByID1(Service service){
		int i = 0  ;
		i = serviceDao.openServiceByID1(service);
		if(i > 0) return true ;
		else	  return false;
	}
	public boolean stopServiceByID1(Service service){
		int i = 0  ;
		i = serviceDao.stopServiceByID1(service);
		if(i > 0) return true ;
		else	  return false;
	}
	

	

}
