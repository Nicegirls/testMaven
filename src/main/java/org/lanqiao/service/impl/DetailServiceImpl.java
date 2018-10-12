package org.lanqiao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.dao.DetailDao;
import org.lanqiao.entity.Detail;
import org.lanqiao.entity.Item;
import org.lanqiao.service.DetailService;
import org.springframework.stereotype.Service;

@Service("detailService")
public class DetailServiceImpl implements DetailService {

	@Resource
	private DetailDao detailDao;
	
	@Override
	public List<Detail> getDetailById(Item item) {
		return detailDao.selectDetailById(item);
	}

	@Override
	public List<Detail> getDetailByLimit(Map map) {
		return detailDao.selectDetailByLimit(map);
	}

	@Override
	public int getTotalRecord(Item item) {
		return detailDao.selectToltalRecord(item);
	}

}
