package org.lanqiao.service;

import java.util.List;
import java.util.Map;

import org.lanqiao.entity.Detail;
import org.lanqiao.entity.Item;

public interface DetailService {
	
	public List<Detail> getDetailById(Item item);
	
	public List<Detail> getDetailByLimit(Map map);
	
	public int getTotalRecord(Item item);
}
