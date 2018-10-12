/**
 * 
 */
package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Detail;
import org.lanqiao.entity.Item;
import org.lanqiao.entity.Service;

/**
 * @author Administrator
 *
 */
public interface ServiceDao {
	/**
	 * 查询所有业务信息
	 * @return
	 */
	public List<Service> selectAllService() ;
	/**
	 * 通过ID查询业务信息
	 * @param service
	 * @return
	 */
	public Service selectServiceByID(Service service) ;
	/**
	 * 根据os查询业务信息
	 * @param service
	 * @return
	 */
	public Service selectServiceByOs(Service service) ;

	
	/**
	 * 按条件查询
	 * @param service
	 * @return
	 */
	public List<Service> selectServiceByCondition(Service service) ;
	/**
	 * 分页
	 * @param service
	 * @param startSize
	 * @param pageSize
	 * @return
	 */
	public List<Service> selectServiceByPaging(Map map) ;
	/**
	 * 添加业务信息
	 * @param service
	 * @return
	 */
	public int insertService(Service service) ;
	/**
	 * 更改业务信息
	 * @param service
	 * @return
	 */
	public int updateServiceFeeID(Service service) ;
	/**
	 * 
	 * @param item
	 * @return
	 */
	public Service selectServiceByItem(Item item) ;
	/**
	 * 删除业务通过业务id
	 * @param service
	 * @return
	 */
	public int deleteServiceByID(Service service) ;
	/**
	 * 删除业务通过账务id
	 * @param service
	 * @return
	 */
	public int deleteServiceByID1(Service service) ;
	/**
	 * 开通业务通过业务id
	 * @param service
	 * @return
	 */
	public int openServiceByID(Service service) ;
	/**
	 * 开通业务通过账务id
	 * @param service
	 * @return
	 */
	public int openServiceByID1(Service service) ;
	/**
	 * 暂停业务通过业务id
	 * @param service
	 * @return
	 */
	public int stopServiceByID(Service service) ;
	/**
	 * 暂停业务通过账务id
	 * @param service
	 * @return
	 */
	public int stopServiceByID1(Service service) ;

	/**
	 * 按条件来查询业务信息
	 * @param map
	 * @return
	 */
	public List<Service> selectServiceByCondition(Map map);
	
	/**
	 * 查询detail对应的service
	 * @param detail
	 * @return
	 */
	public List<Service> selectServiceByDetail(Detail detail);
	
}
