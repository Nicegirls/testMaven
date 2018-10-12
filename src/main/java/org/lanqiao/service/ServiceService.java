/**
 * 
 */
package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Item;
import org.lanqiao.entity.Service;

/**
 * @author Administrator
 *
 */
public interface ServiceService {
	/**
	 * 查询所有业务信息
	 * @return
	 */
	public List<Service> getAllService() ;
	/**
	 * 通过ID查询业务信息
	 * @param service
	 * @return
	 */
	public Service getServiceByID(Service service) ;
	/**
	 * 根据os查询业务信息
	 * @param service
	 * @return
	 */
	public Service getServiceByOs(Service service) ;
	/**
	 * 按条件查询业务信息
	 * @param service
	 * @return
	 */
	public List<Service> getServiceByCondition(Service service) ;
	/**
	 * 分页
	 * @param service
	 * @param startSize
	 * @param pageSize
	 * @return
	 */
	public List<Service> getServiceByPaging(Map map) ;
	/**
	 * 添加业务信息
	 * @param service
	 * @return
	 */
	public boolean addService(Service service) ;
	/**
	 * 修改业务信息
	 * @param service
	 * @return
	 */
	public boolean updateServiceFeeID(Service service) ;
	public Service getServiceByItem(Item item) ;
	
	/**
	 * 通过id删除业务信息
	 * @param service
	 * @return
	 */
	public boolean delServiceByID(Service service) ;
	/**
	 * 删除业务通过账务id
	 * @param service
	 * @return
	 */
	public boolean deleteServiceByID1(Service service) ;
	/**
	 * 开通业务通过业务id
	 * @param service
	 * @return
	 */
	public boolean openServiceByID(Service service) ;
	/**
	 * 开通业务通过账务id
	 * @param service
	 * @return
	 */
	public boolean openServiceByID1(Service service) ;
	/**
	 * 暂停业务通过业务id
	 * @param service
	 * @return
	 */
	public boolean stopServiceByID(Service service) ;
	/**
	 * 暂停业务通过账务id
	 * @param service
	 * @return
	 */
	public boolean stopServiceByID1(Service service) ;
	/**
	 * 按条件来查询业务信息
	 * @param map
	 * @return
	 */
	public List<Service> selectServiceByCondition(Map map);
	
}
