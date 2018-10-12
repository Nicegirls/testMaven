package org.lanqiao.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Page;
import org.lanqiao.service.FeeService;
import org.lanqiao.util.RegExpValidatorUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/fee")
public class FeeController {
	
	@Resource
	private FeeService feeService;

	private static int temp=0;
	//资费主界面
	@RequestMapping("/getAllFees")
	public String getAllFees(Model model){
		temp=0;
		Page page=new Page(1,8);
		Map<String,Object> map=new HashMap();
		map.put("page", page);
		List<Fee> lf = feeService.getAllFeesMap(map);
		page.setCount(feeService.countFee());
		model.addAttribute("page", page);
		if(lf==null){
			return "error";
		}
		else{
			model.addAttribute("fees",lf);
			return "fee/fee_list";
		}
	}
	
	//显示资费名称的具体信息
	@RequestMapping("/selectFeeByID1")
	public String selectFeeByID1(Fee fee,Model modle){
		Fee fee1 = feeService.selectFeeByID(fee);
		if(fee1 != null){
			return "fee/fee_detail";
		}else{
			return "error";
		}
	}
	
	//删除选定资费
	@RequestMapping("/deleteFee")
	public void deleteFee(Fee fee,PrintWriter out){
		boolean fals =feeService.deleteFee(fee);
		if(fals){
			out.print(1);
			return;
		}
		else{
			out.print(0);
		}
		/*Fee fee = new Fee();
		String s = request.getParameter("fee_id");
		int fee_id = Integer.parseInt(s);
		fee.setFee_id(fee_id);
		boolean fals = feeService.deleteFee(fee);
		System.out.println(fals);
		if(fals){
			return "fee/fee_list";
		}else{
			return "error";
		}*/
	}
	
//	//修改资费信息
//	@RequestMapping("/updateFee")
//	public String updateFee(HttpServletRequest request, Model model) {
//		Fee fee = new Fee();
//		String s = request.getParameter("fee_id");
//		int fee_id = Integer.parseInt(s);
//		fee.setFee_id(fee_id);
//		boolean fals = feeService.updateFee(fee);
//		if (fals) {
//			return "fee/fee_modi";
//		} else {
//			return "error";
//		}
//	}
	
	//增加资费信息
//	@RequestMapping("/insertFee")
//	public String insertFee(HttpServletRequest request,Model model){
//		Fee fee = new Fee();
//		String s = request.getParameter("fee_id");
//		int fee_id = Integer.parseInt(s);
//		fee.setFee_id(fee_id);
//		boolean fals = feeService.insertFee(fee);
//		if(fals){
//			return "fee/fee_add";
//		}else{
//			return "error";
//		}
//	}
	
	//修改资费状态
	@RequestMapping("/updateFeeState")
	public void updateFeeState(Fee fee,PrintWriter out){
		fee.setFee_otime(new Date());
		fee.setFee_status(1);
		boolean fals =feeService.updateFeeState(fee);
		if(fals){
			out.print(1);
		}
		else{
			out.print(0);
		}
	}
//	@RequestMapping("/updateFeeState")
//	public String updateFeeState(Fee fee,Model models){
//		/*Fee fee = new Fee();
//		String s = request.getParameter("fee_id");
//		int fee_id = Integer.parseInt(s);
//		fee.setFee_id(fee_id);
//		String s1 = request.getParameter("fee_status");
//		int fee_status = Integer.parseInt(s1);
//		fee.setFee_status(fee_status);
//		if(fee_status==1){
//			fee_status=2;
//			fee.setFee_id(fee_id);
//			fee.setFee_status(fee_status);
//		}else{
//			fee_status=1;
//			fee.setFee_id(fee_id);
//			fee.setFee_status(fee_status);
//		}
//		boolean fals = feeService.updateFeeState(fee);
//		if(fals){
//			return "fee/fee_list";
//		}else{
//			return "error";
//		}*/
//		System.out.println(fee.getFee_id()+"  "+fee.getFee_status());
//		boolean fals =feeService.updateFeeState(fee);
//		/*if(fals){
//			System.out.println(1);
//			out.print(true);
//			
//		}
//		else{
//			System.out.println(0);
//			out.print(false);
//		}*/
//		if(fals){
//			return "forward:/fee/getAllFees.action";
//			
//		}
//		else{
//			return "error";
//		}
//
//	}
	
