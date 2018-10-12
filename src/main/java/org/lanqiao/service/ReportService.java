package org.lanqiao.service;

import java.util.List;

import org.lanqiao.entity.Page;
import org.lanqiao.entity.Report;
import org.lanqiao.entity.Usage;

public interface ReportService {

	public List<Report> selectAllReports();
	
	public List<Report> selectItemByBillLimit(Page page);
	
	public int getTotalRecord();
	
	public List<Usage> selectUsage();
	
}
