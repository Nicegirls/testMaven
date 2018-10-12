package org.lanqiao.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.lanqiao.dao.ReportDao;
import org.lanqiao.entity.Page;
import org.lanqiao.entity.Report;
import org.lanqiao.entity.Usage;
import org.lanqiao.service.ReportService;
import org.springframework.stereotype.Service;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	@Resource
	private ReportDao reportDao;
	
	@Override
	public List<Report> selectAllReports() {
		List<Report> lr =reportDao.selectAllReports();
		List<Report> listReport =new ArrayList<>();
		for(int i=1;i<=10;i++){
			Report peport=lr.get(0);
			int temp=0;
			for(int k=1;k<lr.size();k++){
				if(peport.getBill_sumtime()<lr.get(k).getBill_sumtime()){
					peport=lr.get(k);
					temp=k;
				}
			}
			lr.remove(temp);
			listReport.add(peport);
		}
		//return reportDao.selectAllReports();
		return listReport;
	}

	@Override
	public List<Report> selectItemByBillLimit(Page page) {
		return reportDao.selectReportLimit(page);
	}
	
	@Override
	public int getTotalRecord() {
		return reportDao.selectToltalRecord();
	}

	@Override
	public List<Usage> selectUsage() {
		return reportDao.selectUsage();
	}
}