	@RequestMapping("/selectFeeByID")
	public String selectFeeByID(Fee fee,Model modle){
		Fee fee1 = feeService.selectFeeByID(fee);
		if(fee1 != null){
			return "service/service_list";
		}else{
			return "error";
		}
	}
	/**
	 * 根据ID获取资费，用于填充修改页面和查看信息SYQ a==1修改 a==2查看
	 * @param fee
	 * @param modle
	 * @return
	 */
	@RequestMapping("/getFeeByID")
	public String getFeeByID(int a,Fee fee,Model model){
		fee = feeService.selectFeeByID(fee);
		model.addAttribute("fee", fee);
		if(a==1){
			return "fee/fee_modi";
		}
		if(a==2){
			return "fee/fee_detail";
		}
		return "error";
	}
	@RequestMapping("/changeFee")
	public void changeFee(Fee fee,String oldName,PrintWriter out){
		if(fee.getFee_name()==null||!RegExpValidatorUtils.isFee_name(fee.getFee_name())){
			out.print(0);
			return;
		}
		if(!oldName.equals(fee.getFee_name())){
			if(feeService.check(fee)!=null){
				out.print(2);
				return;
			}
		}
		if(fee.getFee_type()==1){
			if(fee.getFee_bfee()==0){
				out.print(0);
				return;
			}
			fee.setFee_btime(0);
			fee.setFee_ufee(0);
		}else if(fee.getFee_type()==2){
				if(fee.getFee_btime()==0 && fee.getFee_bfee()==0 && fee.getFee_ufee()==0){
				out.print(0);
				return;
			}
		}else if(fee.getFee_type()==3){
			if(fee.getFee_ufee()==0){
				out.print(0);
				return;
			}
			fee.setFee_btime(0);
			fee.setFee_bfee(0);
		}else{
			out.print(0);
			return;
		}
		int a=feeService.updateFee(fee);
		out.print(a);
	}
	/**
	 * 无法直接跳转页面，所以经过Controller跳转
	 * @return
	 */
	@RequestMapping("toFee_add")
	public String toFee_add(){
		return "fee/fee_add";
	}
	@RequestMapping("addFee")
	public void addFee(Fee fee,PrintWriter out){
		if(temp!=0){
			out.print(3);
			return;
		}
		temp+=1;
		if(fee.getFee_name()==null||!RegExpValidatorUtils.isFee_name(fee.getFee_name())){
			out.print(0);
			temp=0;
			return;
		}
		if(feeService.check(fee)!=null){
			out.print(2);
			temp=0;
			return;
		}
		if(fee.getFee_type()==1){
			if(fee.getFee_bfee()==0){
				out.print(0);
				temp=0;
				return;
			}
			fee.setFee_btime(0);
			fee.setFee_ufee(0);
		}else if(fee.getFee_type()==2){
				if(fee.getFee_btime()==0 && fee.getFee_bfee()==0 && fee.getFee_ufee()==0){
				out.print(0);
				temp=0;
				return;
			}
		}else if(fee.getFee_type()==3){
			if(fee.getFee_ufee()==0){
				out.print(0);
				temp=0;
				return;
			}
			fee.setFee_btime(0);
			fee.setFee_bfee(0);
		}else{
			out.print(0);
			temp=0;
			return;
		}
		fee.setFee_status(2);
		fee.setFee_cretime(new Date());
		int a=feeService.insertFee(fee);
		temp=0;
		out.print(a);
	}
	//资费排序
	@RequestMapping("sortFee")
	@ResponseBody
	public Map sortFee(String term,String sort,Page page){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("term", term);
		map.put("sort", sort);
		map.put("page", page);
		page.setAllPage(feeService.countFee());
		page.setCount(feeService.countFee());
		page.getAllPage();
		List<Fee> fees=feeService.sortFee(map);
		map.put("fees", fees);
		map.put("page", page);
		return map;
	}
	@RequestMapping("chartsTest")
	@ResponseBody
	public Map chartsTest(){
		Page page=new Page(1,8);
		Map<String,Object> map=new HashMap();
		map.put("page", page);
		List<Fee> fees = feeService.getAllFeesMap(map);
		page.setCount(feeService.countFee());
		map.put("fees", fees);
		return map;
	}
}
