package org.lanqiao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Bill;
import org.lanqiao.entity.Detail;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Item;
import org.lanqiao.entity.Page;
import org.lanqiao.entity.Service;
import org.lanqiao.service.BillService;
import org.lanqiao.service.DetailService;
import org.lanqiao.service.ItemService;
import org.lanqiao.service.ServiceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bill")
public class BillController {
	
	final int PAGE_SIZE=8;

	@Resource
	private BillService billService;
	@Resource
	private ItemService itemService;
	@Resource
	private DetailService detailService;
	@Resource
	private ServiceService serviceServie;

	@RequestMapping("/list")
	public String bill_list(Account account, String year, String month,Model model,String pageIndex) {
		Page page=new Page(1,PAGE_SIZE);
		if(pageIndex!=null&&!pageIndex.equals("")){
			page.setNowPage(Integer.parseInt(pageIndex));
		}
		Map<String,Object> map=new HashMap();
		map.put("page", page);
		List<Bill> listBills = billService.getBillsPage(map);
		page.setCount(billService.getTotalRecords());
		model.addAttribute("page", page);
		//List<Bill> listBills = billService.getAllBills();
		model.addAttribute("listBills", listBills);
		model.addAttribute("s_idcard",account.getAcc_idcard());
		model.addAttribute("s_name",account.getAcc_name());
		model.addAttribute("s_account",account.getAcc_account());
		model.addAttribute("s_year", year);
		model.addAttribute("s_month",month);
		return "bill/bill_list";
	}

	@RequestMapping("/item")
	public String bill_item(Bill bill, Model model,HttpSession session,String pageIndex) {
		Bill reBill = billService.getBillById(bill);
		//分页
		Page page = new Page(1,PAGE_SIZE);
		page.setCount(itemService.getTotalRecord(bill));
		if(pageIndex!=null&&!pageIndex.equals("")){
			page.setNowPage(Integer.parseInt(pageIndex));
		}
		//List<Item> listItems = itemService.getItemByBill(bill);
		Map map = new HashMap();
		map.put("bill", bill);
		map.put("page",page);
		//List<Item> listItems = itemService.selectItemByBillLimit(map);
		List<Item> listItems = itemService.updateItemSumfee(map);
		model.addAttribute("page", page);
		model.addAttribute("bill", reBill);
		session.setAttribute("bill", reBill);
		model.addAttribute("listItems", listItems);
		return "bill/bill_item";
	}

	@RequestMapping("/detail")
	public String bill_detail(Item item, Model model,String pageIndex) {
		Service service = serviceServie.getServiceByItem(item);
		Item reItem = itemService.getSerByIte(item);
		//分页
		Page page = new Page(1,PAGE_SIZE);
		if(pageIndex!=null&&!pageIndex.equals("")){
			page.setNowPage(Integer.parseInt(pageIndex));
		}
		page.setCount(detailService.getTotalRecord(reItem));
		Map map = new HashMap();
		map.put("item", reItem);
		map.put("page", page);
		//List<Detail> listDetails = detailService.getDetailById(item);
		List<Detail> listDetails = detailService.getDetailByLimit(map);
		/*Fee fee = service.getFee();
		double det_fee = 0.0;
		if (listDetails != null) {
			for (Detail d : listDetails) {
				if (fee.getFee_type() == 1) {
					det_fee = 0;
					d.setDet_fee(det_fee);
				}
				if (fee.getFee_type() == 3) {
					det_fee = fee.getFee_ufee() * (d.getDet_sumtime() / 3600.0);
				}
				if (fee.getFee_type() == 2) {
					det_fee = fee.getFee_ufee() * ((fee.getFee_btime() - d.getDet_sumtime()) / 3600.0);
				}
			}
		}*/
		model.addAttribute("page",page);
		model.addAttribute("service", service);
		model.addAttribute("listDetails", listDetails);
		model.addAttribute("item",item);
		return "bill/bill_detail";
	}

	@RequestMapping("/search")
	public String bill_search(Account account, int year, int month,Model model,String pageIndex,HttpSession session) {
		Page page = new Page(1,PAGE_SIZE);
		//page.setCount(detailService.getTotalRecord());
		if(pageIndex!=null&&pageIndex.equals("")){
			page.setNowPage(Integer.parseInt(pageIndex));
		}
		Map map = new HashMap();
		map.put("acc_idcard", account.getAcc_idcard());
		map.put("acc_name", account.getAcc_name());
		map.put("acc_account", account.getAcc_account());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date time1 = null;
		Date time2 = null;
		java.sql.Date t1 = null;
		java.sql.Date t2 = null;
		try {
			if (month != -1) {
				time1 = sdf.parse(year + "/" + month);
				time2 = sdf.parse(year + "/" + (month + 1));
			} else {
				time1 = sdf.parse(year + "/" + 1);
				time2 = sdf.parse((year + 1) + "/" + 1);
			}
			t1 = new java.sql.Date(time1.getTime());
			t2 = new java.sql.Date(time2.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// map.put("year", year);
		map.put("time1", t1);
		map.put("time2", t2);
		page.setCount(billService.getTotalRecords(map));
		map.put("page", page);
		List<Bill> listBills = billService.getBillByCon(map);
		model.addAttribute("listBills",listBills);
		model.addAttribute("s_idcard",account.getAcc_idcard());
		model.addAttribute("s_name",account.getAcc_name());
		model.addAttribute("s_account",account.getAcc_account());
		model.addAttribute("s_year", year);
		model.addAttribute("s_month",month);
		session.setAttribute("page",page);
		return "bill/bill_list";
	}

}
