package org.lanqiao.dao;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Detail;
import org.lanqiao.entity.Item;

public interface DetailDao {

	public List<Detail> selectDetailById(Item item);
	
	public List<Detail> selectDetailByLimit(Map map);
	
	public int selectToltalRecord(Item item);
	
	public List<Detail> selectDetailByTime(Map map);
}
