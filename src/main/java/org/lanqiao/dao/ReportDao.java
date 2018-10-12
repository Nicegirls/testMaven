package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Page;
import org.lanqiao.entity.Report;
import org.lanqiao.entity.Usage;

public interface ReportDao {
	public List<Report> selectAllReports();

	public List<Report> selectReportLimit(Page page);
	
	public int selectToltalRecord();
	
	public List<Usage> selectUsage();
	
	public double selectToltalTime();
}
