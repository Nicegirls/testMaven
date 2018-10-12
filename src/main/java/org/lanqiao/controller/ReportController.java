package org.lanqiao.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lanqiao.entity.Page;
import org.lanqiao.entity.Report;
import org.lanqiao.entity.Usage;
import org.lanqiao.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/report")
public class ReportController {

	final int PAGE_SIZE = 9;
	@Resource
	private ReportService reportService;

	@RequestMapping("/getAllReport")
	public String report(Model model, String pageIndex) {
		Page page = new Page(1, PAGE_SIZE);
		page.setCount(reportService.getTotalRecord());
		if (pageIndex != null && !pageIndex.equals("")) {
			page.setNowPage(Integer.parseInt(pageIndex));
		}
		List<Report> lr = reportService.selectItemByBillLimit(page);
		// List<Report> lr = reportService.selectAllReports() ;
		model.addAttribute("page", page);
		model.addAttribute("allReports", lr);
		return "/report/report_list";
	}

	@RequestMapping("/usage")
	@ResponseBody
	public Map mealUser(){
		List<Usage> listUsage = reportService.selectUsage();
		int i=0,j=0,k=0;
		if(listUsage!=null && listUsage.size()>0){
			for(Usage usage:listUsage){
				int type = usage.getFee_type();
				if(type==1)
					i++;
				else if(type==2)
					j++;
				else if(type==3)
					k++;
			}
		}
		Map map = new HashMap();
		map.put("i", i);
		map.put("j", j);
		map.put("k", k);
		return map;
	}
	@RequestMapping("/getChart")
	@ResponseBody
	public Map getChart() {
		Map map = new HashMap();
		Page page = new Page(1,8);
		//List<Report> lr = reportService.selectItemByBillLimit(page);
		List<Report> lr = reportService.selectAllReports();
		System.out.println(lr.size());
		map.put("reports", lr);
		return map;
	}
}
